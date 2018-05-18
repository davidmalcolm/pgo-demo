#include <stdio.h>
#include "shared.h"

int flag = 0;

int main (int argc, const char **argv)
{
  int i;

  printf ("pgo-demo\n");

  for (i = 0; i < 100000; i++)
    workload ();

  printf ("count: %i\n", count);

  return 0;
}
