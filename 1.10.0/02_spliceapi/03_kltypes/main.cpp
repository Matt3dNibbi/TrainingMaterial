
#include <FabricSplice.h>
#include <string>

// a function to provide the MyRuntimeType
FabricCore::Variant createMyRuntimeType(const FabricCore::Variant & dataDict)
{
  std::string klCode;
  klCode += "struct MyRuntimeType {\n";
  klCode += "  Scalar myNumber;\n";
  klCode += "};\n\n";
  klCode += "function MyRuntimeType.update() {\n";
  klCode += "  this.myNumber = 17;\n";
  klCode += "}\n";
  return FabricCore::Variant::CreateString(klCode.c_str());
}

int main(int argc, const char * argv[]) 
{
  FabricSplice::Initialize();

  // define my custom RT and Exts folders
  FabricSplice::addRTFolder("./RT");
  FabricSplice::addExtFolder("./Exts");

  // add a special filter function
  FabricSplice::DGGraph::setLoadRTFunc("MyRuntimeType", createMyRuntimeType);

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create the first DGNode
    graph.constructDGNode("myNode");

    // create a KL operator
    std::string klCode;
    klCode += "require MyType;\n";
    klCode += "require MyExtension;\n";
    klCode += "require MyRuntimeType;\n";
    klCode += "operator testOp() {\n";
    klCode += "  MyType testVariable('I am a new type!');\n";
    klCode += "  myFunction(testVariable);\n";
    klCode += "  MyRuntimeType runtimeVariable;\n";
    klCode += "  runtimeVariable.update();\n";
    klCode += "  report(runtimeVariable);\n";
    klCode += "}\n";
    graph.constructKLOperator("testOp", klCode.c_str());

    // perform
    graph.evaluate();
  }
  catch(FabricSplice::Exception e)
  {
    printf("%s\n", e.what());
    return 1;
  }

  FabricSplice::Finalize();
  return 0;
}
