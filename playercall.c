#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>

typedef struct {
  int *array;
  size_t used;
  size_t size;
} Array;

void initArray(Array *a, size_t initialSize) {
  a->array = malloc(initialSize * sizeof(int));
  a->used = 0;
  a->size = initialSize;
}

void insertArray(Array *a, int element) {
  // a->used is the number of used entries, because a->array[a->used++] updates a->used only *after* the array has been accessed.
  // Therefore a->used can go up to a->size 
  if (a->used == a->size) {
    a->size *= 2;
    a->array = realloc(a->array, a->size * sizeof(int));
  }
  a->array[a->used++] = element;
}

void freeArray(Array *a) {
  free(a->array);
  a->array = NULL;
  a->used = a->size = 0;
}

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

char *setplayername(struct Player *player, char* name)
{
  player->name = name;
  return player->name;
}

void setplayerscore(struct Player *player, int score)
{
  player->score = score;
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