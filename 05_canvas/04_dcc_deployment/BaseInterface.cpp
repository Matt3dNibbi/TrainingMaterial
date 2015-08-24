#include "BaseInterface.h"

FabricCore::Client BaseInterface::s_client;
FabricCore::DFGHost BaseInterface::s_host;
unsigned int BaseInterface::s_maxId = 0;
std::map<unsigned int, BaseInterface*> BaseInterface::s_instances;
void (*BaseInterface::s_logFunc)(void *, FTL::CStrRef message);

BaseInterface::BaseInterface()
{
  m_id = s_maxId++;

  // construct the client
  if(s_instances.size() == 0)
  {
    try
    {
      printf("Constructing client...\n");

      // create a client
      FabricCore::Client::CreateOptions options;
      memset( &options, 0, sizeof( options ) );
      options.optimizationType = FabricCore::ClientOptimizationType_Background;
      s_client = FabricCore::Client(&logFunc, NULL, &options);

      // create a host for Canvas
      s_host = s_client.getDFGHost();
    }
    catch(FabricCore::Exception e)
    {
      printf("Error: %s\n", e.getDesc_cstr());
    }
  }

  try
  {
    // create an empty binding
    m_binding = s_host.createBindingToNewGraph();
    m_binding.setNotificationCallback(BindingCallback, this);
    FabricCore::DFGExec exec = m_binding.getExec();

    // set the graph on the view
    m_dfgView = exec.createView( &ExecCallback, this );
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  s_instances.insert(std::pair<unsigned int, BaseInterface*>(m_id, this));
}

BaseInterface::~BaseInterface()
{
  std::map<unsigned int, BaseInterface*>::iterator it = s_instances.find(m_id);

  m_dfgView = FabricCore::DFGView();
  m_binding = FabricCore::DFGBinding();

  if(it != s_instances.end())
  {
    s_instances.erase(it);
    if(s_instances.size() == 0)
    {
      try
      {
        printf("Destructing client...\n");
        s_host = FabricCore::DFGHost();
        s_client = FabricCore::Client();
      }
      catch(FabricCore::Exception e)
      {
        printf("Error: %s\n", e.getDesc_cstr());
      }
    }
  }
}

unsigned int BaseInterface::getId()
{
  return m_id;
}

BaseInterface * BaseInterface::getFromId(unsigned int id)
{
  std::map<unsigned int, BaseInterface*>::iterator it = s_instances.find(id);
  if(it == s_instances.end())
    return NULL;
  return it->second;
}

FabricCore::Client * BaseInterface::getClient()
{
  return &s_client;
}

FabricCore::DFGHost & BaseInterface::getHost()
{
  return s_host;
}

FabricCore::DFGBinding & BaseInterface::getBinding()
{
  return m_binding;
}

std::string BaseInterface::getJSON()
{
  try
  {
    return m_binding.exportJSON().getCString();
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }
  return "";
}

void BaseInterface::setFromJSON(const std::string & json)
{
  try
  {
    m_binding = s_host.createBindingFromJSON(json.c_str());
    FabricCore::DFGExec exec = m_binding.getExec();

    // create a new view
    m_dfgView = exec.createView( &ExecCallback, this );
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }
}

void BaseInterface::setLogFunc(void (*in_logFunc)(void *, FTL::CStrRef))
{
	s_logFunc = in_logFunc;
}

void BaseInterface::logFunc(
  void * userData, 
  FEC_ReportSource source,
  FEC_ReportLevel level,
  const char * message, 
  unsigned int length
  )
{
  FTL::CStrRef ref( message, length );
  if (s_logFunc)
  {
    s_logFunc(userData, ref);
  }
  else
  {
    printf("BaseInterface: %s\n", ref.c_str());
  }
}
