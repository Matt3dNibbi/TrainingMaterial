
#include <FabricSplice.h>
#include <string>

int main(int argc, const char * argv) 
{
  FabricSplice::Initialize();

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create the first DGNode
    graph.constructDGNode("myNode");

    // define a couple of members
    graph.addDGNodeMember("a", "Scalar");
    graph.addDGNodeMember("b", "Scalar");
    graph.addDGNodeMember("c", "Scalar");

    // define a couple of ports
    FabricSplice::DGPort portA = graph.addDGPort("a", "a", FabricSplice::Port_Mode_IN);
    FabricSplice::DGPort portB = graph.addDGPort("b", "b", FabricSplice::Port_Mode_IN);
    FabricSplice::DGPort portC = graph.addDGPort("c", "c", FabricSplice::Port_Mode_OUT);

    // set the values
    portA.setJSON("4.2");
    portB.setRTVal(FabricSplice::constructFloat32RTVal(1.3));

    // create a KL operator
    graph.constructKLOperator("myProductOp", "operator myProductOp(Scalar a, Scalar b, io Scalar c) { c = a * b; }");

    // perform
    graph.evaluate();

    // pull out C and print
    float c = portC.getRTVal().getFloat32();
    printf("compute result %f\n", c);
  }
  catch(FabricSplice::Exception e)
  {
    printf("%s\n", e.what());
    return 1;
  }

  FabricSplice::Finalize();
  return 0;
}