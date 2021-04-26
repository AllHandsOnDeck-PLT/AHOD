#include <stdio.h>
#include <stdlib.h>

struct Player 
{
  char *name;
  int score;
};

/*int main() {

  struct Player *p;
  p = player("Bob",1);

  printf("Pointer is: (%s, %d)", p->name, p->score);

  return 0;
}*/

struct Player *playercall(char* name, int score)
{
  struct Player *p;
  p = (struct Player *) malloc(sizeof(struct Player));
  p->name = name;
  p->score = score;
  return p;
}

char *getplayername(struct Player *player)
{
  return player->name;
}

int getplayerscore(struct Player *player)
{
  return player->score;
}