#This code is not ready do not use it
#There are still some minor bugs

class Perceptron
  @w = [] of Float64
  @b : Float64
  def initialize
    @b = rand()
    @w = [rand(),rand()]
  end
  def w
    @w
  end
  def b
    @b
  end

  def eval(x : Array(Float64)) : Float64
    return 1/(1+Math.exp(-x[0]*@w[0] - x[1]*@w[1] - b))
  end

  def train(data : Array(Array(Float64)), label : Array(Float64), dt : Float64=0.001, epochs : UInt64 = 5000000)
    i : UInt64 = 0
    j : UInt8 = 0
    err : Float64 = 0

    while i<=epochs

      if i%500000==0
        err=0
        j=0
        while j<3
          err+=(0.25*(label[j]-eval(data[j]))*(label[j]-eval(data[j])))
          j+=1
        end
        puts (100*i/epochs).to_s+"% ... Error: "+err.to_s
      end

      j=0
      while j<3
        @w[0]+=(label[j]-eval(data[j]))*(eval(data[j])-eval(data[j])*eval(data[j]))*data[j][0]*dt
        @w[1]+=(label[j]-eval(data[j]))*(eval(data[j])-eval(data[j])*eval(data[j]))*data[j][1]*dt
        @b+=0.1*(label[j]-eval(data[j]))*(eval(data[j])-eval(data[j])*eval(data[j]))*dt

        j+=1
      end
      i+=1
    end

  end
end

data = [[0_f64,0_f64],[0_f64,1_f64],[1_f64,0_f64],[1_f64,1_f64]]
label = [0_f64,0_f64,0_f64,1_f64]

p = Perceptron.new
puts data[0]
puts p.eval(data[0])
puts data[1]
puts p.eval(data[1])
puts data[2]
puts p.eval(data[2])
puts data[3]
puts p.eval(data[3])

p.train(data,label)

puts data[0]
puts p.eval(data[0])
puts data[1]
puts p.eval(data[1])
puts data[2]
puts p.eval(data[2])
puts data[3]
puts p.eval(data[3])
