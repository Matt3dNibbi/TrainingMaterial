#include "OpaqueExtension.h"

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( OpaqueExtension )

class MyData 
{
public:
  MyData();
  void retain();
  void release();
private:
  AtomicUInt32 refCount;
};

MyData::MyData()
{
  AtomicUInt32SetValue( 1, &refCount );
  printf("--> MyData constructed.\n");
}

void MyData::release()
{
  if ( AtomicUInt32DecrementAndGetValue( &refCount ) == 0 )
  {
    delete this;
    printf("--> MyData deleted.\n");
  }
  else
  {
    printf("--> MyData released.\n");
  }
}

void MyData::retain()
{
  AtomicUInt32Increment( &refCount );
  printf("--> MyData retained.\n");
}

// Defined at ./\OpaqueExtension.kl:6:1
FABRIC_EXT_EXPORT void OpaqueType_Construct(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::OpaqueType >::IOParam this_
) {
  this_.data = new MyData();
}

// Defined at ./\OpaqueExtension.kl:7:1
FABRIC_EXT_EXPORT void OpaqueType_Copy(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::OpaqueType >::IOParam this_,
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::OpaqueType >::INParam other
) {
  this_.data = other.data;
  if(this_.data)
  {
    MyData * data = (MyData *)this_.data;
    data->retain();
  }
}

// Defined at ./\OpaqueExtension.kl:9:1
FABRIC_EXT_EXPORT void OpaqueType_Destruct(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::OpaqueType >::IOParam this_
) {
  if(this_.data)
  {
    MyData * data = (MyData *)this_.data;
    data->release();
    this_.data = NULL;
  }
}
