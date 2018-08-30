#include <stdio.h>
#include <stdlib.h>

int flags(char* argv[], int* t)
{
  int i = 1, ret;
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
    int pos = 0;
  //count number of h's
  while (input[pos] == 'h') {
    pos++;
  }

  if (pos%2 != 0) {
    printInvalid(convert);
    return;
  }
  printf("Passed h count\n");

  //check for =
  if (input[pos] != '=') {
    printInvalid(convert);
    return;
  }
  printf("passed =\n");

  pos++;
  //count number of r's
  int r = 0;
  while (input[pos] == 'r') {
    pos++;
    r++;
  }

  if (r < 4) {
     printInvalid(convert);
     return;
  }
  printf("passed r count\n");

  if (input[pos] != ':' || input[pos+1] != ':') {
    printInvalid(convert);
    return;
  }
  printf("passed : count\n");

  pos += 2;
  int caps = 0;
  while (input[pos] > 63 && input[pos] < 91) {
    caps++;
    pos++;
  }

  if (caps%2 != 1) {
    printInvalid(convert);
    return;
  }
  printf("passed caps count\n");

  if (convert == 0) {
    printf("yes\n");
  }
  else if (convert == 1) {
    printf("%s%c\n", input + 1, input[0]);
  }

  return;
}

void typeB(char* input, int convert) {
  int pos = 0;
  
  int k = 0;
  while (input[pos] == 'k') {
    k++;
	pos++;
  }
  
  if (k%2 != 0) {
	printInvalid(convert);
	return;
  }
  
  if (input[pos++] != '=') {
	printInvalid(convert);
	return;
  }
  
  //4 byte char arr, in case needs null terminator
  char* decStr = calloc(4);
  int dec = 0;
  while (input[pos] > 47 && input[pos] < 58) {
	decStr[dec++] = input[pos++];
  }
  //decStr[dec+1] = 0;
  
  if (dec > 3 || dec < 1) {
	printInvalid(convert);
	return;
  }
  
  int u = 0;
  while (input[pos] == 'u') {
	u++;
	pos++;
  }
  
  if (u%2 != 1) {
	printInvalid(convert);
	return;
  }
  
  if (input[pos++] != '=') {
	printInvalid(convert);
	return;
  }
  
  int i;
  for (i = 1; i < dec; i += 2) {
	if (input[pos++] != decStr[i]) {
	  printInvalid(convert);
	  return;
	}
  }
  
  int caps = 0;
  while (input[pos] > 63 && input[pos] < 91) {
    caps++;
    pos++;
  }

  if (caps%2 != 1) {
    printInvalid(convert);
    return;
  }
  
  if (convert == 0) {
    printf("yes\n");
  }
  else if (convert == 1) {
    for (i = 0; i < 
  }
  
}

char* typeC(char* input) {

}

int main(int argc, char* argv[])
{
  int t = 0;
  int type = flags(argv, &t);

  printf("flag: %d, t: %d\n", type, t);

  int i;
  for (i = 2 + t; i < argc; i++) {
    if (type == 0) {
      typeA(argv[i], t);
    }
    else if (type == 1) {
      typeB(argv[i]);
    }
    else if (type == 2) {
      typeC(argv[i]);
    }
  }

  return 0;
}
