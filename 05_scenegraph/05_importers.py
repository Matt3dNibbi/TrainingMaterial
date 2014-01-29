
from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.PySide import *
from FabricEngine.SceneGraph.Nodes.Importers.AlembicImporterImpl import AlembicImporter

class MyApplication(SceneGraphApplication):

  def __init__(self, alembicFilePath):

    super(MyApplication, self).__init__(title = '05_alembicimporter')

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
      constructBboxes=False
    )

    # import all nodes
    nodes = importer.importAsset()

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
