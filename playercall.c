#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

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

struct Card 
{
  char *type;
  bool faceup;
};

struct Card *cardcall(char* type, bool faceup)
{
  struct Card *c;
  c = (struct Card *) malloc(sizeof(struct Card));
  c->type = type;
  c->faceup = faceup;
  return c;
}

char *getcardtype(struct Card *card)
{
  return card->type;
}

bool getcardfaceup(struct Card *card)
{
  return card->faceup;
}