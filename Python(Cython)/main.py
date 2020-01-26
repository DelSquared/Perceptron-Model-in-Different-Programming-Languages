from perceptron import perceptron

x = [[0,0],[0,1],[1,0],[1,1]]
y = [0,0,0,1]

p = perceptron()

print('PRE-TRAINING:')
for _ in x:
  print(p.Eval(_))

p.Train(x,y)
  
print('POST-TRAINING:')
for _ in x:
  print(p.Eval(_))
