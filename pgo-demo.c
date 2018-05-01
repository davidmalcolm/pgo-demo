#include <stdio.h>

static int flag = 0;
static int count = 0;

void workload (void)
{
  if (flag)
    count += 1;
}

int main (int argc, const char **argv)
{
  int i;

  printf ("pgo-demo\n");

  for (i = 0; i < 100000; i++)
    workload ();

  printf ("count: %i\n", count);

  return 0;
}
