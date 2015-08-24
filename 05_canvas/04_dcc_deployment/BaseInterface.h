#ifndef __BASEINTERFACE_H__
#define __BASEINTERFACE_H__

#include <FabricCore.h>
#include <FTL/CStrRef.h>
#include <FTL/JSONValue.h>
#include <map>

// a management class for client and host
class BaseInterface
{
public:
  BaseInterface();
  ~BaseInterface();

  // instance management
  // right now there are no locks in place,
  // assuming that the DCC will only access
  // these things from the main thread.
  unsigned int getId();
  static BaseInterface * getFromId(unsigned int id);

  // accessors
  static FabricCore::Client * getClient();
  static FabricCore::DFGHost & getHost();
  FabricCore::DFGBinding & getBinding();

  // persistence
  std::string getJSON();
  void setFromJSON(const std::string & json);

  // logging.
  static void setLogFunc(void (*in_logFunc)(void *, FTL::CStrRef));

  // binding notification callback.
  virtual void onBindingNotification(FTL::CStrRef jsonStr)
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

  // exec notification callback.
  virtual void onExecNotification(FTL::CStrRef jsonStr)
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

  static void logFunc(
    void * userData, 
    FEC_ReportSource source,
    FEC_ReportLevel level,
    const char * message, 
    unsigned int length
    );
  static void (*s_logFunc)(void *, FTL::CStrRef message);

  static void ExecCallback(
    void *thisVoidPtr,
    char const *jsonCStr,
    uint32_t jsonSize
    )
  {
    static_cast<BaseInterface *>( thisVoidPtr )->onExecNotification(
      FTL::CStrRef( jsonCStr, jsonSize )
      );
  }

  static void BindingCallback(
    void *thisVoidPtr,
    char const *jsonCStr,
    uint32_t jsonSize
    )
  {
    static_cast<BaseInterface *>( thisVoidPtr )->onBindingNotification(
      FTL::CStrRef( jsonCStr, jsonSize )
      );
  }

  static FabricCore::Client s_client;
  static FabricCore::DFGHost s_host;
  FabricCore::DFGBinding m_binding;
  FabricCore::DFGView m_dfgView;
  unsigned int m_id;
  static unsigned int s_maxId;
  static std::map<unsigned int, BaseInterface*> s_instances;
};

#endif
