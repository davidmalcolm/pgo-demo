#include "shared.h"

void loop_opts_c_body (void)
{
  for (int i = 0; i < 5; i++)
    if (i > 3)
      not_inlinable ();
}
