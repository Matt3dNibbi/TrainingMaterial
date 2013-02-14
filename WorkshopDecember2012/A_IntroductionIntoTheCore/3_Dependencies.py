
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
calcNode.setDependency('values', scalarNode)

# The operator that will perform our computation
addOp = fabricClient.DG.createOperator('addOp')
addOp.setEntryPoint('addOp')
addOp.setSourceCode(open('3_basicMath.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
addBinding = fabricClient.DG.createBinding()
addBinding.setOperator(addOp)
addBinding.setParameterLayout([
  'values.a',
  'values.b',
  'self.sum'
])

# The operator that will perform our computation
mulOp = fabricClient.DG.createOperator('mulOp')
mulOp.setEntryPoint('mulOp')
mulOp.setSourceCode(open('3_basicMath.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
mulBinding = fabricClient.DG.createBinding()
mulBinding.setOperator(mulOp)
mulBinding.setParameterLayout([
  'values.a',
  'values.b',
  'self.product'
])

calcNode.bindings.append(addBinding)
calcNode.bindings.append(mulBinding)

print calcNode.getErrors()

calcNode.evaluate()
