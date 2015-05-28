#ifndef __BASEINTERFACE_H__
#define __BASEINTERFACE_H__

#include <DFGWrapper/DFGWrapper.h>
#include <ASTWrapper/KLASTManager.h>
#include <Commands/CommandStack.h>
#include <map>

// a management class for client and host
class BaseInterface : public FabricServices::DFGWrapper::View
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
  static FabricServices::DFGWrapper::Host * getHost();
  FabricServices::DFGWrapper::Binding * getBinding();
  static FabricServices::ASTWrapper::KLASTManager * getManager();
  static FabricServices::Commands::CommandStack * getStack();

  // persistence
  std::string getJSON();
  void setFromJSON(const std::string & json);

  // logging.
  static void setLogFunc(void (*in_logFunc)(void *, const char *, unsigned int));

  // notifications
  // for now we only implement onPortInserted and onPortRemoved
  virtual void onNotification(char const * json) {}
  virtual void onNodeInserted(FabricServices::DFGWrapper::NodePtr node) {}
  virtual void onNodeRemoved(FabricServices::DFGWrapper::NodePtr node) {}
  virtual void onNodePortInserted(FabricServices::DFGWrapper::NodePortPtr pin) {}
  virtual void onNodePortRemoved(FabricServices::DFGWrapper::NodePortPtr pin) {}
  virtual void onExecPortInserted(FabricServices::DFGWrapper::ExecPortPtr port) {}
  virtual void onExecPortRemoved(FabricServices::DFGWrapper::ExecPortPtr port) {}
  virtual void onPortsConnected(FabricServices::DFGWrapper::PortPtr src, FabricServices::DFGWrapper::PortPtr dst) {}
  virtual void onPortsDisconnected(FabricServices::DFGWrapper::PortPtr src, FabricServices::DFGWrapper::PortPtr dst) {}
  virtual void onNodeMetadataChanged(FabricServices::DFGWrapper::NodePtr node, const char * key, const char * metadata) {}
  virtual void onNodeTitleChanged(FabricServices::DFGWrapper::NodePtr node, const char * title) {}
  virtual void onExecPortRenamed(FabricServices::DFGWrapper::ExecPortPtr port, const char * oldName) {}
  virtual void onNodePortRenamed(FabricServices::DFGWrapper::NodePortPtr pin, const char * oldName) {}
  virtual void onExecMetadataChanged(FabricServices::DFGWrapper::ExecutablePtr exec, const char * key, const char * metadata) {}
  virtual void onExtDepAdded(const char * extension, const char * version) {}
  virtual void onExtDepRemoved(const char * extension, const char * version) {}
  virtual void onNodeCacheRuleChanged(const char * path, const char * rule) {}
  virtual void onExecCacheRuleChanged(const char * path, const char * rule) {}
  virtual void onExecPortResolvedTypeChanged(FabricServices::DFGWrapper::ExecPortPtr port, const char * resolvedType) {}
  virtual void onExecPortTypeSpecChanged(FabricServices::DFGWrapper::ExecPortPtr port, const char * typeSpec) {}
  virtual void onNodePortResolvedTypeChanged(FabricServices::DFGWrapper::NodePortPtr pin, const char * resolvedType) {}
  virtual void onExecPortMetadataChanged(FabricServices::DFGWrapper::ExecPortPtr port, const char * key, const char * metadata) {}
  virtual void onNodePortMetadataChanged(FabricServices::DFGWrapper::NodePortPtr pin, const char * key, const char * metadata) {}
  virtual void onNodePortTypeChanged(FabricServices::DFGWrapper::NodePortPtr pin, FabricCore::DFGPortType pinType) {}
  virtual void onExecPortTypeChanged(FabricServices::DFGWrapper::ExecPortPtr port, FabricCore::DFGPortType portType) {}

private:

  static void logFunc(void * userData, const char * message, unsigned int length);
  static void (*s_logFunc)(void *, const char *, unsigned int);
  static void bindingNotificationCallback(void * userData, char const *jsonCString, uint32_t jsonLength);

  static FabricCore::Client s_client;
  static FabricServices::DFGWrapper::Host * s_host;
  FabricServices::DFGWrapper::Binding m_binding;
  static FabricServices::ASTWrapper::KLASTManager * s_manager;
  static FabricServices::Commands::CommandStack s_stack;
  unsigned int m_id;
  static unsigned int s_maxId;
  static std::map<unsigned int, BaseInterface*> s_instances;
};

#endif
