
#include <FabricEDK.h>
#include "types.h"

using namespace Fabric::EDK;

RapidXmlNode::Data::Data(rapidxml::xml_node<> * inElement)
{
  element = inElement;
  AtomicUInt32SetValue( 1, &refCount );
}

void RapidXmlNode::Data::release()
{
  if ( AtomicUInt32DecrementAndGetValue( &refCount ) == 0 )
    delete this;
}

void RapidXmlNode::Data::retain()
{
  AtomicUInt32Increment( &refCount );
}

FABRIC_EXT_EXPORT void RapidXmlNode_Copy(
  RapidXmlNode & node,
  const RapidXmlNode & other
  )
{
  node.data = other.data;
  if(node.data)
    node.data->retain();
}

FABRIC_EXT_EXPORT void RapidXmlNode_Destruct(
  RapidXmlNode & node
  )
{
  if(node.data)
  {
    node.data->release();
    node.data = NULL;
  }
}

FABRIC_EXT_EXPORT bool RapidXmlNode_Valid(
  const RapidXmlNode & node
  )
{
  if(!node.data)
    return false;
  return node.data->element != NULL;
}

FABRIC_EXT_EXPORT void RapidXmlNode_Name(
  KL::String & name,
  const RapidXmlNode & node
  )
{
  if(!RapidXmlNode_Valid(node))
    return;
  name = KL::String(node.data->element->name_size(), node.data->element->name());
}

FABRIC_EXT_EXPORT void RapidXmlNode_NextSibling(
  RapidXmlNode & node,
  RapidXmlNode & prev
) {
  if(!RapidXmlNode_Valid(prev))
    return;
  rapidxml::xml_node<> * element = prev.data->element->next_sibling();
  if(element)
    node.data = new RapidXmlNode::Data(element);
  else
    node.data = NULL;
}
 
FABRIC_EXT_EXPORT void RapidXmlNode_FirstChild(
  RapidXmlNode & node,
  RapidXmlNode & prev
) {
  if(!RapidXmlNode_Valid(prev))
    return;
  rapidxml::xml_node<> * element = prev.data->element->first_node();
  if(element)
    node.data = new RapidXmlNode::Data(element);
  else
    node.data = NULL;
}

FABRIC_EXT_EXPORT void RapidXmlNode_FirstAttr(
  RapidXmlAttr & attr,
  RapidXmlNode & node
) {
  if(!RapidXmlNode_Valid(node))
    return;
  rapidxml::xml_attribute<> * element = node.data->element->first_attribute();
  if(element)
    attr.data = new RapidXmlAttr::Data(element);
}
