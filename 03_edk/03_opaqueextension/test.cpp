
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
  printf("[MyLog] %s\n", message);
}

int main(int argc, const char * argv[]) 
{
  // create a client
  FabricCore::Client::CreateOptions options;
  memset( &options, 0, sizeof( options ) );

  // define the local folder as search directory for extension
  char const * localFolder = ".";
  options.numExtPaths = 1;
  options.extPaths = &localFolder;

  options.optimizationType = FabricCore::ClientOptimizationType_Background;
  FabricCore::Client client(&myLogFunc, NULL, &options);

  FabricCore::DFGBinding binding;
  try
  {
    // create a host for Canvas
    FabricCore::DFGHost host = client.getDFGHost();

    // create a binding to an empty function
    binding = host.createBindingToNewFunc();
    FabricCore::DFGExec functionExec = binding.getExec();

    // setup the kl code
    std::string klCode;
    klCode += "require OpaqueExtension;\n";
    klCode += "\n";
    klCode += "dfgEntry {\n";
    klCode += "  OpaqueType a;\n";
    klCode += "  OpaqueType b = a;\n";
    klCode += "}\n";

    // add a dependency to the extension to this canvas function
    functionExec.addExtDep("OpaqueExtension");

    // set the code on the function
    functionExec.setCode(klCode.c_str());

    // execute the binding
    binding.execute();
  }
  catch(FabricCore::Exception e)
  {
    printf("%s\n", e.getDesc_cstr());
    if(binding.isValid())
    {
      printf("%s\n", binding.getErrors(true).getCStr());
    }
    return 1;
  }

  return 0;
}
