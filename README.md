# Perceptron Model in Different Programming Languages
Perceptron Model in Different Programming Languages

## Description

This repository is mainly intended for educational/recreational purposes by providing example-code of a perceptron model implemented in multiple programming languages.

The example being considered is an AND gate emulation. This can be switched out to be any simple binary logic gate that's linearly separable (i.e. not XOR or NXOR) by changing the labels that are hard-coded to the desired gate. 

### Currently available languages:
- Python(Numpy)
- Python(Keras)
- Python(Tensorflow)
- Java
- Typescript
- Javascript(NodeJS)

### Future additions:
- Javascript(p5JS)
- Lua
- C#
- C/C++/CUDA
- Rust (Maybe?)
- LuaC++

## Outputs

### Python(Numpy)

```
Weights:

[[-0.06385825]
 [ 0.31008403]]

Biases:

[[0.75214673]]


Pre-training

[[0.67964628]
 [0.74311662]
 [0.66558608]
 [0.73073848]]

Training for 100000 epochs...
Progress: 0.0% ... Error: 1.529283817045281
Progress: 10.0% ... Error: 0.5963336951291089
Progress: 20.0% ... Error: 0.3977871484781369
Progress: 30.0% ... Error: 0.3009347811294628
Progress: 40.0% ... Error: 0.24119652933532412
Progress: 50.0% ... Error: 0.20002500397421824
Progress: 60.0% ... Error: 0.1698674071810621
Progress: 70.0% ... Error: 0.14688948909543426
Progress: 80.0% ... Error: 0.12887247254702422
Progress: 90.0% ... Error: 0.11442396270617813

Post-training

[[0.01083864]
 [0.20154302]
 [0.14796895]
 [0.80002344]]

Error: 0.10262249959544203
```

### Python(Keras)

```
Epoch 1/100000
4/4 [==============================] - 0s 67ms/sample - loss: 0.2694 - acc: 0.5000
Epoch 2/100000
4/4 [==============================] - 0s 1ms/sample - loss: 0.2691 - acc: 0.5000
Epoch 3/100000
4/4 [==============================] - 0s 713us/sample - loss:0.2687 - acc: 0.5000
Epoch 4/100000
4/4 [==============================] - 0s 970us/sample - loss:0.2684 - acc: 0.5000
Epoch 5/100000
4/4 [==============================] - 0s 640us/sample - loss:0.2680 - acc: 0.5000
Epoch 6/100000
4/4 [==============================] - 0s 643us/sample - loss:0.2677 - acc: 0.5000
Epoch 7/100000
4/4 [==============================] - 0s 756us/sample - loss:0.2674 - acc: 0.5000
Epoch 8/100000
4/4 [==============================] - 0s 739us/sample - loss:0.2670 - acc: 0.5000
Epoch 9/100000
4/4 [==============================] - 0s 710us/sample - loss:0.2667 - acc: 0.5000
Epoch 10/100000
4/4 [==============================] - 0s 625us/sample - loss:0.2663 - acc: 0.5000

...

Epoch 99995/100000
4/4 [==============================] - 0s 265us/sample - loss:0.0057 - acc: 1.0000
Epoch 99996/100000
4/4 [==============================] - 0s 285us/sample - loss:0.0057 - acc: 1.0000
Epoch 99997/100000
4/4 [==============================] - 0s 339us/sample - loss:0.0057 - acc: 1.0000
Epoch 99998/100000
4/4 [==============================] - 0s 302us/sample - loss:0.0057 - acc: 1.0000
Epoch 99999/100000
4/4 [==============================] - 0s 448us/sample - loss:0.0057 - acc: 1.0000
Epoch 100000/100000
4/4 [==============================] - 0s 348us/sample - loss:0.0057 - acc: 1.0000
[[8.4083923e-04]
 [8.1297390e-02]
 [8.1297427e-02]
 [9.0296149e-01]]
```

### Python(Tensorflow)

```
Epoch(%):  0.0 %    loss:  0.33210212
Epoch(%):  10.0 %    loss:  0.015254875
Epoch(%):  20.0 %    loss:  0.0068163867
Epoch(%):  30.0 %    loss:  0.0042989245
Epoch(%):  40.0 %    loss:  0.003116064
Epoch(%):  50.0 %    loss:  0.002434728
Epoch(%):  60.0 %    loss:  0.0019938578
Epoch(%):  70.0 %    loss:  0.001685899
Epoch(%):  80.0 %    loss:  0.0014588995
Epoch(%):  90.0 %    loss:  0.0012851977
Epoch(%):  100.0 %    loss:  0.0011477593

Elapsed time  30.536971328793644
________________________________________________________________________________

  [0.03386783]
  [0.03388705]
  [0.03387891]
  [0.9661194]
```
### Java
```
Pre-Training
0.5348137280104677
0.723578338386435
0.7502927912229587
0.8724698405926142

Starting training for 10000000 epochs...
Epoch(%): 0%, Error: 1.3884018373317462
Epoch(%): 10%, Error: 0.010522028036657579
Epoch(%): 20%, Error: 0.0049630849565218665
Epoch(%): 30%, Error: 0.003218925932545704
Epoch(%): 40%, Error: 0.0023740418311171464
Epoch(%): 50%, Error: 0.0018773794404555915
Epoch(%): 60%, Error: 0.0015510882572958048
Epoch(%): 70%, Error: 0.0013206127992833052
Epoch(%): 80%, Error: 0.0011492857031122742
Epoch(%): 90%, Error: 0.001016999191696389
Epoch(%): 99%, Error: 9.118158525567842E-4

Post-Training
5.474909704186176E-6
0.016365370942308083
0.016365386572161952
0.9806050372816417
```
### Typescript
```
0.7304081197614447
0.7710994438929843
0.8005525165435999
0.8330760587564477
Epoch(%): 0% ... Error: 0.5932394397111913
Epoch(%): 10% ... Error: 0.00026804890681212426
Epoch(%): 20% ... Error: 0.00013127665844091298
Epoch(%): 30% ... Error: 0.00008672169316476456
Epoch(%): 40% ... Error: 0.00006468917895902311
Epoch(%): 50% ... Error: 0.000051560524953053264
Epoch(%): 60% ... Error: 0.000042850362282691576
Epoch(%): 70% ... Error: 0.000036651444473264826
Epoch(%): 80% ... Error: 0.000032015586537896924
Epoch(%): 90% ... Error: 0.00002841834265688727
1.553356647888704e-7
0.0050543214573224365
0.005054319928508864
0.9940167369413687
```
### NodeJS
```
Pre-Training
0.6918047896906404
0.6998179549852507
0.7742769392294069
0.7808251531875576

Epoch(%): 0% ... Error: 0.4882705640615913
Epoch(%): 10% ... Error: 0.0031066294620815537
Epoch(%): 20% ... Error: 0.0014612005571914071
Epoch(%): 30% ... Error: 0.0009469467937243809
Epoch(%): 40% ... Error: 0.000698162821943197
Epoch(%): 50% ... Error: 0.0005520079884997068
Epoch(%): 60% ... Error: 0.0004560234209277485
Epoch(%): 70% ... Error: 0.0003882400838516292
Epoch(%): 80% ... Error: 0.000337859994030239
Epoch(%): 90% ... Error: 0.00029896418624558594

Post-Training
0.000005481532567786762
0.016371928302539418
0.016371877905484358
0.9805974566723038
```
