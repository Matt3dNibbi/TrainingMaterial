
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import FabricEngine.Core

fabricClient = FabricEngine.Core.createClient()

scalarNode = fabricClient.DG.createNode('Scalars')
scalarNode.addMember('a', 'Scalar', 1.0)
scalarNode.addMember('b', 'Scalar', 2.0)

calcNode = fabricClient.DG.createNode('Calculator')
calcNode.addMember('product', 'Scalar')
calcNode.addMember('sum', 'Scalar')

# Create a dependency called 'values'
calcNode.setDependency(scalarNode, 'values')

# The operator that will resize the node to allocate enough space
computeOp = fabricClient.DG.createOperator('computeOp')
computeOp.setEntryPoint('computeOp')
computeOp.setSourceCode(open('5_basicMath.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
computeBinding = fabricClient.DG.createBinding()
computeBinding.setOperator(computeOp)
computeBinding.setParameterLayout([
  'self',
  'values',
  'values.a<>',
  'values.b<>',
  'self.product<>',
  'self.sum<>'
])

calcNode.bindings.append(computeBinding)

print calcNode.getErrors()

scalarNode.resize(100)

# init the data
for i in range(scalarNode.size()):
  scalarNode.setData('a', i, float(i))
  scalarNode.setData('b', i, float(i * 2))

calcNode.evaluate()
