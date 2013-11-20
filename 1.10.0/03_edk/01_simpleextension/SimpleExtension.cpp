
#include <Fabric/EDK/EDK.h>

using namespace Fabric::EDK;
IMPLEMENT_FABRIC_EDK_ENTRIES( SimpleExtension )

FABRIC_EXT_EXPORT void SimpleExtension_SimplePrintf(
  const KL::String & message
  )
{
  if(message.c_str())
    printf("[SimpleExtension::SimplePrintf] %s\n", message.c_str());
}