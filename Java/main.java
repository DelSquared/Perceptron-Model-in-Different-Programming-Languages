import java.util.ArrayList; 
import java.util.List;

class Main {
  public static void main(String[] args) {
    Perceptron p = new Perceptron();
    List<double[]> x = new ArrayList<double[]>();
    x.add(new double[]{0,0});
    x.add(new double[]{0,1});
    x.add(new double[]{1,0});
    x.add(new double[]{1,1});
    List<double[]> y = new ArrayList<double[]>();
    y.add(new double[]{0.0});
    y.add(new double[]{0.0});
    y.add(new double[]{0.0});
    y.add(new double[]{1.0}); //AND gate

    System.out.println("\nPre-Training");   
    System.out.println(p.Eval(x.get(0)));
    System.out.println(p.Eval(x.get(1)));
    System.out.println(p.Eval(x.get(2)));
    System.out.println(p.Eval(x.get(3)));

    p.Train(x,y,10000000,0.001);

    System.out.println("\nPost-Training");   
    System.out.println(p.Eval(x.get(0)));
    System.out.println(p.Eval(x.get(1)));
    System.out.println(p.Eval(x.get(2)));
    System.out.println(p.Eval(x.get(3)));
  }
}
