
#include <DFGWrapper/DFGWrapper.h>
#include <string>

using namespace FabricServices;

void myLogFunc(void * userData, const char * message, unsigned int length)
{
  printf("%s\n", message);
}

int main(int argc, const char * argv[]) 
{
  try
  {
    // create a
    FabricCore::Client::CreateOptions options;
    memset( &options, 0, sizeof( options ) );
    options.optimizationType = FabricCore::ClientOptimizationType_Background;
    FabricCore::Client client(&myLogFunc, NULL, &options);

    // create a host for Canvas
    DFGWrapper::Host host(client);

    DFGWrapper::Binding binding = host.createBindingToNewGraph();
    DFGWrapper::GraphExecutable graph = binding.getGraph();
    
    printf("%s\n", graph.getDesc().c_str());
    printf("%s\n", graph.getObjectType().c_str());
    printf("%s\n", graph.exportJSON().c_str());
    printf("%s\n", graph.getImportPathname().c_str());

    DFGWrapper::Port value1 = graph.addPort("value1", FabricCore::DFGPortType_In, "Scalar");
    DFGWrapper::Port value2 = graph.addPort("value2", FabricCore::DFGPortType_In, "Scalar");
    DFGWrapper::Port result = graph.addPort("result", FabricCore::DFGPortType_Out, "Scalar");
    printf("%s\n", graph.getImportPathname().c_str());
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
