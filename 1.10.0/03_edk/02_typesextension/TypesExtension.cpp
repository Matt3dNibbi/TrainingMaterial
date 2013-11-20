
#include <Fabric/EDK/EDK.h>

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( TypesExtension )

FABRIC_EXT_KL_STRUCT( MyVector, {
  KL::Scalar x;
  KL::Scalar y;
} );

FABRIC_EXT_EXPORT KL::Scalar TypesExtension_MyVector_length(
  const MyVector & v
  )
{
  return (sqrt(v.x * v.x + v.y * v.y));
}

FABRIC_EXT_EXPORT void TypesExtension_MyVector_unit(
  MyVector & result,
  const MyVector & v
  )
{
  KL::Scalar length = TypesExtension_MyVector_length(v);
  if(length > 0.0)
  {
    result.x = v.x / length;
    result.y = v.y / length;
  }
  else
    result.x = result.y = 0.0;
}

