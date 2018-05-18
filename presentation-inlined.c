// Taken from Adam Nemet's November 2016 LLVM talk

#include "shared.h"

void accumulate (int x, int *a)
{
  *a += x;
}

int compute_sum_with_inlining (int arr[], int n)
{
  int sum = 0;
  for (int i = 0; i < n; ++i)
    accumulate (arr[i], &sum);
  return sum;
}
