
from FabricEngine.SceneGraph.SceneImpl import Scene
from FabricEngine.SceneGraph.Nodes.SceneGraphNodeImpl import SceneGraphNode

class MyNode(SceneGraphNode):

  def __init__(self, scene):
    super(MyNode, self).__init__(scene)

    # build a contained Core node
    node = self.constructDGNode()
    node.addMember('a', 'Scalar', 3)
    node.addMember('b', 'Scalar', 4)
    node.addMember('c', 'Scalar')

    # build the KL operator
    self.bindDGOperator(
      node.bindings,
      name = 'myOp',
      sourceCode = 'operator myOp(Scalar a, Scalar b, io Scalar c) { c = a + b; }',
      layout = [
        'self.a',
        'self.b',
        'self.c'
      ]
    )

    # add parameters to access the data
    self.addMemberParameter(node, 'a', True) # true is for defining a setter
    self.addMemberParameter(node, 'b', True)
    self.addParameter('c', 'Scalar', self.getC)

    # add an event listener, this ensure that 
    # on value changes the UI will react
    self.addEventListener('valueChanged', self.__onValueChanged)

  def getC(self):
    self.getDGNode().evaluate()
    return self.getDGNode().getValue('c',  0)

  def __onValueChanged(self, data):
    if data['name'] in ['a', 'b']:
      self.getParameter('c').fireValueChangedEvent()

if __name__ == "__main__":
  # construct a scene
  # this manages the Core client
  scene = Scene()

  # construct a new SceneGraphNode
  myNode = MyNode(scene)

  # perform a full check on the 
  # DG layout, operator source code etc
  scene.checkErrors()

  # set some data
  myNode.getParameter('a').setValue(7.0)
  myNode.getParameter('b').setValue(9.0)

  # evaluate and return
  print myNode.getParameter('c').getValue()