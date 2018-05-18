#include "shared.h"

int count = 0;

void workload (void)
{
  if (flag)
    count += 1;
}
