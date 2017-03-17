#include <stdio.h>

class MyOwnedType
{
public:
  MyOwnedType()
  {
    printf("MyOwnedType constructed\n");
  }

  ~MyOwnedType()
  {
    printf("MyOwnedType destructed\n");
  }

  MyOwnedType(const MyOwnedType & other)
  {
    printf("MyOwnedType copied\n");
  }
};
