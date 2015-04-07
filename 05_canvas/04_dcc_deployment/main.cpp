
#include "BaseInterface.h";

using namespace FabricServices;

int main(int argc, const char * argv[]) 
{
  // create two interfaces
  BaseInterface * a = new BaseInterface();
  BaseInterface * b = new BaseInterface();

  printf("a->isValid() %d\n", a->isValid() ? 1 : 0);
  printf("b->isValid() %d\n", b->isValid() ? 1 : 0);

  try
  {
    DFGWrapper::GraphExecutablePtr graph = DFGWrapper::GraphExecutablePtr::StaticCast(a->getBinding()->getExecutable());

    // add a report node
    DFGWrapper::NodePtr reportNode = graph->addNodeFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    graph->addPort("caption", FabricCore::DFGPortType_In);
    graph->addPort("result", FabricCore::DFGPortType_Out);

    // print out persistence just for fun
    printf("%s\n", a->getJSON().c_str());
  }
  catch(FabricCore::Exception e)
  {
    printf("Error: %s\n", e.getDesc_cstr());
  }

  delete(a);
  delete(b);

  return 0;
}
