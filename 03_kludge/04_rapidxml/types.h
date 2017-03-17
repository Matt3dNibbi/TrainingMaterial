
#include <FabricEDK.h>
#include <rapidxml.hpp>

using namespace Fabric::EDK;

FABRIC_EXT_KL_STRUCT( RapidXmlDoc, 
{
  class Data 
  {
  public:
    Data(rapidxml::xml_document<> * inElement);
    ~Data();
    void retain();
    void release();

    char * buffer;
    rapidxml::xml_document<> * element;
  private:
    AtomicUInt32 refCount;
  };

  Data * data;
} );

FABRIC_EXT_KL_STRUCT( RapidXmlNode, 
{
  class Data 
  {
  public:
    Data(rapidxml::xml_node<> * inElement);
    void retain();
    void release();

    rapidxml::xml_node<> * element;
  private:
    AtomicUInt32 refCount;
  };

  Data * data;
} );

FABRIC_EXT_KL_STRUCT( RapidXmlAttr, 
{
  class Data 
  {
  public:
    Data(rapidxml::xml_attribute<> * inElement);
    void retain();
    void release();

    rapidxml::xml_attribute<> * element;
  private:
    AtomicUInt32 refCount;
  };

  Data * data;
} );
