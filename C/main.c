#include <stdio.h>
#include <stdlib.h>
#include "perceptron.h"
#define SKIP_LINE printf("\n") 
//this macro was defined because I couldn't be bothered to keep
//...typing it out over and over just to make the output "pretty"

int main(void) {

  double x[4][2]={{0,0},{0,1},{1,0},{1,1}};
  double y[4]={0,0,0,1}; //AND gate
  
  unsigned short j;
  //loop variable for printing purposes because C does not let you define it in the loop

  Perceptron p;
  Init(&p); //defining and initialising the perceptron
  //---------------------------------------
  
  printf("\nPre-Training\n");
  for(j=0;j<4;j++){
    printf("%f\n",p.Eval(&p, x[j]));
  }
  SKIP_LINE; //printing pre-training values
  //---------------------------------------
  
  p.Train(&p,x,y); //training
  SKIP_LINE;
  //---------------------------------------

  printf("\nPost-Training\n");
  for(j=0;j<4;j++){
    printf("%f\n",p.Eval(&p, x[j]));
  }
  SKIP_LINE; //printing post-training values
  //---------------------------------------
  

  return 0;
}
