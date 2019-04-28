use std::f64; //-----I am fairly new to Rust so apologies if this code is not very "optimal"

pub struct Perceptron{
  w: [f64; 2],
  b: f64
}

impl Perceptron {
    pub fn eval(&mut self, x: [f64; 2])-> f64{
        return 1.0/(1.0+f64::exp(-(self.b+x[0]*self.w[0]+x[1]*self.w[1])));
    }
    pub fn error(&mut self, x: [f64; 2],y: f64)-> f64{
        return (y-self.eval(x))*(y-self.eval(x));
    }
    pub fn train(&mut self, data: [[f64; 2]; 4], labels: [f64; 4], epochs: u64, dt: f64){
      let verbosity = epochs/10;
        for i in 0..epochs {
          for j in 0..4 {
            self.b += (labels[j]-self.eval(data[j]))*(self.eval(data[j])-self.eval(data[j])*self.eval(data[j]))*dt;
            self.w[0] += (labels[j]-self.eval(data[j]))*(self.eval(data[j])-self.eval(data[j])*self.eval(data[j]))*data[j][0]*dt;
            self.w[1] += (labels[j]-self.eval(data[j]))*(self.eval(data[j])-self.eval(data[j])*self.eval(data[j]))*data[j][1]*dt;
          }
          if i%verbosity==0||i+1==epochs{
            println!("Epoch(%): {}% ... Error: {}",i*100/epochs,0.25*self.error(data[0],labels[0])+0.25*self.error(data[1],labels[1])+0.25*self.error(data[2],labels[2])+0.25*self.error(data[3],labels[3]));
          }
        }
    }
}

fn main() {

  let x:[[f64; 2]; 4] = [[0.0,0.0],[0.0,1.0],[1.0,0.0],[1.0,1.0]];
  let y:[f64; 4] = [0.0,0.0,0.0,1.0];

  let mut p = Perceptron{w:[1.0,1.0],b:1.0};
  println!("\nPre-Training");
  println!("{}",p.eval(x[0]));
  println!("{}",p.eval(x[1]));
  println!("{}",p.eval(x[2]));
  println!("{}\n",p.eval(x[3]));

  p.train(x,y,10000000,0.001);

  println!("\nPost-Training");
  println!("{}",p.eval(x[0]));
  println!("{}",p.eval(x[1]));
  println!("{}",p.eval(x[2]));
  println!("{}",p.eval(x[3]));
}
