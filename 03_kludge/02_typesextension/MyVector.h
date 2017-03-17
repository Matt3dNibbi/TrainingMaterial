#include <stdio.h>
#include <math.h>

struct MyVector
{
  float x;
  float y;

  MyVector(float in_x, float in_y)
  {
    x = in_x;
    y = in_y;
  }

  float length() const
  {
    return sqrt(x * x + y * y);
  }

  MyVector unit() const
  {
    float l = length();
    if(l == 0.0f)
      return MyVector(0.0f, 0.0f);
    return MyVector(x / l, y / l);
  }
};