
#include <FabricSplice.h>
#include <string>

int main(int argc, const char * argv) 
{
  FabricSplice::Initialize();

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // check the license
    if(!FabricSplice::isLicenseValid()) {
      printf("No license found!\n");
      FabricSplice::Finalize();
      return 1;
    }

    // create the first DGNode
    graph.constructDGNode("myNode");

    // setup the kl code
    std::string klCode = "operator helloWorldOp() { report('Hello World!'); }";
    graph.constructKLOperator("helloWorldOp", klCode.c_str());

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