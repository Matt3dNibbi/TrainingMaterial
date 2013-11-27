import glob

from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.PySide import *
from FabricEngine.SceneGraph.Nodes.Importers.AlembicImporterImpl import AlembicImporter

class MyApplication(SceneGraphApplication):

  def __init__(self, alembicFilePath):

    super(MyApplication, self).__init__(title = '07_driving_textures')

    # setup camera and viewports
    self.setupViewports()
    self.setupCamera()
    self.setupGrid()
    self.setupSelection()

    # query the constructed components
    scene = self.getScene()

    # create the importer
    importer = AlembicImporter(scene, 
      filePath=alembicFilePath, 
      constructSubDMeshes=False,
      constructLines=False,
      constructPoints=False,
      constructBboxes=False,
      constructMaterials=False # also decide to disable materials
    )

    # create the textures node
    textures = Image2DLibrary(scene)
    jpgPaths = glob.glob('*.jpg')
    for i in range(len(jpgPaths)):
      textures.addImage('texture'+str(i), jpgPaths[i])

    # import all nodes
    nodes = importer.importAsset()

    # creates some uvs using KL
    nodes['polygonMeshes'].bindDGOperator(
      nodes['polygonMeshes'].getDGNode('Geometry').bindings,
      name = 'createSomeUVs',
      layout = [
        'self.polygonMesh'
      ],
      sourceCode = """
        require Math;
        require PolygonMesh;

        operator createSomeUVs(io PolygonMesh mesh) {
          GeometryAttributes attributes = mesh.getAttributes();
          Ref<Vec2Attribute> uvs0 = attributes.getOrCreateAttribute('uvs0', Vec2Attribute);
          for(Size i=0;i<mesh.pointCount();i++)
          {
            Vec3 pos = mesh.getPointPosition(i);
            Vec2 uv;
            uv.x = Math_clamp((pos.x + 10.0) / 20.0, 0.0, 1.0);
            uv.y = Math_clamp((pos.y + 6.0) / 12.0, 0.0, 1.0);
            mesh.setPointAttribute(i, uvs0, uv);
          }
        }
      """)

    # create another custom material
    material = Material(scene, xmlFile='PhongTexturedMaterial')
    material.addPreset(name = 'proceduralPreset0', diffuseTexture = textures)

    # add a KL operator to the material to create 20 colors in KL
    # this could be done in python too, but for the sake of proceduralism
    # let's do it in KL
    material.bindDGOperator(
      material.getDGNode('Values').bindings,
      index = 0, # at the beginning of the stack
      name = 'constructVaryingTexturePresets',
      layout = [
        'self', 
        'self.presetName<>',
        'self.textureValues_textureNodeIndex<>',
        'self.textureValues_textureNodeSlice<>'
      ],
      sourceCode = """
        require Math;

        operator constructVaryingTexturePresets(
          io Container self, 
          io String presetName<>,
          io Integer textureValues_textureNodeIndex<>[],
          io Integer textureValues_textureNodeSlice<>[]
        ) {
          // resize the node
          self.resize(20);

          // set the values for each
          for(Size i=0;i<self.size();i++) {
            presetName[i] = 'proceduralPreset'+i;
            textureValues_textureNodeIndex[i][2] = 0;
            textureValues_textureNodeSlice[i][2] = i % 4;
          }
        }
      """)

    # connect the geometry instance to the new custom material
    nodes['meshPhongInstances'].getInPort('Material').setConnectedNode(material)

    # add a KL operator which changes the material assignments for each
    # geometry instance
    nodes['meshPhongInstances'].bindDGOperator(
      nodes['meshPhongInstances'].getDGNode().bindings,
      name = 'pickMaterialPresetUsingModulo',
      layout = [
        'self.materialPresetIndex<>', 
        'self.materialPresetName<>', 
        'materialPresets.materialParams'
      ],
      sourceCode = """
        require Math;

        operator pickMaterialPresetUsingModulo(
            io Integer presetIndex<>, 
            io String presetName<>, 
            io RenderParamValues materialParams[][]
        ) {
          if(materialParams.size() == 0)
            return;
          for(Size i=0;i<presetIndex.size();i++) {
            presetIndex[i] = i % materialParams[0].size();
            presetName[i] = 'proceduralPreset'+presetIndex[i];
          }
        }
      """)

    # complete the application
    self.constructionCompleted()

if __name__ == "__main__":

  args = sys.argv
  if len(args) == 1:
    print 'No filepath provided as command line argument!'
    sys.exit(0)

  # construct a new app (passing the first command line arg)
  app = MyApplication(args[1])
  app.exec_()
