
#include <FabricSplice.h>
#include <string>

void myLogFunc(const char * message, unsigned int length)
{
  printf("[SPLICE] %s\n", message);
}

void myErrorLogFunc(const char * message, unsigned int length)
{
  printf("[ERROR] %s\n", message);
}

void myKLFunc(const char * message, unsigned int length)
{
  printf("[KL] %s\n", message);
}

int main(int argc, const char * argv[]) 
{
  FabricSplice::Initialize();

  FabricSplice::Logging::setLogFunc(myLogFunc);
  FabricSplice::Logging::setLogErrorFunc(myErrorLogFunc);
  FabricSplice::Logging::setKLReportFunc(myKLFunc);

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create the first DGNode
    graph.constructDGNode("myNode");

    // setup the kl code
    std::string klCode = "operator reportOp() { report('From KL!'); }";
    graph.constructKLOperator("reportOp", klCode.c_str());

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
