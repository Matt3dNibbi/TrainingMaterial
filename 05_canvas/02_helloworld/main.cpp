
#include <FabricCore.h>
#include <string>

void myLogFunc(
  void * userData, 
  FEC_ReportSource source,
  FEC_ReportLevel level,
  const char * message, 
  unsigned int length
  )
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
    FabricCore::DFGHost host = client.getDFGHost();

    FabricCore::DFGBinding binding = host.createBindingToNewGraph();
    FabricCore::DFGExec exec = binding.getExec();

    // add a report node
    std::string reportNode = exec.addInstFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    exec.addExecPort("caption", FabricCore::DFGPortType_In);
    exec.addExecPort("result", FabricCore::DFGPortType_Out);

    // connect things up
    exec.connectTo("caption", (reportNode + ".value").c_str());
    exec.connectTo((reportNode + ".value").c_str(), "result");

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
