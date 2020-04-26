#include <iostream>
#include <math.h>

#define d(x) x*(1-x)
#define E(x,y) (x-y)*(x-y)
#define dE(x,y) (y-x)

#define dt 0.001
#define EPOCHS 10000000
#define VERBOSITY 1000000

class Perceptron {
  public:
  
    double w[2];
    double b;
    
    Perceptron() {
      w[0] = (double)rand()/RAND_MAX;
      w[1] = (double)rand()/RAND_MAX;
      b = (double)rand()/RAND_MAX;
    }

    float Eval(double x[2]){
      return f(w[0]*x[0] + w[1]*x[1] + b);
    }

    void Train( double data[4][2], double label[4]) {
    
      std::cout << "Training initiated...\n";
      unsigned int i;
      unsigned short j;
      float delta;
      
      for(i=0; i<EPOCHS; i++){
        for(j=0;j<4;j++){
          delta = dE(Eval(data[j]),label[j])*d(Eval(data[j]))*dt;
          w[0]+=data[j][0]*delta;
          w[1]+=data[j][1]*delta;
          b+=delta;
        } 
        
        if(i%VERBOSITY == 0){
          double Error=0;
          for(j=0;j<4;j++){
            Error += E(Eval(data[j]),label[j]);
          } 
          std::cout << "Epochs(%): " << 100.0*(double)i/(double)EPOCHS << " ... Error: " << Error << "\n";
        }
        
      }
    }
    
  private:
  
    double f(double x){
      return 1.0/(1.0+exp(-x));
    }
    
};

