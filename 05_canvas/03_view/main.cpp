
#include <FabricCore.h>
#include <FTL/CStrRef.h>
#include <FTL/JSONValue.h>
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

class MyNotificationRouter
{
public:  

  MyNotificationRouter(FabricCore::DFGExec & exec)
  {
    m_dfgView = exec.createView( &Callback, this );
  }

  // general notification callback.
  // the specialized callbacks below will receive the 
  // more precise information. but in case you need it you
  // can get the low level notifications here already.
  // this might be useful if you need to handle your very
  // own events.
  virtual void onNotification(FTL::CStrRef jsonStr)
  {
    printf("Notification received %s.\n", jsonStr.c_str());

    // decode json
    FTL::JSONStrWithLoc jsonStrWithLoc( jsonStr );
    FTL::OwnedPtr<FTL::JSONObject> jsonObject(
      FTL::JSONValue::Decode( jsonStrWithLoc )->cast<FTL::JSONObject>()
      );

    FTL::CStrRef descStr = jsonObject->getString( FTL_STR("desc") );
    printf("Description is: %s\n", descStr.c_str());

    /* here you can go ahead and decode further if you
       want to react to a specific notification
    */
  }

private:

  static void Callback(
    void *thisVoidPtr,
    char const *jsonCStr,
    uint32_t jsonSize
    )
  {
    static_cast<MyNotificationRouter *>( thisVoidPtr )->onNotification(
      FTL::CStrRef( jsonCStr, jsonSize )
      );
  }

  FabricCore::DFGView m_dfgView;

};

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

    // create a router which is going to receive all notifications
    MyNotificationRouter router(exec);

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
