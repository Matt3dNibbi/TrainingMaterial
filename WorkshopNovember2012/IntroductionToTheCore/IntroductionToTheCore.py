
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

# import FabricEngine.Core

# # FabricCoreClient is the object that let you communicate with the core
# FabricCoreClient = FabricEngine.Core.createClient()


# timerNode = FabricCoreClient.DG.createNode('timer')
# timerNode.addMember('time', 'Scalar', 0)


# valuesDGNode = FabricCoreClient.DG.createNode('data')
# valuesDGNode.addMember('values', 'Scalar[]')
# valuesDGNode.addMember('valueCount', 'Integer', 100)
# valuesDGNode.setDependency(timerNode, 'timer')


# # The operator that will create our particles
# operator = FabricCoreClient.DG.createOperator('ComputeDataOp')
# operator.setEntryPoint('computeDataOp')
# operator.setSourceCode('None', sourceCode = open('dataCalculator.kl').read())

# # We instanciate a Binding object. It will glue the data with the operator.
# binding = FabricCoreClient.DG.createBinding()
# binding.setOperator(operator)

# binding.setParameterLayout([
#   'timer.time',
#   'self.index',
#   'self.valueCount',
#   'self.values'
# ])

# valuesDGNode.bindings.append(binding)

# print timerNode.getErrors()
# print valuesDGNode.getErrors()

# # for i in range(0, 100):
# #   print 'At frame:', i
# #   timerNode.setData('time', float(i))
# #   valuesDGNode.evaluate()

  


# #####################################
# # 2. Data based parallelizm

# valuesDGNode.setCount(10)

# for i in range(0, 100):
#   print 'At frame:', i
#   timerNode.setData('time', float(i))
#   valuesDGNode.evaluate()



  

#####################################
# 3. Wrapping the Core DG elements in Python classes 

import FabricEngine.Core

class MyTimerNode(object):

  def __init__(self, client):

    self.__timerNode = client.DG.createNode('timer')
    self.__timerNode.addMember('time', 'Scalar', 0)
    self.__dependents = []

  def getDGNode(self):
    return self.__timerNode

  #   def addDependent(self, node):
  #     self.__dependents.append(node)

    # def evaluateTimeRange(self):
    #   for i in range(0, 100):
    #     print 'At frame:', i
    #     self.__timerNode.setData('time', float(i))
    #     for dep in self.__dependents:
    #       dep.evaluate()


class MyDataCalculator(object):

  __numDataCalculators = 0
  __operator = None

  def __init__(self, client, valueCount=1):

    self.__class__.__numDataCalculators += 1

    self.__valuesDGNode = client.DG.createNode('data' + str(self.__class__.__numDataCalculators))
    self.__valuesDGNode.addMember('values', 'Scalar[]')
    self.__valuesDGNode.addMember('valueCount', 'Integer', valueCount)

    # Compile the shared operator
    if self.__class__.__operator is None:
      self.__class__.__operator = client.DG.createOperator('ComputeDataOp')
      self.__class__.__operator.setEntryPoint('computeDataOp')
      self.__class__.__operator.setSourceCode('None', sourceCode = open('dataCalculator.kl').read())

    # We instanciate a Binding object. It will glue the data with the operator.
    binding = client.DG.createBinding()
    binding.setOperator(self.__class__.__operator)

    binding.setParameterLayout([
      'timer.time',
      'self.index',
      'self.valueCount',
      'self.values'
    ])

    self.__valuesDGNode.bindings.append(binding)

  #   def setTimerNode(self, timerNode):
  #     self.__valuesDGNode.setDependency(timerNode.getDGNode(), 'timer')
  #     timerNode.addDependent(self)

  #   def evaluate(self):
  #     self.__valuesDGNode.evaluate()


FabricCoreClient = FabricEngine.Core.createClient()

timerNode = MyTimerNode(FabricCoreClient)
myDataCalculator1 = MyDataCalculator(FabricCoreClient, valueCount=200)

  # myDataCalculator2 = MyDataCalculator(FabricCoreClient, valueCount=500)
  # myDataCalculator2.setTimerNode(timerNode)

  # timerNode.evaluateTimeRange()

print "======================"

