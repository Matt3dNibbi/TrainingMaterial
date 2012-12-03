
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import FabricEngine.Core

fabricClient = FabricEngine.Core.createClient()


scalarNode = fabricClient.DG.createNode('Scalars')
scalarNode.addMember('a', 'Scalar', 1.0)
scalarNode.addMember('b', 'Scalar', 2.0)
scalarNode.addMember('result', 'Scalar')

# The operator that will perform our computation
addOp = fabricClient.DG.createOperator('addOp')
addOp.setEntryPoint('addOp')
addOp.setSourceCode(open('1_basicMath.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
binding = fabricClient.DG.createBinding()
binding.setOperator(addOp)

binding.setParameterLayout([
  'self.a',
  'self.b',
  'self.result'
])

scalarNode.bindings.append(binding)

print scalarNode.getErrors()

scalarNode.resize(100)

# init the data
for i in range(scalarNode.size()):
  scalarNode.setData('a', i, float(i))
  scalarNode.setData('b', i, float(i * 2))

scalarNode.evaluate()
