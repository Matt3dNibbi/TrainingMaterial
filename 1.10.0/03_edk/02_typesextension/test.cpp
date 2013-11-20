
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
    klCode += "require TypesExtension;\n";
    klCode += "\n";
    klCode += "operator testOp() {\n";
    klCode += "  MyVector v(3.0, 4.0);";
    klCode += "  report(v);\n";
    klCode += "  report(v.length());\n";
    klCode += "  report(v.unit());\n";
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