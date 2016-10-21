
#include <FabricCore.h>
#include <string>

int main(int argc, const char * argv[]) 
{
  try
  {
    // create a client
    FabricCore::Client::CreateOptions options;
    memset( &options, 0, sizeof( options ) );
    options.optimizationType = FabricCore::ClientOptimizationType_Background;
    
    FabricCore::Client client(NULL, NULL, &options);

    // load an extension
    // will load an extension found on the FABRIC_EXTS_PATH env variable
    client.loadExtension("Math", "", false /*reload*/);

    // interacting with a registered type value (RTVal)
    // use ::Construct for structs
    // use ::Create for objects (ref counted)
    // convinience (sorry) constructors, for ex: ::ConstructString, ::ConstructFloat32

    // 0 == number of construction args
    // NULL == pointer to construction args
    FabricCore::RTVal myVector = FabricCore::RTVal::Construct(client, "Vec3", 0, NULL);
    FabricCore::RTVal x = myVector.maybeGetMember("x");
    printf("initial x value: %f\n", x.getFloat32());

    // create a fresh x rt val
    x = FabricCore::RTVal::ConstructFloat32(client, 12.0f);
    printf("new value x value: %f\n", x.getFloat32());

    // to change it in the vector we actually have to do setMember, since the vector is a struct (not ref counted)
    myVector.setMember("x", x);

    // this gives you access to the void * in memory.
    // first we get the Data RTVal (the result of the KL data method) and then its data (the void*)
    float * myVectorFloats = (float*)myVector.callMethod("Data", "data", 0, NULL).getData();
    printf("myVector %f %f %f\n", myVectorFloats[0], myVectorFloats[1], myVectorFloats[2]);

    // invoke the unit method in KL through the RTVal
    FabricCore::RTVal unitVec = myVector.callMethod("Vec3", "unit", 0, NULL);
    float * unitVecFloats = (float*)unitVec.callMethod("Data", "data", 0, NULL).getData();
    printf("unit %f %f %f\n", unitVecFloats[0], unitVecFloats[1], unitVecFloats[2]);

    // lastly we can also use an external array to express an array (or a single) value
    float toVectors[6];
    FabricCore::RTVal toVectorsExtArray = FabricCore::RTVal::ConstructExternalArray(client, "Vec3", 2, toVectors);
    
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  return 0;
}
