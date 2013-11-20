
#include <Fabric/EDK/EDK.h>
#include "types.h"

using namespace Fabric::EDK;

RapidXmlDoc::Data::Data(rapidxml::xml_document<> * inElement)
{
  element = inElement;
  buffer = NULL;
  AtomicUInt32SetValue( 1, &refCount );
}

RapidXmlDoc::Data::~Data()
{
  delete(element);
  if(buffer)
    free(buffer);
}

void RapidXmlDoc::Data::release()
{
  if ( AtomicUInt32DecrementAndGetValue( &refCount ) == 0 )
    delete this;
}

void RapidXmlDoc::Data::retain()
{
  AtomicUInt32Increment( &refCount );
}

FABRIC_EXT_EXPORT void RapidXmlDoc_Construct(
  RapidXmlDoc & doc
  )
{
  doc.data = new RapidXmlDoc::Data(new rapidxml::xml_document<>());
}

FABRIC_EXT_EXPORT void RapidXmlDoc_Copy(
  RapidXmlDoc & doc,
  const RapidXmlDoc & other
  )
{
  doc.data = other.data;
  if(doc.data)
    doc.data->retain();
}

FABRIC_EXT_EXPORT void RapidXmlDoc_Destruct(
  RapidXmlDoc & doc
  )
{
  if(doc.data)
  {
    doc.data->release();
    doc.data = NULL;
  }
}

FABRIC_EXT_EXPORT void RapidXmlDoc_ParseFile(
  RapidXmlDoc & doc,
  const KL::String & path
) {
  if(!doc.data)
    return;
  if(!path.c_str())
  {
    setError("RapidXmlDoc.parseFile: Empty path specified.");
    return;
  }

  FILE * file = fopen(path.c_str(), "rb");
  if(file == NULL)
  {
    setError("RapidXmlDoc.parseFile: Path does not exist.");
    return;
  }

  fseek( file, 0, SEEK_END );
  int length = ftell( file );
  rewind( file );
  doc.data->buffer = (char*)malloc(length+1);
  fread(doc.data->buffer, length, 1, file);
  doc.data->buffer[length] = '\0';
  doc.data->element->parse<0>(doc.data->buffer);
  fclose(file);
}

FABRIC_EXT_EXPORT void RapidXmlDoc_FirstNode(
  RapidXmlNode & node,
  RapidXmlDoc & doc
) {
  if(!doc.data)
    return;
  rapidxml::xml_node<> * element = doc.data->element->first_node();
  if(element)
    node.data = new RapidXmlNode::Data(element);
  else
    node.data = NULL;
}
 
