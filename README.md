# Perceptron-Model-in-Different-Programming-Languages
Perceptron Model in Different Programming Languages

## Description

This repository is mainly intended for educational/recreational purposes by providing example-code of a perceptron model implemented in multiple programming languages.

### Currently available languages:
- Python(Numpy)
- Python(Keras)
- Python(Tensorflow)

### Future additions:
- Javascript(NodeJS)
- Javascript(p5JS)
- Java
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
