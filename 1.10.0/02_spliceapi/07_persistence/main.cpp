
#include <FabricSplice.h>
#include <string>
#include <vector>

int main(int argc, const char * argv) 
{
  FabricSplice::Initialize();

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // construct two DGNode
    graph.constructDGNode("nodeA");
    graph.constructDGNode("nodeB");

    // construct some members
    graph.addDGNodeMember("count", "Integer");
    graph.addDGNodeMember("range", "Scalar");

    // create some ports
    FabricSplice::DGPort count = graph.addDGPort("count", "count", FabricSplice::Port_Mode_IO);
    FabricSplice::DGPort range = graph.addDGPort("range", "range", FabricSplice::Port_Mode_IO);

    // set some values
    count.setRTVal(FabricSplice::constructSInt32RTVal(7));
    range.setRTVal(FabricSplice::constructFloat32RTVal(13.4));

    // create a kl op
    std::string klCode;
    klCode += "operator reportOp(Integer count, Scalar range) {\n";
    klCode += "  report('count: '+count);\n";
    klCode += "  report('range: '+range);\n";
    klCode += "}\n";
    graph.constructKLOperator("reportOp", klCode.c_str());

    // evaluate the graph
    graph.evaluate();

    // write to a file
    graph.saveToFile("test.splice");

    // create a second graph
    FabricSplice::DGGraph secondGraph("graphFromPersistence");
    secondGraph.loadFromFile("test.splice");

    // evaluate the secondGraph
    secondGraph.evaluate();
  }
  catch(FabricSplice::Exception e)
  {
    printf("%s\n", e.what());
    return 1;
  }

  FabricSplice::Finalize();
  return 0;
}