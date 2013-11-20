
#include <FabricSplice.h>
#include <string>
#include <vector>

using namespace FabricSplice;

int main(int argc, const char * argv) 
{
  std::string code;
  code += "const Integer myConst = 17;\n";   
  code += "\n";   
  code += "struct MyStruct{\n";   
  code += "  Scalar x;\n";   
  code += "}\n";   
  code += "\n";   
  code += "/* returns the x component */ function Scalar MyStruct.getX() { return this.x; }\n";   
  code += "/* returns a component based on an index */ function Scalar MyStruct.getComponent(Index index) {\n";
  code += "   if(component == 0) return this.x; return 0.0; }\n";   
  code += "\n";   
  code += "operator testOp() {\n";   
  code += "  MyStruct m;\n";   
  code += "  m.x = 18;\n";   
  code += "  report(m.getX());\n";   
  code += "}\n";

  KLParser parser = KLParser::getParser("MyStruct", "MyStruct", code.c_str());
  for(unsigned int i=0;i<parser.getNbKLSymbols();i++)
  {
    KLParser::KLSymbol symbol = parser.getKLSymbol(i);
    printf("%03d: '%s': '%s'\n", (int)i, symbol.typeName(), symbol.str().c_str());
  }

  for(unsigned int i=0;i<parser.getNbKLFunctions();i++)
  {
    KLParser::KLFunction f = parser.getKLFunction(i);
    printf("found function '%s'.'%s' of type '%s'\n", f.owner(), f.name(), f.type());
    KLParser::KLArgumentList args = f.arguments();
    for(unsigned int j=0;j<args.nbArgs();j++)
    {
      printf("argument %d: '%s' of type '%s'\n", (int)j, args.name(j), args.type(j));
    }
  }

  return 0;
}