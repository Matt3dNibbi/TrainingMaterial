
import FabricEngine.Core as Core

# construct the client
client = Core.createClient()

# get access to the dependency graph
# and construct a DG node
node = client.DG.createNode('myNode')

# create some members
node.addMember("a", "Scalar", 3)
node.addMember("b", "Scalar", 4)
node.addMember("c", "Scalar")

# construct a KL operator
operator = client.DG.createOperator('myOp')
operator.setSourceCode("""
  operator myOp(Scalar a, Scalar b, io Scalar c) {
    c = a + b;
  }
""")
operator.setEntryPoint('myOp')

# create a binding, to connect the operator
# parameters to the node data members
binding = client.DG.createBinding()
binding.setOperator(operator)
binding.setParameterLayout([
  'self.a',
  'self.b',
  'self.c'
])

# put the binding (with its operator)
# onto the binding stack of the node
node.bindings.append(binding)

# evaluate the node
node.evaluate()

# extract the value
print node.getValue('c', 0)