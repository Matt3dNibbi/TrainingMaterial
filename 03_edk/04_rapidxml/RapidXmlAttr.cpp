
#include <FabricEDK.h>
#include "types.h"

using namespace Fabric::EDK;

RapidXmlAttr::Data::Data(rapidxml::xml_attribute<> * inElement)
{
  element = inElement;
  AtomicUInt32SetValue( 1, &refCount );
}

void RapidXmlAttr::Data::release()
{
  if ( AtomicUInt32DecrementAndGetValue( &refCount ) == 0 )
    delete this;
}

void RapidXmlAttr::Data::retain()
{
  AtomicUInt32Increment( &refCount );
}

FABRIC_EXT_EXPORT void RapidXmlAttr_Copy(
  RapidXmlAttr & attr,
  const RapidXmlAttr & other
  )
{
  attr.data = other.data;
  if(attr.data)
    attr.data->retain();
}

FABRIC_EXT_EXPORT void RapidXmlAttr_Destruct(
  RapidXmlAttr & attr
  )
{
  if(attr.data)
  {
    attr.data->release();
    attr.data = NULL;
  }
}

FABRIC_EXT_EXPORT bool RapidXmlAttr_Valid(
  const RapidXmlAttr & attr
  )
{
  if(!attr.data)
    return false;
  return attr.data->element != NULL;
}

FABRIC_EXT_EXPORT void RapidXmlAttr_Name(
  KL::String & name,
  const RapidXmlAttr & attr
  )
{
  if(!RapidXmlAttr_Valid(attr))
    return;
  name = KL::String(attr.data->element->name_size(), attr.data->element->name());
}

FABRIC_EXT_EXPORT void RapidXmlAttr_Value(
  KL::String & value,
  const RapidXmlAttr & attr
  )
{
  if(!RapidXmlAttr_Valid(attr))
    return;
  value = KL::String(attr.data->element->value_size(), attr.data->element->value());
}
