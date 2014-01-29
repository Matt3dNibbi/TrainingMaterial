
#include <FabricSplice.h>
#include <string>
#include <vector>

int main(int argc, const char * argv[]) 
{
  FabricSplice::Initialize();

  try
  {
    // create the first graph
    FabricSplice::DGGraph graph("myGraph");

    // create a couple of DGNodes
    graph.constructDGNode("calculator");
    graph.constructDGNode("nodeA");
    graph.constructDGNode("nodeB");
    graph.constructDGNode("nodeC");
    graph.constructDGNode("nodeD");

    // create a couple of members and ports
    graph.addDGNodeMember("values", "Scalar[]", FabricCore::Variant(), "nodeA");
    graph.addDGNodeMember("values", "Scalar[]", FabricCore::Variant(), "nodeB");
    graph.addDGNodeMember("values", "Scalar[]", FabricCore::Variant(), "nodeC");
    graph.addDGNodeMember("values", "Scalar[]", FabricCore::Variant(), "nodeD");
    graph.addDGNodeMember("results", "Scalar[]", FabricCore::Variant(), "calculator");
    FabricSplice::DGPort portA = graph.addDGPort("a", "values", FabricSplice::Port_Mode_IO, "nodeA");
    FabricSplice::DGPort portB = graph.addDGPort("b", "values", FabricSplice::Port_Mode_IO, "nodeB");
    FabricSplice::DGPort portC = graph.addDGPort("c", "values", FabricSplice::Port_Mode_IO, "nodeC");
    FabricSplice::DGPort portD = graph.addDGPort("d", "values", FabricSplice::Port_Mode_IO, "nodeD");
    FabricSplice::DGPort portResults = graph.addDGPort("results", "results", FabricSplice::Port_Mode_IO, "calculator");

    // set the data on the ports
    portA.setJSON("[1.0, 2.0, 3.0]");
    portB.setJSON("[5.0, 6.0, 7.0]");
    portC.setJSON("[9.0, 10.0, 11.0]");
    portD.setJSON("[13.0, 14.0, 15.0]");

    // define operator source code
    std::string klCode;
    klCode += "operator reportValues(Scalar v[]) {\n";
    klCode += "  report(v);\n";
    klCode += "}\n";

    // define a port map
    FabricCore::Variant portMap = FabricCore::Variant::CreateDict();
    
    // apply the op to each node, by remapping the ports
    portMap.setDictValue("v", FabricCore::Variant::CreateString("a"));
    graph.constructKLOperator("reportValues", klCode.c_str(), "reportValues", "nodeA", portMap);
    portMap.setDictValue("v", FabricCore::Variant::CreateString("b"));
    graph.constructKLOperator("reportValues", klCode.c_str(), "reportValues", "nodeB", portMap);
    portMap.setDictValue("v", FabricCore::Variant::CreateString("c"));
    graph.constructKLOperator("reportValues", klCode.c_str(), "reportValues", "nodeC", portMap);
    portMap.setDictValue("v", FabricCore::Variant::CreateString("d"));
    graph.constructKLOperator("reportValues", klCode.c_str(), "reportValues", "nodeD", portMap);

    // setup the dependencies
    graph.setDGNodeDependency("calculator", "nodeA");
    graph.setDGNodeDependency("calculator", "nodeB");
    graph.setDGNodeDependency("calculator", "nodeC");
    graph.setDGNodeDependency("calculator", "nodeD");

    // create a new KL operator
    std::string computeCode = "operator computeValues(Scalar a[], Scalar b[], Scalar c[], Scalar d[], io Scalar results[]) {\n";
    computeCode += "  results.resize(a.size());\n";
    computeCode += "  for(Size i=0;i<results.size();i++){\n";
    computeCode += "    results[i] = a[i] + b[i] + c[i] + d[i];\n";
    computeCode += "  }\n";
    computeCode += "}\n";

    graph.constructKLOperator("computeValues", computeCode.c_str(), "computeValues", "calculator");

    portMap.setDictValue("v", FabricCore::Variant::CreateString("results"));
    graph.constructKLOperator("reportValues", klCode.c_str(), "reportValues", "calculator", portMap);

    // evaluate the calculator node
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
