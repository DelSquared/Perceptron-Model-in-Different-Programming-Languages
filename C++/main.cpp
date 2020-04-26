#include <iostream>
#include "perceptron.hpp"

#define SKIP_LINE std::cout << "\n"

int main() {
  double x[4][2]={{0,0},{0,1},{1,0},{1,1}};
  double y[4]={0,0,0,1}; //AND gate

  Perceptron p;

  std::cout << "\nPre-Training\n";
  for(unsigned short j=0;j<4;j++){
    std::cout << p.Eval(x[j]) << " \n";
  }
  
  SKIP_LINE;

  p.Train(x,y); //training

  SKIP_LINE;
  
  std::cout << "\nPost-Training\n";
  for(unsigned short j=0;j<4;j++){
    std::cout << p.Eval(x[j]) << " \n";
  }

  SKIP_LINE;


}
