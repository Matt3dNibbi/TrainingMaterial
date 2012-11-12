
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

#####################################
# 3. Wrapping the Core DG elements in Python classes 

import FabricEngine.Core

class TimerNode(object):

  def __init__(self, client):

    # The dependency graph node is a private member
    #  that can only be accessed via accessor methods. 
    self.__timerNode = client.DG.createNode('timer')
    self.__timerNode.addMember('time', 'Scalar', 0)
    self.__dependents = []

  def getDGNode(self):
    return self.__timerNode

  def addDependent(self, node):
    self.__dependents.append(node)

  def evaluateTimeRange(self):
    # To trigger evaluations of the Core graph, we modify
    # the values tored in the Timer node, and then trigger
    # evaluations in the dependent nodes. 
    # Note: generally graph evaluations are triggered by rendering
    # or export processes. Manual evaluation of graphs is not usually required.
    for i in range(0, 100):
      print 'At frame:', i
      self.__timerNode.setData('time', float(i))
      for dep in self.__dependents:
        dep.evaluate()


class DataCalculator(object):

  __numDataCalculators = 0
  __operator = None

  def __init__(self, client, valueCount=1, sliceCount=1):
    # Core dependency graph nodes must have unique names. 
    # Construct a Dependency Graph node, giving it a 
    # unique name for each instance of DataCalculator.
    self.__class__.__numDataCalculators += 1
    self.__valuesDGNode = client.DG.createNode('data' + str(self.__class__.__numDataCalculators))
    self.__valuesDGNode.addMember('values', 'Scalar[]')
    self.__valuesDGNode.addMember('valueCount', 'Integer', valueCount)


    # By setting the slice count of a node to 100, the node's data mambers are all duplicated
    # by 100 times, and the bound operator will evaluate once for each slice. 
    # This gives us an easy method of 'instancing' a node many times. 
    self.__valuesDGNode.setCount(sliceCount)

    # Compile the shared operator.
    # The operator is a class variable as it can be shared
    # amongst all instances of DataCalculator, meaning the KL code
    # is only compiled once.
    if self.__class__.__operator is None:
      self.__class__.__operator = client.DG.createOperator('ComputeDataOp')
      self.__class__.__operator.setEntryPoint('computeDataOp')
      self.__class__.__operator.setSourceCode(open('dataCalculator.kl').read())

    # We instantiate a Binding object. It will glue the data with the operator.
    binding = client.DG.createBinding()
    binding.setOperator(self.__class__.__operator)

    binding.setParameterLayout([
      'timer.time',
      'self.index',
      'self.valueCount',
      'self.values'
    ])

    self.__valuesDGNode.bindings.append(binding)

  def setTimerNode(self, timerNode):
    # Create a relatonship between the TimerNode and the DataCalculator, 
    # so the timeer can update the calculator when the time value changes.
    self.__valuesDGNode.setDependency(timerNode.getDGNode(), 'timer')
    timerNode.addDependent(self)

  def evaluate(self):
    self.__valuesDGNode.evaluate()


fabricClient = FabricEngine.Core.createClient()

timerNode = TimerNode(fabricClient)
myDataCalculator1 = DataCalculator(fabricClient, valueCount=200, sliceCount=5)
myDataCalculator2 = DataCalculator(fabricClient, valueCount=500, sliceCount=7)
myDataCalculator1.setTimerNode(timerNode)
myDataCalculator2.setTimerNode(timerNode)

timerNode.evaluateTimeRange()

print "======================"

