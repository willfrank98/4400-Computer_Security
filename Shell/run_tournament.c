#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "csapp.h"

//static void run_tournament(int seed, int rounds, int num_progs, char **progs);
static void run_tournament2(int seed, int rounds, int num_progs, char **progs);
static char* read_to_string(int fd, int len);
static void deal_with_losers(int pids[], int players);

int main(int argc, char **argv)
{
  int rounds, seed;

  if (argc < 4) {
    fprintf(stderr, "%s: expects <random-seed> <round-count> <player-program> <player-program> ...\n", argv[0]);
    return 1;
  }

  seed = atoi(argv[1]);
  if (seed < 1) {
    fprintf(stderr, "%s: bad random seed; not a positive number: %s\n", argv[0], argv[1]);
    return 1;
  }

  rounds = atoi(argv[2]);
  if (rounds < 1) {
    fprintf(stderr, "%s: bad round count; not a positive number: %s\n", argv[0], argv[2]);
    return 1;
  }

  run_tournament2(seed, rounds, argc - 3, argv + 3);

  return 0;
}

static void run_tournament2(int seed, int rounds, int players, char **progs)
{
  printf("Starting new tournament: seed = %d, rounds = %d, players = %d\n", seed, rounds, players);
  //start a new round
  int wins[players], fails[players], pids[players], game_pid;
  int i;
  for (i = 0; i < players; i++) {
    wins[i] = 0;
    fails[i] = 0;
  }

  for (i = 0; i < rounds; i++) {
    printf("Round %d\n", i);
    //pipe and launch game_maker
    char seed_s[9], players_s[3];
    snprintf(seed_s, 9, "%d", seed + i); //seed + i
    snprintf(players_s, 3, "%d", players);
    int game_in[2], game_out[2];
    Pipe(game_in);
    Pipe(game_out);
    //printf("Starting game_maker\n");
    char* game_args[] = {"./game_maker", seed_s, players_s, "40", "45", NULL};
    game_pid = Fork();
    if (game_pid == 0) {
      Dup2(game_in[0], 0);
      Dup2(game_out[1], 1);
      Close(game_out[0]);
      Close(game_in[1]);
      Execve(game_args[0], game_args, environ);
    } else {
      Close(game_out[1]);
      Close(game_in[0]);
    }

    //pipe and launch players
    int p_in[players][2], p_out[players][2];
    int j;
    for (j = 0; j < players; j++) {
      //printf("Starting player %d: %s\n", j, progs[j]);
      char* p_args[] = {progs[j], NULL};
      Pipe(p_in[j]);
      Pipe(p_out[j]);

      //launch player
      pids[j] = Fork();
      if (pids[j] == 0) {
        Dup2(p_in[j][0], 0);
        Dup2(p_out[j][1], 1);
        Close(p_out[j][0]);
        //Close(p_in[j][1]);
        Execve(p_args[0], p_args, environ);
      } else {
        Close(p_out[j][1]);
        Close(p_in[j][0]);
      }
    }

    //read the goal, though not necessary to pipe it anywhere
    char* goal = read_to_string(game_out[0], 7);
    //printf("Got goal: %s", goal);

    int skip[players];
    for (j = 0; j < players; j++) {
      //read and send starting pos's
      char* start = read_to_string(game_out[0], 7);
      //printf("Got start pos for player %d: %s", j, start);
      Rio_writen(p_in[j][1], start, 7);
      skip[j] = 0;
    }

    int next_round = 0;
    //play the game
    while (!next_round) { //run until one player wins
      for (j = 0; j < players; j++) {
        if (skip[j]) {
          continue;
        }
        //get player guess
        char* guess = read_to_string(p_out[j][0], 7);
        //printf("Got player %d's next guess: %s", j, guess);
        //send to game_maker
        Rio_writen(game_in[1], guess, 7);
        //get response
        char* res = read_to_string(game_out[0], 7);
        //printf("This guess was: %s", res);
        if (strcmp(res, "winner\n") == 0) { //winner!
          next_round = 1;
          Rio_writen(p_in[j][1], res, 7);
          //check to make sure winner exits correctly
          int status;
          waitpid(pids[j], &status, 0);
          if (WEXITSTATUS(status)) {
            printf("Winner DID NOT exit correctly\n");
            fails[j]++;
          } else {
            wins[j]++;
          }
          break;
        }
        else if (strcmp(res, "wrong!") == 0) { //fail
          fails[j]++;
          skip[j] = 1;
        }
        //send response to player
        Rio_writen(p_in[j][1], res, 7);
      }
    }

    //printf("Closing pipes\n");
    int k;
    for (k = 0; k < players; k++) {
      Close(p_in[k][1]);
      Close(p_out[k][0]);
      //Close(p_in[k][1]);
    }
    Close(game_in[1]);
    Close(game_out[0]);

    //printf("waiting on all child processes to finish...\n");
    deal_with_losers(pids, players);
    kill(game_pid, SIGINT);
    int status;
    Wait(&status);
  }

  //write the results here
  printf("results:\n\n%d\n", rounds);
  for (i = 0; i < players; i++) {
    printf("%d %d %d\n", wins[i], rounds - wins[i], fails[i]);
  }
}

static char *read_to_string(int fd, int len) {
  int amt = 0, got = 0;
  ssize_t size = len + 1;
  char buffer[size];
  while(amt < len) {
    got = Read(fd, buffer + amt, len - amt);
    amt += got;
  }
  return strdup(buffer);
}

static void deal_with_losers(int pids[], int players) {
  int i;
  for (i = 0; i < players; i++) {
    kill(pids[i], SIGINT);
  }
}
