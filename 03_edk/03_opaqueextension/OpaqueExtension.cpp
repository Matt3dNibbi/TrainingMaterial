
#include <Fabric/EDK/EDK.h>

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( OpaqueExtension )

FABRIC_EXT_KL_STRUCT( OpaqueType, 
{
  class Data 
  {
  public:
    Data();
    void retain();
    void release();
  private:
    AtomicUInt32 refCount;
  };

  Data * data;
} );

OpaqueType::Data::Data()
{
  AtomicUInt32SetValue( 1, &refCount );
  printf("--> OpaqueType::Data constructed.\n");
}

void OpaqueType::Data::release()
{
  if ( AtomicUInt32DecrementAndGetValue( &refCount ) == 0 )
  {
    delete this;
    printf("--> OpaqueType::Data deleted.\n");
  }
  else
  {
    printf("--> OpaqueType::Data released.\n");
  }
}

void OpaqueType::Data::retain()
{
  AtomicUInt32Increment( &refCount );
  printf("--> OpaqueType::Data retained.\n");
}

FABRIC_EXT_EXPORT void OpaqueType_Construct(
  OpaqueType & o
  )
{
  o.data = new OpaqueType::Data();
}

FABRIC_EXT_EXPORT void OpaqueType_Copy(
  OpaqueType & o,
  const OpaqueType & other
  )
{
  o.data = other.data;
  if(o.data)
    o.data->retain();
}

FABRIC_EXT_EXPORT void OpaqueType_Destruct(
  OpaqueType & o
  )
{
  if(o.data)
  {
    o.data->release();
    o.data = NULL;
  }
}
