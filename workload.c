#include "shared.h"

int count = 0;

void workload_c_body (void)
{
  if (flag)
    count += 1;
}
