
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

from FabricEngine.CreationPlatform.SceneImpl import Scene
from FabricEngine.CreationPlatform.Nodes.SceneGraphNodeImpl import SceneGraphNode

class MyNode(SceneGraphNode):

  def __init__(self, scene, **options):

    super(MyNode, self).__init__(scene, **options)

    # create a core node
    scalarNode = self.constructDGNode('Scalars')
    scalarNode.addMember('a', 'Scalar', 1.0)
    scalarNode.addMember('b', 'Scalar', 2.0)
    scalarNode.addMember('result', 'Scalar')

    # The operator that will perform our computation
    self.bindDGOperator(scalarNode.bindings,
      name = 'addOp', 
      fileName = '1_basicMath.kl',
      layout = [
        'self.a',
        'self.b',
        'self.result'
      ]
    )

  def compute(self):
    self.getDGNode('Scalars').evaluate()

scene = Scene(None)
node = MyNode(scene)
node.compute()

scene.close()