
#include <FabricSplice.h>
#include <string>
#include <vector>

struct MyDataType {
  std::string myString;
};

int main(int argc, const char * argv[]) 
{
  FabricSplice::Initialize();

  FabricSplice::addExtFolder("./Exts");

  try
  {
    // create the first graph
    // this is required for RTVals as well,
    // since they require a running client
    FabricSplice::DGGraph graph("myGraph");
    graph.constructDGNode();

    // build my vector rtval
    FabricCore::RTVal myVector = FabricSplice::constructRTVal("MyVector");

    // set some defaults
    myVector.setMember("x", FabricSplice::constructFloat32RTVal(2.0));
    myVector.setMember("y", FabricSplice::constructFloat32RTVal(3.0));

    // call on the dump
    myVector.callMethod("", "dump", 0, NULL);

    // execute the length method
    FabricCore::RTVal result = myVector.callMethod("Float32", "length", 0, NULL);
    printf("The length is %f\n", result.getFloat32());

    // create my math tool rtval
    FabricCore::RTVal myMathTool = FabricSplice::constructRTVal("MyMathTool");

    // create some numbers in the memory 
    // of this application
    std::vector<float> values(10000);
    FabricCore::RTVal valuesRTVal = FabricSplice::constructExternalArrayRTVal("Float32", values.size(), &values[0]);

    // perform the sqrt computation parallel
    myMathTool.callMethod("", "sqrtPEX", 1, &valuesRTVal);

    for(size_t i=0;i<50;i++)
    {
      printf("sqrt of %d is %f\n", (int)i, values[i]);
    }

    // construct a Data RTVal
    // it's the developers responsibility to 
    // free the memory again whenever it is appropriate
    MyDataType * myData = new MyDataType();
    myData->myString = "MyDataTypeString";
    FabricCore::RTVal dataRTVal = FabricSplice::constructDataRTVal(myData);

    // set the RTVal on the node
    graph.addDGNodeMember("data", "Data");
    FabricSplice::DGPort port = graph.addDGPort("data", "data", FabricSplice::Port_Mode_IO);
    port.setRTVal(myData);

    // get the value again
    // this references the same pointer
    FabricCore::RTVal anotherDataRTVal = port.getRTVal();
    MyDataType * anotherMyData = (MyDataType *)anotherDataRTVal.getData();
    printf("Received MyDataType from RTVal: %s\n", anotherMyData->myString.c_str());
  }
  catch(FabricSplice::Exception e)
  {
    printf("%s\n", e.what());
    return 1;
  }

  FabricSplice::Finalize();
  return 0;
}
