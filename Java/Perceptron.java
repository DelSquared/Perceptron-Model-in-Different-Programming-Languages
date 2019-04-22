import java.util.ArrayList; 
import java.util.List;

public class Perceptron {
  public double[] w = new double[2];
  public double b;

  public Perceptron(){
    w[0]=Math.random();
    w[1]=Math.random();
    b=Math.random();
  }

  private double Dot(double[] a, double[] b){
    return a[0]*b[0] + a[1]*b[1];
  }

  private double Activate(double a){
    return 1/(1+Math.exp(-a));
  }

  private double Error(List<double[]> data, List<double[]> labels){
    double E = 0.0;
    for(byte j=0;j<4;j++){
        double[] x = data.get(j); 
        double y = labels.get(j)[0]; 
        E += (y-Eval(x))*(y-Eval(x));
      } 
      return E;
  }

  public double Eval(double[] x){
    return Activate(Dot(w,x)+b);
  }

  public void Train(List<double[]> data, List<double[]> labels, long epochs, double dt){
    System.out.println("\nStarting training for "+epochs+" epochs...");   
    for(long i=0;i<epochs;i++){
      for(byte j=0;j<4;j++){
        double[] x = data.get(j); 
        double y = labels.get(j)[0]; 
        w[0] += (y-Eval(x))*(Eval(x)-Eval(x)*Eval(x))*x[0]*dt;
        w[1] += (y-Eval(x))*(Eval(x)-Eval(x)*Eval(x))*x[1]*dt;
        b += (y-Eval(x))*(Eval(x)-Eval(x)*Eval(x))*dt;
      } 
      if (i%Math.floor((double)epochs/10)==0 || i==epochs-1){
        System.out.println("Epoch(%): "+(i*100/epochs)+"%, Error: "+Error(data,labels));
      }
      
    }
  }

}
