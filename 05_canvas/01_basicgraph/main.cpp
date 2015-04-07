
#include <DFGWrapper/DFGWrapper.h>
#include <string>

using namespace FabricServices;
using namespace DFGWrapper;

void myLogFunc(void * userData, const char * message, unsigned int length)
{
  printf("%s\n", message);
}

int main(int argc, const char * argv[]) 
{
  try
  {
    // create a client
    FabricCore::Client::CreateOptions options;
    memset( &options, 0, sizeof( options ) );
    options.optimizationType = FabricCore::ClientOptimizationType_Background;
    FabricCore::Client client(&myLogFunc, NULL, &options);

    // create a host for Canvas
    Host host(client);

    Binding binding = host.createBindingToNewGraph();
    GraphExecutablePtr graph = GraphExecutablePtr::StaticCast(binding.getExecutable());
    
    // print out some information
    printf("%s\n", graph->getDesc().c_str());
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
