

import FabricEngine.Core

# FabricCoreClient is the object that let you communicate with the core
fabricClient = FabricEngine.Core.createClient()


#####################################
# 3. Registering custom Types

class Vec2():
  def __init__( self, x = None, y = None ):
    if type( x ) is float and type( y ) is float:
      self.x = x
      self.y = y
    elif x is None and y is None:
      self.x = 0
      self.y = 0
    else:
      raise Exception( 'Vec2: invalid arguments' )

  def sum( self ):
    return self.x + self.y

  def add(self, other):
    return Vec2(x = self.x + other.x, \
                y = self.y + other.y)

  def __str__(self):
    return "Vec2(x = " + str(self.x) + ", y = " + str(self.y) + ")"

desc = {
  'members': [ { 'x':'Scalar' }, { 'y':'Scalar' } ],
  'constructor': Vec2,
  'klBindings': {
    'filename': "(inline)",
    'sourceCode': "\
function Vec2(Scalar x, Scalar y)\n\
{\n\
  this.x = x;\n\
  this.y = y;\n\
}\n\
\n\
function Vec2 + (Vec2 a, Vec2 b) {\n\
  return Vec2(a.x + b.x, a.y + b.y);\n\
}\n\
function Scalar Vec2.sum() {\n\
  return this.x + this.y;\n\
}\n\
"
  }
}

fabricClient.RegisteredTypesManager.registerType( 'Vec2', desc )

newVec2_1 = Vec2(3.4, 7.2)
newVec3_2 = Vec2(2.6, 17.5)

print newVec2_1.add(newVec3_2)
print (newVec2_1.add(newVec3_2)).sum()


node = fabricClient.DependencyGraph.createNode("foo")
node.addMember( 'vec2_1', 'Vec2' )
node.addMember( 'vec2_2', 'Vec2' )
node.setData( 'vec2_1', 0, newVec2_1 )
node.setData( 'vec2_2', 0, newVec3_2 )


# The operator that will create our particles
operator = fabricClient.DG.createOperator('addVec2')
operator.setEntryPoint('addVec2')
operator.setSourceCode('None', sourceCode = open('vec2Add.kl').read())

# We instanciate a Binding object. It will glue the data with the operator.
binding = fabricClient.DG.createBinding()
binding.setOperator(operator)

binding.setParameterLayout([
  'self.vec2_1',
  'self.vec2_2'
])
node.bindings.append(binding)


print node.getErrors()
node.evaluate()


print "======================"


