
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import FabricEngine.Core

fabricClient = FabricEngine.Core.createClient()


timerNode = fabricClient.DG.createNode('timer')
timerNode.addMember('time', 'Scalar', 0)


valuesDGNode = fabricClient.DG.createNode('data')
valuesDGNode.addMember('values', 'Scalar[]')
valuesDGNode.addMember('valueCount', 'Integer', 100)
valuesDGNode.setDependency('timer', timerNode)


# The operator that will create our particles
operator = fabricClient.DG.createOperator('ComputeDataOp')
operator.setEntryPoint('computeDataOp')
operator.setSourceCode(open('dataCalculator.kl').read())


# We instanciate a Binding object. It will glue the data with the operator.
binding = fabricClient.DG.createBinding()
binding.setOperator(operator)

binding.setParameterLayout([
  'timer.time',
  'self.index',
  'self.valueCount',
  'self.values'
])

valuesDGNode.bindings.append(binding)

print timerNode.getErrors()
print valuesDGNode.getErrors()

for i in range(0, 100):
  print 'At frame:', i
  timerNode.setData('time', float(i))
  valuesDGNode.evaluate()


print "======================"