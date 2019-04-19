# inspired by https://medium.com/@claude.coulombe/the-revenge-of-perceptron-learning-xor-with-tensorflow-eb52cbdf6c60

import tensorflow as tf
import time
import numpy as np

X = tf.placeholder(tf.float32, shape=[4,2], name = 'X')
Y = tf.placeholder(tf.float32, shape=[4,1], name = 'Y')

w = tf.Variable(tf.truncated_normal([2,1]), name = "w")

b = tf.Variable(tf.zeros([4,1]), name = "b")

with tf.name_scope("output") as scope:
    y_estimated = tf.sigmoid(tf.add(tf.matmul(X,w),b))

with tf.name_scope("loss") as scope:
    loss = tf.reduce_mean(tf.squared_difference(y_estimated, Y)) 

with tf.name_scope("train") as scope:
    train_step = tf.train.GradientDescentOptimizer(0.01).minimize(loss)

x= [[0,0],[0,1],[1,0],[1,1]]
y = [[0],[0],[0],[1]] #AND gate

init = tf.global_variables_initializer()
sess = tf.Session()

writer = tf.summary.FileWriter("./logs/and_logs", sess.graph)

sess.run(init)

t_start = time.clock()
for epoch in range(100001):
    sess.run(train_step, feed_dict={X: x, Y: y})
    if epoch % 10000 == 0:
        print('Epoch(%): ', np.ceil(epoch*100/100001),'%','   loss: ', sess.run(loss, feed_dict={X: x, Y: y}))
print()
t_end = time.clock()
print('Elapsed time ', t_end - t_start)
print("_"*80)
print()
for element in sess.run(y_estimated, feed_dict={X: x, Y: y}):
    print(' ',element)
print()
