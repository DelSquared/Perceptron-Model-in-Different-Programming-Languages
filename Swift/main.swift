import Foundation

class Perceptron{
  var w:[Double]=[Double.random(in: -1...1),Double.random(in: -1...1)]
  var b:Double=Double.random(in: -1...1)

  func Eval(x:[Float])->Double{
    return 1/(1+exp(-(Double(x[0])*w[0])-(Double(x[1])*w[1])-b))
  }

  func d(x:Double)->Double{
    return x*(1-x)
  }

  func Train(data:[[Float]],labels:[Float],epochs:Int=5000000,dt:Double=0.001){
    var verbosity:Int=Int(floor(Float(epochs)/10))
    for i in 0...epochs{
      for j in 0...3{
        w[0] += (Double(labels[j])-Eval(x:data[j]))*d(x:Eval(x:data[j]))*Double(data[j][0])*dt
        w[1] += (Double(labels[j])-Eval(x:data[j]))*d(x:Eval(x:data[j]))*Double(data[j][1])*dt
        b += (Double(labels[j])-Eval(x:data[j]))*d(x:Eval(x:data[j]))*dt
      }
      if (i%verbosity==0){
        var error:Double=0
        for j in 0...3{
          error+=(Double(labels[j])-Eval(x:data[j]))*(Double(labels[j])-Eval(x:data[j]))*0.25
        }
        print("Epochs(%): "+String(i*100/epochs)+" ... Error: "+String(error))
      }
    }
  }

}

var x:[[Float]] = [[0,0],[0,1],[1,0],[1,1]]
var y:[Float] = [0,0,0,1]

var p:Perceptron = Perceptron()

print("\nPre-Training:")
for i in 0...3{
  print(p.Eval(x:x[i]))
}
print("\n")

p.Train(data:x,labels:y)

print("\nPost-Training:")
for i in 0...3{
  print(p.Eval(x:x[i]))
}
print("\n")
