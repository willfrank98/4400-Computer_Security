#include <stdio.h>

int flags(char* flag)
{
  if (flag[1] == 'a') {
      return 0;
  }
  else if (flag[1] == 'b') {
      return 1;
  }
  else if (flag[1] == 'c') {
      return 2;
  }
}

char* typeA(char* input) {

}

char* typeB(char* input) {

}

char* typeC(char* input) {

}

int main(int argc, char* argv[])
{
  int type = flags(argv[1]);

  int i;
  for (i = 1; i < argc; i++) {
    char* output;
    if (type == 0) {
      output = typeA(argv[i]);
    }
    else if (type == 1) {
      output = typeB(argv[i]);
    }
    else if (type == 2) {
      output = typeC(argv[i]);
    }

    printf("%s\n", output);
  }
}
