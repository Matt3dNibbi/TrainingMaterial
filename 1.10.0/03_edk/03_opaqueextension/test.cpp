
#include <FabricSplice.h>
#include <string>

int main(int argc, const char * argv) 
{
  FabricSplice::Initialize();

  // use the local folder for finding extensions
  FabricSplice::addExtFolder(".");

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create the first DGNode
    graph.constructDGNode("testNode");

    // setup the kl code
    std::string klCode;
    klCode += "require OpaqueExtension;\n";
    klCode += "\n";
    klCode += "operator testOp() {\n";
    klCode += "  OpaqueType a;\n";
    klCode += "  OpaqueType b = a;\n";
    klCode += "}\n";
    graph.constructKLOperator("testOp", klCode.c_str());

    // evaluate the graph
    graph.evaluate();
  }
  catch(FabricSplice::Exception e)
  {
    printf("%s\n", e.what());
    return 1;
  }

  FabricSplice::Finalize();
  return 0;
}