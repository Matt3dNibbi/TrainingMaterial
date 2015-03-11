
#include <FabricEDK.h>
#include "SimpleExtension.h"

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( SimpleExtension )

// Defined at ./\SimpleExtension.kl:2:1
FABRIC_EXT_EXPORT void SimpleExtension_SimplePrintf(
  Fabric::EDK::KL::Traits< Fabric::EDK::KL::String >::INParam message
) {
  if(message.c_str())
    printf("[SimpleExtension::SimplePrintf] %s\n", message.c_str());
}
