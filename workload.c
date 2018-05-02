extern int flag;
int count = 0;

void workload (void)
{
  if (flag)
    count += 1;
}
