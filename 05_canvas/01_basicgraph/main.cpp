
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
    
    // print out some information
    printf("%s\n", exec.getDesc().getCString());
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
