#include <math.h>
#define d(x) x*(1-x)
#define E(x,y) (x-y)*(x-y)
#define dE(x,y) (y-x)

double Eval(double w[2], double b, double x[2]){
    return 1.0/(1.0+exp(-(x[0]*(w[0])+x[1]*(w[1])+(b))));
}

void Train ( double* w0,  double* w1, double* b, double data[][2], double label[], unsigned int sizedata, unsigned int epochs, double dt){
  printf("Training initiated...\n");
  unsigned int i;
  unsigned short j;
  float delta;
  double w [2];
  w[0] = *w0;
  w[1] = *w1;
  double _b = *b;
  for(i=0;i<epochs;i++){
    for(j=0;j<sizedata;j++){
      w[0] = *w0;
      w[1] = *w1;
      _b = *b;
      delta = dE(Eval(w,_b,data[j]),label[j])*d(Eval(w,_b,data[j]))*dt;
      *w0+=data[j][0]*delta;
      *w1+=data[j][1]*delta;
      *b+=delta;
    }
    if(i%(int)(epochs/10)==0){
      double Error=0;
      for(j=0;j<sizedata;j++){
        Error += E(Eval(w,*b,data[j]),label[j]);
      }
      printf("Epochs(\%): %f ... Error: %f\n",100.0*(double)i/(double)epochs,Error);
    }
  }
}
