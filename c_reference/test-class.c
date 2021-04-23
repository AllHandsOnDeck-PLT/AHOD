#include <stdio.h>

struct Player 
{
  char *name;
  int x;
};

int main() {

  struct Player p;
  p.name = "Bob";
  p.x = 1;

  printf("Pointer is: (%s, %d)", p.name, p.x);

  return 0;
}
