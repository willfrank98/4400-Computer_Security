#include "csapp.h"

int main()
{
  char* args[] = {"/bin/ls", NULL};
  int new_out[2];
  char buffer[4];
  int status, got;

  printf("Running %s...\n", args[0]);

  Pipe(new_out);

  if (Fork() == 0) {
    Dup2(new_out[1], 1);
    Execve( args[0], args, environ);
  }

  Wait(&status);

  got = Read(new_out[0], buffer, 3);
  
  if (got != 3)
     app_error("didn't get three bytes");
  buffer[3] = 0;

  printf("Got: %s\n", buffer);

  return 0;
}
