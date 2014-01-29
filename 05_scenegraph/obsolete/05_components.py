
from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes import *
from FabricEngine.SceneGraph.PySide import *

# import the previous file
import imp
MyNode = imp.load_source('MyNode', '02_scenegraphnode.py').MyNode

class MyComponent(Component):

  def __init__(self):
    super(MyComponent, self).__init__()

  @staticmethod
  def canApplyTo(sgNode):
    return isinstance(sgNode, BaseTime)

  def apply(self, sgNode):

    self.__sgNode = sgNode
    node = sgNode.getDGNode()

    # add a new parameter for our component
    node.addMember('multiplier', 'Scalar', 1.0)
    self.addMemberParameter(node, 'multiplier', True)

    # add a new KL operator
    self.__binding = sgNode.bindDGOperator(
      node.bindings,
      name = 'multiplyOp',
      layout = ['self.multiplier', 'self.c'],
      sourceCode = "operator multiplyOp(Scalar multiplier, io Scalar c) { c *= multiplier; }"
    )

    # add an event listener to update the dependent values
    self.addEventListener('valueChanged', self.__onValueChanged)

  def unapply(self, sgNode):

    node = sgNode.getDGNode()

    # remove the kl operator
    sgNode.removeDGOperatorBinding(node.bindings, self.__binding)

    # remove the member again
    node.removeMember('multiplier')

  def __onValueChanged(self, data):
    if data['name'] == 'multiplier':
      self.__sgNode.getParameter('c').fireValueChangedEvent()

class MyApplication(SceneGraphApplication):

  def __init__(self):
    super(MyApplication, self).__init__(title = '05_components')

    # setup camera and viewports
    self.setupViewports()
    self.setupCamera()
    self.setupGrid()

    # create one of our MyNode nodes
    myNode = MyNode(self.getScene())

    # apply our component
    myNode.addComponent(MyComponent())

    # create an inspector to look at our node
    inspector = SGNodeInspectorDockWidget(node=myNode)
    self.addDockWidget(QtCore.Qt.RightDockWidgetArea, inspector)

    # complete the application
    self.constructionCompleted()

if __name__ == "__main__":

  # construct a new app
  app = MyApplication()
  app.exec_()
