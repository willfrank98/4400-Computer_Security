#include <stdio.h>

int flags(char* argv[], int* t)
{
  int i = 0, ret;
  while (argv[i][0] == '-') {
    if (argv[i][1] == 'a') {
      ret = 0;
    }
    else if (argv[i][1] == 'b') {
      ret = 1;
    }
    else if (argv[i][1] == 'c') {
      ret = 2;
    }
    else if (argv[i][1] == 't') {
      *t = 1;
    }
    i++;
  }

  return ret;
}

void printInvalid(int conv) {
  if (conv == 0) {
    printf("no\n");
  }
  return;
}

void typeA(char* input, int convert) {
    int i = 0;
  //count number of h's
  while (input[i] == 'h') {
    i++;
  }

  if (i%2 != 0) {
    printInvalid(convert);
    return;
  }

  i++;
  //check for =
  if (input[i] != '=') {
    printInvalid(convert);
    return;
  }

  i++;
  //count number of r's
  int r = 0;
  while (input[i] == 'r') {
    i++;
    r++;
  }

  if (r < 4) {
     printInvalid(convert);
     return;
  }

  i++;
  if (input[i] != ':' || input[++i] != ':') {
    printInvalid(convert);
    return;
  }

  i++;
  int caps = 0;
  while (input[i] > 63 && input[i] < 91) {
    caps++;
  }

  if (caps%2 != 1) {
    printInvalid(convert);
    return;
  }

  if (convert == 0) {
    printf("yes\n");
  }
  else if (convert == 1) {
    printf("%s%c\n", input[1], input[0]);
  }

  return;
}

char* typeB(char* input) {

}

char* typeC(char* input) {

}

int main(int argc, char* argv[])
{
  int t;
  int type = flags(argv, &t);

  int i;
  for (i = 2; i < argc; i++) {
    if (type == 0) {
      typeA(argv[i], 0);
    }
    else if (type == 1) {
      typeB(argv[i]);
    }
    else if (type == 2) {
      typeC(argv[i]);
    }
  }
}
