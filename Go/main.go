package main

import "fmt"
import "math/rand"
import "math"
import "io"
import "os"

type Perceptron struct {
 
  w [2] float64;
  b float64;
 
}

func (p *Perceptron) Init() {
  p.w[0]=rand.Float64()
  p.w[1]=rand.Float64()
  p.b=rand.Float64()
}

func (p Perceptron) Eval(x [2] float64) float64 {
  return 1/(1+math.Exp(-x[0]*p.w[0]-x[1]*p.w[1]-p.b))
}

func (p *Perceptron) Train(data [4][2] float64, label [4] float64, epoch int, dt float64){
  for i := 0; i <= epoch; i++ {
    if(i%(epoch/10)==0){
      var err float64 = 0;
      for j := 0; j < 4; j++ {
        err+=(label[j]-p.Eval(data[j]))*(label[j]-p.Eval(data[j]))
      }
      s := fmt.Sprintf("%d%% ... Error: %f\n",int(i*100/epoch),err)
      io.WriteString(os.Stdout, s)
    }
      for j := 0; j < 4; j++ {
        p.w[0]+=(label[j]-p.Eval(data[j]))*(p.Eval(data[j])-p.Eval(data[j])*p.Eval(data[j]))*data[j][0]*dt
        p.w[1]+=(label[j]-p.Eval(data[j]))*(p.Eval(data[j])-p.Eval(data[j])*p.Eval(data[j]))*data[j][1]*dt
        p.b+=(label[j]-p.Eval(data[j]))*(p.Eval(data[j])-p.Eval(data[j])*p.Eval(data[j]))*dt
      }
    }
}

func main() {

  var p Perceptron;

  p.Init();

  var x = [4][2] float64{{0,0},{0,1},{1,0},{1,1}};
  var y = [4] float64{0,0,0,1};

  fmt.Println(p.Eval(x[0]));
  fmt.Println(p.Eval(x[1]));
  fmt.Println(p.Eval(x[2]));
  fmt.Println(p.Eval(x[3]));

  p.Train(x,y,10000000,0.001)

  fmt.Println(p.Eval(x[0]));
  fmt.Println(p.Eval(x[1]));
  fmt.Println(p.Eval(x[2]));
  fmt.Println(p.Eval(x[3]));

}
