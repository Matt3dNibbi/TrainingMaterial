
#include <DFGWrapper/DFGWrapper.h>
#include <string>

using namespace FabricServices;

void myLogFunc(void * userData, const char * message, unsigned int length)
{
  printf("%s\n", message);
}

class MyView : public DFGWrapper::View
{
  // general notification callback.
  // the specialized callbacks below will receive the 
  // more precise information. but in case you need it you
  // can get the low level notifications here already.
  // this might be useful if you need to handle your very
  // own events.
  virtual void onNotification(char const * json)
  {
    // printf("Notification received.\n");
  }

  virtual void onNodeInserted(DFGWrapper::NodePtr node)
  {
    printf("Node inserted: '%s'\n", node->getNodePath());
  }

  virtual void onNodeRemoved(DFGWrapper::NodePtr node)
  {
    printf("Node removed: '%s'\n", node->getNodePath());
  }

  virtual void onPinInserted(DFGWrapper::PinPtr pin)
  {
    printf("Pin inserted: '%s'\n", pin->getPinPath());
  }

  virtual void onPinRemoved(DFGWrapper::PinPtr pin)
  {
    printf("Pin removed: '%s'\n", pin->getPinPath());
  }

  virtual void onPortInserted(DFGWrapper::PortPtr port)
  {
    printf("Port inserted: '%s'\n", port->getPortPath());
  }

  virtual void onPortRemoved(DFGWrapper::PortPtr port)
  {
    printf("Port inserted: '%s'\n", port->getPortPath());
  }

  virtual void onEndPointsConnected(DFGWrapper::EndPointPtr src, DFGWrapper::EndPointPtr dst)
  {
    printf("Points connected: '%s' - '%s'\n", src->getEndPointPath(), dst->getEndPointPath());
  }

  virtual void onEndPointsDisconnected(DFGWrapper::EndPointPtr src, DFGWrapper::EndPointPtr dst)
  {
    printf("Points disconnected: '%s' - '%s'\n", src->getEndPointPath(), dst->getEndPointPath());
  }

  virtual void onNodeMetadataChanged(DFGWrapper::NodePtr node, const char * key, const char * metadata)
  {
    printf("Node Metadata changed: '%s' '%s'\n", node->getNodePath(), key);
  }

  virtual void onNodeTitleChanged(DFGWrapper::NodePtr node, const char * title)
  {
    printf("Node title changed: '%s' '%s'\n", node->getNodePath(), title);
  }

  virtual void onPortRenamed(DFGWrapper::PortPtr port, const char * oldName)
  {
    printf("Port renamed: '%s' -> '%s\n", oldName, port->getPortPath());
  }

  virtual void onPinRenamed(DFGWrapper::PinPtr pin, const char * oldName)
  {
    printf("Pin renamed: '%s' -> '%s\n", oldName, pin->getPinPath());
  }

  virtual void onExecMetadataChanged(DFGWrapper::ExecutablePtr exec, const char * key, const char * metadata)
  {
    printf("Exec Metadata changed: '%s' '%s'\n", exec->getExecPath(), key);
  }

  virtual void onExtDepAdded(const char * extension, const char * version)
  {
    printf("Extension dependency added: '%s'\n", extension);
  }

  virtual void onExtDepRemoved(const char * extension, const char * version)
  {
    printf("Extension dependency removed: '%s'\n", extension);
  }

  virtual void onNodeCacheRuleChanged(const char * path, const char * rule)
  {
    printf("Node cache rule changed: '%s' '%s'\n", path, rule);
  }

  virtual void onExecCacheRuleChanged(const char * path, const char * rule)
  {
    printf("Exec cache rule changed: '%s' '%s'\n", path, rule);
  }

  virtual void onPortResolvedTypeChanged(DFGWrapper::PortPtr port, const char * resolvedType)
  {
    printf("Port resolved type changed: '%s' '%s'\n", port->getPortPath(), resolvedType);
  }

  virtual void onPinResolvedTypeChanged(DFGWrapper::PinPtr pin, const char * resolvedType)
  {
    printf("Pin resolved type changed: '%s' '%s'\n", pin->getPinPath(), resolvedType);
  }

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
    DFGWrapper::Host host(client);

    DFGWrapper::Binding binding = host.createBindingToNewGraph();
    DFGWrapper::GraphExecutablePtr graph = DFGWrapper::GraphExecutablePtr::StaticCast(binding.getExecutable());

    // create a view which is going to receive all events
    MyView view;
    // connect the view to the graph
    view.setGraph(graph);

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
