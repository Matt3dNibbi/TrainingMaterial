
#include <FabricSplice.h>
#include <string>

// a function to provide the MyRuntimeType
void createMyRuntimeType(const FabricCore::Variant & dataDict, char ** klCode)
{
  std::string code;
  code += "struct MyRuntimeType {\n";
  code += "  Scalar myNumber;\n";
  code += "};\n\n";
  code += "function MyRuntimeType.update() {\n";
  code += "  this.myNumber = 17;\n";
  code += "}\n";

  // copy the code out
  (*klCode) = (char*)malloc(code.length() + 1);
  (*klCode)[code.length()] = '\0';
  memcpy(*klCode, code.c_str(), code.length());  
}

int main(int argc, const char * argv) 
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