#include <stdio.h>
#include <stdlib.h>

int flags(char* argv[], int* t, int* inc)
{
  int i = 1, ret = 0;
  *inc = 0;

  while (argv[i][0] == '-') {
    if (argv[i][1] == 'a') {
      ret = 0;
      (*inc)++;
    }
    else if (argv[i][1] == 'b') {
      ret = 1;
      (*inc)++;
    }
    else if (argv[i][1] == 'c') {
      ret = 2;
      (*inc)++;
    }
    else if (argv[i][1] == 't') {
      *t = 1;
      (*inc)++;
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

  //check for =
  if (input[pos] != '=') {
    printInvalid(convert);
    return;
  }

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

  if (input[pos] != ':' || input[pos+1] != ':') {
    printInvalid(convert);
    return;
  }

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

  //check to make sure no extra characters at end of string
  if (input[pos] != 0) {
    printInvalid(convert);
    return;
  }

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

  if (input[pos++] != '=') {
	printInvalid(convert);
	return;
  }

  //need to store up to 4 chars
  char* decStr = malloc(4);
  int dec = 0;
  while (input[pos] > 47 && input[pos] < 58 && dec < 5) {
	decStr[dec] = input[pos];
	dec++;
	pos++;
  }

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
	if (input[pos] != decStr[i]) {
	  printInvalid(convert);
	  return;
	}
	pos++;
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

  if (input[pos] != 0) {
    printInvalid(convert);
    return;
  }

  if (convert == 0) {
    printf("yes\n");
  }
  else if (convert == 1) {
    for (i = 0; i < pos; i++) {
	  printf("%c%d", input[i], i%8);
    }
    printf("\n");
  }
  return;
}

void typeC(char* input, int convert) {
  int pos = 0;
  while (input[pos] == 'g') {
    pos++;
  }

  if (input[pos] != '=' || input[pos+1] != '=') {
	printInvalid(convert);
	return;
  }

  pos += 2;
  char* decStr = malloc(4);
  int dec = 0;
  //allow dec to go up to 4 to check for > 3
  while (input[pos] > 47 && input[pos] < 58 && dec < 5) {
	decStr[dec] = input[pos];
	dec++;
	pos++;
  }

  if (dec < 1 || dec > 3)
  {
	printInvalid(convert);
	return;
  }

  int q = 0;
  while (input[pos] == 'q') {
    q++;
    pos++;
  }

  if (q%2 != 1) {
	printInvalid(convert);
	return;
  }

  if (input[pos] != ',') {
	printInvalid(convert);
	return;
  }

  pos++;
  int caps = 0;
  while (input[pos] > 64 && input[pos] < 91) {
	caps++;
	pos++;
  }

  if (caps%2 != 1) {
	printInvalid(convert);
	return;
  }

  int i;
  for (i = 0; i < dec; i += 2) {
	if (input[pos] != decStr[i]) {
	  printInvalid(convert);
	  return;
	}
	pos++;
  }

  if (input[pos] != 0) {
    printInvalid(convert);
    return;
  }

  if (convert == 0) {
	printf("yes\n");
  }
  else if (convert == 1) {
	int firstE = 0, lastE = pos;

	i = 0;
	while (i < pos && input[i] != 'E') {
	  firstE++;
	  i++;
	}

	i = pos;
	while (i >= 0 && input[i] != 'E') {
	  lastE--;
	  i--;
	}

	for (i = 0; i < pos; i++) {
	  if (i != firstE && i != lastE) {
		printf("%c", input[i]);
	  }
	}
	printf("\n");
  }
  return;
}

int main(int argc, char* argv[])
{
  int t = 0, increment = 0;
  int type = flags(argv, &t, &increment);

  //printf("flag: %d, t: %d\n", type, t);

  int i;
  for (i = 1 + increment; i < argc; i++) {
    if (type == 0) {
      typeA(argv[i], t);
    }
    else if (type == 1) {
      typeB(argv[i], t);
    }
    else if (type == 2) {
      typeC(argv[i], t);
    }
  }

  return 0;
}
