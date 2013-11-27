
from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.PySide import *
from FabricEngine.SceneGraph.Nodes.Importers.AlembicImporterImpl import AlembicImporter

class MyApplication(SceneGraphApplication):

  def __init__(self, alembicFilePath):

    super(MyApplication, self).__init__(title = '06_driving_materials')

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

    # import all nodes
    nodes = importer.importAsset()

    # create another custom material
    material = Material(scene, xmlFile='PhongMaterial', diffuseColor=Color(0.0,1.0,0.0), reflectionFactor=0.3)

    # add a KL operator to the material to create 20 colors in KL
    # this could be done in python too, but for the sake of proceduralism
    # let's do it in KL
    material.bindDGOperator(
      material.getDGNode('Values').bindings,
      index = 0, # at the beginning of the stack
      name = 'constructTwentyPhongMaterialPresets',
      layout = [
        'self', 
        'self.diffuseColor<>',
        'self.presetName<>'
      ],
      sourceCode = """
        require Math;

        operator constructTwentyPhongMaterialPresets(
          io Container self, 
          io Color colors<>, 
          io String presetName<>
        ) {
          // resize the node
          self.resize(20);

          // set the values for each
          for(Size i=0;i<self.size();i++) {
            colors[i].r = mathRandomScalar(12, i);
            colors[i].g = mathRandomScalar(91, i);
            colors[i].b = mathRandomScalar(31823, i);
            colors[i].a = 1.0;
            presetName[i] = 'proceduralPreset'+i;
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
