import numpy as np 
import tensorflow.keras as keras
import tensorflow as tf

x = np.array([[0,0],[0,1],[1,0],[1,1]])
y = np.array([[0],[0],[0],[1]]) #AND gate

p = keras.models.Sequential()
p.add(keras.layers.Dense(1, input_shape=(2,), activation='sigmoid', use_bias=True))

p.compile(optimizer='sgd',
              loss='mean_squared_error',
              metrics=['accuracy'])

p.fit(x, y, batch_size=4, nb_epoch=100000)

print(p.predict(x))
