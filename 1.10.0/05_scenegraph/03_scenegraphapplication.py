
from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.PySide import *

# import the previous file
import imp
MyNode = imp.load_source('MyNode', '02_scenegraphnode.py').MyNode

class MyApplication(SceneGraphApplication):

  def __init__(self):
    super(MyApplication, self).__init__()

    # create one of our MyNode nodes
    myNode = MyNode(self.getScene())

    # create an inspector to look at our node
    inspector = SGNodeInspectorDockWidget(node=myNode)
    self.addDockWidget(QtCore.Qt.RightDockWidgetArea, inspector)

    # complete the application
    self.constructionCompleted()

if __name__ == "__main__":

  # construct a new app
  app = MyApplication()
  app.exec_()
