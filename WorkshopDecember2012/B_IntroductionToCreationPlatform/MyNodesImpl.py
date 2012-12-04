from FabricEngine.CreationPlatform.Nodes.SceneGraphNodeImpl import SceneGraphNode

class MyValuesNode(SceneGraphNode):

  def __init__(self, scene, **options):

    super(MyValuesNode, self).__init__(scene, **options)

    # create a core node
    scalarDGNode = self.constructDGNode('Scalars')
    scalarDGNode.addMember('a', 'Scalar', 1.0)
    scalarDGNode.addMember('b', 'Scalar', 2.0)

    # resize the node for parallel computation
    count = options.setdefault('count', 100)
    scalarDGNode.resize(count)

MyValuesNode.registerNodeClass('MyValuesNode')

class MyResultsNode(SceneGraphNode):

  def __init__(self, scene, **options):

    super(MyResultsNode, self).__init__(scene, **options)

    # create a core node
    calcDGNode = self.constructDGNode('Calculator')
    calcDGNode.addMember('product', 'Scalar')
    calcDGNode.addMember('sum', 'Scalar')

    # define reference interfaces
    self.addReferenceInterface('Values', MyValuesNode, False, self.__onConnectValues)

    # add ui button
    self.setUICommand('compute', self.compute)

    # private members
    self.__operatorsConstructed = False

  def __onConnectValues(self, data):

    node = data['node']
    if not node is None:

      calcDGNode = self.getDGNode('Calculator')
      valueDGNode = node.getDGNode('Scalars')

      # connect the nodes
      calcDGNode.setDependency(valueDGNode, 'values')

      # check if we have constructed the operators yet
      if not self.__operatorsConstructed:
    
        # The operator that will resize this node
        self.bindDGOperator(calcDGNode.bindings,
          name = 'resizeOp', 
          fileName = '2_basicMath.kl',
          layout = [
            'self',
            'values'
          ]
        )

        # The operators that will perform our computation
        self.bindDGOperator(calcDGNode.bindings,
          name = 'mulOp', 
          fileName = '2_basicMath.kl',
          layout = [
            'self.index',
            'values.a<>',
            'values.b<>',
            'self.product'
          ]
        )
        self.bindDGOperator(calcDGNode.bindings,
          name = 'addOp', 
          fileName = '2_basicMath.kl',
          layout = [
            'self.index',
            'values.a<>',
            'values.b<>',
            'self.sum'
          ]
        )

        self.__operatorsConstructed = True

  def compute(self):
    self.getDGNode('Calculator').evaluate()

MyResultsNode.registerNodeClass('MyResultsNode')
