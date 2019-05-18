#include <math.h>
#define d(x) x*(1-x)
#define E(x,y) (x-y)*(x-y)
#define dE(x,y) (y-x)

double dt = 0.001;
unsigned int epochs = 10000000;
unsigned int verbosity = 1000000;

typedef struct p1 Perceptron;

typedef double (*MethodDouble)(Perceptron* self, double x[2]);
typedef void (*MethodVoid)(Perceptron* self, double data[4][2],double label[4]);

struct p1 {
   double w[2];
   double b;
   MethodDouble Eval;
   MethodVoid Train;
};

double Eval(Perceptron* self, double x[2]){ 
    return 1.0/(1.0+exp(-(x[0]*(self->w[0])+x[1]*(self->w[1])+(self->b))));
}

void Train (Perceptron* self, double data[4][2],double label[4]){
  printf("Training initiated...\n");
  unsigned int i;
  unsigned short j;
  float delta;
  for(i=0;i<epochs;i++){
    for(j=0;j<4;j++){
      delta = dE(self->Eval(self,data[j]),label[j])*d(self->Eval(self,data[j]))*dt;
      self->w[0]+=data[j][0]*delta;
      self->w[1]+=data[j][1]*delta;
      self->b+=delta;
    } 
    if(i%verbosity==0){
      double Error=0;
      for(j=0;j<4;j++){
        Error += E(self->Eval(self,data[j]),label[j]);
      } 
      printf("Epochs(%): %f ... Error: %f\n",100.0*(double)i/(double)epochs,Error);
    }
  }
}

void Init(Perceptron* p){
   p->w[0]=(double)(rand()%1000)/1000;
   p->w[1]=(double)(rand()%1000)/1000;
   p->b=(double)(rand()%1000)/1000;
   p->Eval = Eval;
   p->Train = Train;
   printf("Perceptron initialised\n");
}
