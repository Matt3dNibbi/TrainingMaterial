
#
# Copyright 2010-2012 Fabric Technologies Inc. All rights reserved.
#

import os.path
import FabricEngine.Core

fabricClient = FabricEngine.Core.createClient()

#####################################
# 3. Registering custom Types

class Vec3():
  def __init__( self, x = None, y = None, z = None ):
    if type( x ) is float and type( y ) is float and type( z ) is float:
      self.x = x
      self.y = y
      self.z = z
    elif x is None and y is None:
      self.x = 0
      self.y = 0
      self.z = 0
    else:
      raise Exception( 'Vec3: invalid arguments' )

  def add(self, other):
    return Vec3(x = self.x + other.x, \
                y = self.y + other.y, \
                z = self.z + other.z)

  def mul( self, other ):
    return Vec3(x = self.x * other.x, \
                y = self.y * other.y, \
                z = self.z * other.z)

  def __str__(self):
    return "Vec3(x = " + str(self.x) + ", y = " + str(self.y) + ", z = " + str(self.z) + ")"

desc = {
  'members': [ { 'x':'Scalar' }, { 'y':'Scalar' }, { 'z':'Scalar' } ],
  'constructor': Vec3,
  'klBindings': {
    'sourceCode': open('Vec3.kl').read()
  }
}

fabricClient.RegisteredTypesManager.registerType( 'Vec3', desc )

# construct two python vectors
a = Vec3(3.4, 7.2, 12.1)
b = Vec3(2.6, 17.5, 9.1)

# print their math results
print a.add(b)
print a.mul(b)

vec3Node = fabricClient.DG.createNode('Scalars')
vec3Node.addMember('a', 'Vec3', a)
vec3Node.addMember('b', 'Vec3', b)

calcNode = fabricClient.DG.createNode('Calculator')
calcNode.addMember('product', 'Vec3')
calcNode.addMember('sum', 'Vec3')

# Create a dependency called 'values'
calcNode.setDependency(vec3Node, 'values')

# The operator that will resize the node to allocate enough space
computeOp = fabricClient.DG.createOperator('vec3ComputeOp')
computeOp.setEntryPoint('vec3ComputeOp')
computeOp.setSourceCode(open('6_vec3Math.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
computeBinding = fabricClient.DG.createBinding()
computeBinding.setOperator(computeOp)
computeBinding.setParameterLayout([
  'values.a',
  'values.b',
  'self.sum',
  'self.product'
])

calcNode.bindings.append(computeBinding)

# execute the node
print calcNode.getErrors()
calcNode.evaluate()

# retrieve the data as python types!
sumFromKL = calcNode.getData('sum')
productFromKL = calcNode.getData('product')
print sumFromKL
print productFromKL