#include <stdio.h>

void greet (char* str)
{
  printf("Hello %s\n", str);
}

int main(int argc, char* argv[])
{
  int i;
  for (i = 1; i < argc; i++)
  {
    greet(argv[i]);
  }

  return 0;
}
