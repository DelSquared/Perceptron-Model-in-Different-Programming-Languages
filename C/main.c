#include <stdio.h>
#include <stdlib.h>
#include "perceptron.h"
#define SKIP_LINE printf("\n") //this was defined because I couldn't be bothered to keep typing it out over and over just to make the output "pretty"

int main(void) {

  double x[4][2]={{0,0},{0,1},{1,0},{1,1}};
  double y[4]={0,0,0,1};

  unsigned short j;

  Perceptron p;
  Init(&p);
  
  printf("\nPre-Training\n");
  for(j=0;j<4;j++){
    printf("%f\n",p.Eval(&p, x[j]));
  }
  SKIP_LINE;

  p.Train(&p,x,y);

  SKIP_LINE;

  printf("\nPre-Training\n");
  for(j=0;j<4;j++){
    printf("%f\n",p.Eval(&p, x[j]));
  }
  SKIP_LINE;
  

  return 0;
}
