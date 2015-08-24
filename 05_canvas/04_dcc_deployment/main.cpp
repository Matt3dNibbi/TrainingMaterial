
#include "BaseInterface.h"

int main(int argc, const char * argv[]) 
{
  // create two interfaces
  BaseInterface * a = new BaseInterface();
  BaseInterface * b = new BaseInterface();

  try
  {
    FabricCore::DFGExec exec = a->getBinding().getExec();

    // add a report node
    exec.addInstFromPreset("Fabric.Core.Func.Report");

    // add an in and one out port
    exec.addExecPort("caption", FabricCore::DFGPortType_In);
    exec.addExecPort("result", FabricCore::DFGPortType_Out);

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
