
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
    printf("Notification received.\n");
  }

  virtual void onNodeInserted(DFGWrapper::Node node)
  {
    printf("Node inserted: '%s'\n", node.getPath().c_str());
  }

  virtual void onNodeRemoved(DFGWrapper::Node node)
  {
    printf("Node removed: '%s'\n", node.getPath().c_str());
  }

  virtual void onPinInserted(DFGWrapper::Pin pin)
  {
    printf("Pin inserted: '%s'\n", pin.getPath().c_str());
  }

  virtual void onPinRemoved(DFGWrapper::Pin pin)
  {
    printf("Pin removed: '%s'\n", pin.getPath().c_str());
  }

  virtual void onPortInserted(DFGWrapper::Port port)
  {
    printf("Port inserted: '%s'\n", port.getPath().c_str());
  }

  virtual void onPortRemoved(DFGWrapper::Port port)
  {
    printf("Port inserted: '%s'\n", port.getPath().c_str());
  }

  virtual void onEndPointsConnected(DFGWrapper::Port src, DFGWrapper::Port dst)
  {
    printf("Points connected: '%s' - '%s'\n", src.getPath().c_str(), dst.getPath().c_str());
  }

  virtual void onEndPointsDisconnected(DFGWrapper::Port src, DFGWrapper::Port dst)
  {
    printf("Points disconnected: '%s' - '%s'\n", src.getPath().c_str(), dst.getPath().c_str());
  }

  virtual void onNodeMetadataChanged(DFGWrapper::Node node, const char * key, const char * metadata)
  {
    printf("Node Metadata changed: '%s' '%s'\n", node.getPath().c_str(), key);
  }

  virtual void onNodeTitleChanged(DFGWrapper::Node node, const char * title)
  {
    printf("Node title changed: '%s' '%s'\n", node.getPath().c_str(), title);
  }

  virtual void onPortRenamed(DFGWrapper::Port port, const char * oldName)
  {
    printf("Port renamed: '%s' -> '%s\n", oldName, port.getPath().c_str());
  }

  virtual void onPinRenamed(DFGWrapper::Pin pin, const char * oldName)
  {
    printf("Pin renamed: '%s' -> '%s\n", oldName, pin.getPath().c_str());
  }

  virtual void onExecMetadataChanged(DFGWrapper::Executable exec, const char * key, const char * metadata)
  {
    printf("Exec Metadata changed: '%s' '%s'\n", exec.getPath().c_str(), key);
  }

  virtual void onExtDepAdded(const char * extension, const char * version)
  {
    printf("Extension dependency added: '%s'\n", extension);
  }

  virtual void onNodeCacheRuleChanged(const char * path, const char * rule)
  {
    printf("Node cache rule changed: '%s' '%s'\n", path, rule);
  }

  virtual void onExecCacheRuleChanged(const char * path, const char * rule)
  {
    printf("Exec cache rule changed: '%s' '%s'\n", path, rule);
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
    DFGWrapper::GraphExecutable graph = binding.getGraph();

    // create a view which is going to receive all events
    MyView view;
    // connect the view to the graph
    view.setGraph(graph);

    // add a report node
    DFGWrapper::Node reportNode = graph.addNodeFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    graph.addPort("caption", FabricCore::DFGPortType_In);
    graph.addPort("result", FabricCore::DFGPortType_Out);

    // connect things up
    graph.getPort("caption").connect(reportNode.getPin("value"));
    reportNode.getPin("value").connect(graph.getPort("result"));
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
