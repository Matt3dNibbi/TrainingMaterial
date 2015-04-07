
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
    // create a client
    FabricCore::Client::CreateOptions options;
    memset( &options, 0, sizeof( options ) );
    options.optimizationType = FabricCore::ClientOptimizationType_Background;
    FabricCore::Client client(&myLogFunc, NULL, &options);

    // create a host for Canvas
    DFGWrapper::Host host(client);

    DFGWrapper::Binding binding = host.createBindingToNewGraph();
    DFGWrapper::GraphExecutablePtr graph = DFGWrapper::GraphExecutablePtr::StaticCast(binding.getExecutable());

    // add a report node
    DFGWrapper::NodePtr reportNode = graph->addNodeFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    graph->addPort("caption", FabricCore::DFGPortType_In);
    graph->addPort("result", FabricCore::DFGPortType_Out);

    // connect things up
    graph->getPort("caption")->connectTo(reportNode->getPin("value"));
    reportNode->getPin("value")->connectTo(graph->getPort("result"));

    // setup the values to perform on
    FabricCore::RTVal value = FabricCore::RTVal::ConstructString(client, "test test test");
    binding.setArgValue("result", value);
    binding.setArgValue("caption", value);

    // execute the graph
    binding.execute();
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
