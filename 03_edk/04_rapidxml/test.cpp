
#include <FabricSplice.h>
#include <string>

int main(int argc, const char * argv[]) 
{
  FabricSplice::Initialize();

  // use the local folder for finding extensions
  FabricSplice::addExtFolder(".");

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create the first DGNode
    graph.constructDGNode("testNode");

    // setup the kl code
    std::string klCode;
    klCode += "require RapidXml;\n";
    klCode += "\n";
    klCode += "operator testOp() {\n";
    klCode += "  RapidXmlDoc doc;\n";
    klCode += "  doc.parseFile('test.xml');\n";
    klCode += "  RapidXmlNode mainNode = doc.firstNode();\n";
    klCode += "  report(mainNode.name());\n";
    klCode += "  RapidXmlNode childNode = mainNode.firstChild();\n";
    klCode += "  while(childNode.valid()) {\n";
    klCode += "    RapidXmlAttr attr = childNode.firstAttr();\n";
    klCode += "    report(childNode.name() + ', '+attr.name()+': '+attr.value());\n";
    klCode += "    childNode = childNode.nextSibling();\n";
    klCode += "  }\n";
    klCode += "}\n";
    graph.constructKLOperator("testOp", klCode.c_str());

    // evaluate the graph
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
