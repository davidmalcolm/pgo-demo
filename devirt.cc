#include "shared.h"

class base
{
public:
  virtual void meth () = 0;
};

class subclass : public base
{
public:
  void meth () {}
};

static void test (base *ptr)
{
  //subclass obj;
  for (int i = 0; i < 10000; i++)
    ptr->meth ();
  //obj.meth ();
}

void run_devirt_cc ()
{
  subclass obj;
  test (&obj);
}
