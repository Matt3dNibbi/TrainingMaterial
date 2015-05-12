#include "TypesExtension.h"

#include <math.h>

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( TypesExtension )

FABRIC_EXT_KL_STRUCT( MyVector, {
  KL::Scalar x;
  KL::Scalar y;
} );

// Defined at ./\TypesExtension.kl:12:1
FABRIC_EXT_EXPORT Fabric::EDK::KL::Float32 TypesExtension_MyVector_length(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::MyVector >::INParam this_
) {
  return (sqrt(this_.x * this_.x + this_.y * this_.y));
}

// Defined at ./\TypesExtension.kl:13:1
FABRIC_EXT_EXPORT void TypesExtension_MyVector_unit(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::MyVector >::Result _result,
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::MyVector >::INParam this_
) {
  KL::Scalar length = TypesExtension_MyVector_length(this_);
  if(length > 0.0)
  {
    _result.x = this_.x / length;
    _result.y = this_.y / length;
  }
  else
    _result.x = _result.y = 0.0;
}

