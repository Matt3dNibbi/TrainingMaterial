
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

    // get access to the host (the base object for all canvas type execution)
    FabricCore::DFGHost host = client.getDFGHost();

    // load the json file's content
    // using a relative local path to the canvas file
    std::string json;
    FILE * jsonFile = fopen("add.canvas", "rb");
    if(jsonFile != NULL)
    {
      fseek( jsonFile, 0, SEEK_END );
      int fileSize = ftell( jsonFile );
      rewind( jsonFile );

      char * jsonBuffer = (char*) malloc(fileSize + 1);
      jsonBuffer[fileSize] = '\0';

      fread(jsonBuffer, fileSize, 1, jsonFile);
      fclose(jsonFile);

      json = jsonBuffer;
      free(jsonBuffer);
    }

    // create an "instance" of the data flow graph based on the json
    FabricCore::DFGBinding binding = host.createBindingFromJSON(json.c_str(), 0, NULL); // no args
    
    // create the a and b values
    FabricCore::RTVal a = FabricCore::RTVal::ConstructFloat32(client, 7.0);
    FabricCore::RTVal b = FabricCore::RTVal::ConstructFloat32(client, 8.0);

    binding.setArgValue("a", a, false /* record undo */);
    binding.setArgValue("b", b, false /* record undo */);

    binding.execute();

    FabricCore::RTVal sum = binding.getArgValue("sum");
    printf("C++ has result: %f\n", sum.getFloat32());
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
