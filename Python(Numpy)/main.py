import numpy as np 

x = np.array([[0,0],[0,1],[1,0],[1,1]])
y = np.array([[0],[0],[0],[1]]) #AND gate

class Perceptron:
  def __init__(self, inDim, outDim):
    self.w = np.random.uniform(-1,1,(inDim,outDim))
    self.b = np.random.uniform(-1,1,(1,outDim))

  def Eval(self,x):
    return 1/(1+np.exp(-(np.matmul(x,self.w)+self.b)))
  
  def Train(self,x,y,epochs,dt):
    print("\nTraining for {} epochs...".format(epochs))
    for _ in range(epochs):
      self.w += np.sum((y-self.Eval(x))*(self.Eval(x)-self.Eval(x)*self.Eval(x))*x)*dt
      self.b += np.sum((y-self.Eval(x))*(self.Eval(x)-self.Eval(x)*self.Eval(x)))*dt
      if _%10000==0:
        print("Progress: {}% ... Error: {}".format(_*100/epochs,np.sum((y-self.Eval(x))*(y-self.Eval(x)))))
  
  def Error(self,x,y):
    print("\nError: {}".format(np.sum((y-self.Eval(x))*(y-self.Eval(x)))))
  
  def PrintWeights(self):
    print("\nWeights:\n")
    print(self.w)
    print("\nBiases:\n")
    print(self.b)
    print("\n")

p = Perceptron(len(x[0]), 1)
p.PrintWeights()
print("\nPre-training\n")
print(p.Eval(x))
p.Train(x,y,100000,0.001)
print("\nPost-training\n")
print(p.Eval(x))
p.Error(x,y)
