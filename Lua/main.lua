-- Lua 5.1.5
Perceptron = {w={0,0}, b = 0}
function Perceptron:new (o)
   o = o or {}
   setmetatable(o, self)
   self.__index = self
   self.w = {math.random(),math.random()}
   self.b = math.random()
   return o
end
function Perceptron:Eval (x)
   return 1/(1+math.exp(-(self.w[1]*x[1]+self.w[2]*x[2]+self.b)))
end
function Perceptron:Train (data,label,epochs,dt)
   verbosity = math.floor(epochs/10)
   for i=1,epochs,1
   do
     for j=1,4,1
     do
       dw1 = (label[j]-self:Eval(data[j]))*(self:Eval(data[j])-self:Eval(data[j])*self:Eval(data[j]))*data[j][1]*dt
       dw2 = (label[j]-self:Eval(data[j]))*(self:Eval(data[j])-self:Eval(data[j])*self:Eval(data[j]))*data[j][2]*dt
       db = (label[j]-self:Eval(data[j]))*(self:Eval(data[j])-self:Eval(data[j])*self:Eval(data[j]))*dt
       self.w[1]=self.w[1]+dw1
       self.w[2]=self.w[2]+dw2
       self.b=self.b+db
     end
     if (i-1)%verbosity==0 then
       print("Epoch(%): "..((i-1)*100/epochs).."%, Error: "..((label[1]-self:Eval(data[1]))*(label[1]-self:Eval(data[1]))))
     end
     
   end
end
function Perceptron:SaveWeights(filename)
   local file = io.open(filename, "w")
   file:write(self.w[1]..","..self.w[2]..","..self.b)
   file:close()
end
function Perceptron:LoadWeights(filename)
   local file = io.open(filename, "r")
   io.input(file)
   WeightString=io.read()
   file:close()
   w1,w2,b = WeightString:match("([^,]+),([^,]+),([^,]+)")
   self.w[1],self.w[2],self.b = tonumber(w1),tonumber(w2),tonumber(b)
end

-----------------------------------------------------------------------------------------------

p=Perceptron:new()

x={{0,0},{0,1},{1,0},{1,1}}
y={0,0,0,1}

print("Pre-Training")
print(p:Eval(x[1]))
print(p:Eval(x[2]))
print(p:Eval(x[3]))
print(p:Eval(x[4]))

p:Train(x,y,1000000,0.01)

print("Post-Training")
print(p:Eval(x[1]))
print(p:Eval(x[2]))
print(p:Eval(x[3]))
print(p:Eval(x[4]))
