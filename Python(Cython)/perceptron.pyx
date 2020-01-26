#this is a semi-wrapper for the C perceptron example using mostly the same functions defined in that header file just tweaked.

from libc.stdlib cimport rand
cdef extern from "limits.h":
    int INT_MAX

cdef extern from "perceptron.h":
    double Eval(double w[2], double b, double x[2])
    void Train (double* w0, double* w1, double* b, double data[4][2], double label[4], unsigned int epochs, double dt)

class perceptron:
    
    def __init__(self):
        self.epochs = 10000000
        self.dt = 0.01
        self.w = [rand() / float(INT_MAX), rand() / float(INT_MAX)]
        self.b = rand() / float(INT_MAX)
    def Eval(self,x):
        cdef double _x[2]
        _x[0] = x[0]
        _x[1] = x[1]
        cdef double _w [2] 
        _w[0] = self.w[0]
        _w[1] = self.w[1]
        cdef double _b = self.b
        return Eval(_w, _b, _x)
    def Train(self,data,label):
        cdef double _data[4][2]
        cdef double _label[4]
        cdef double w0 = self.w[0]
        cdef double w1 = self.w[1]
        cdef double b = self.b
        for i in [0,1,2,3]:
            _data[i][:] = [data[i][0],data[i][1]]
            _label[i] = label[i]
        #print(w0,w1,b)
        Train(&w0, &w1, &b, _data, _label, self.epochs, self.dt)
        #print(w0,w1,b)
        self.w = [w0,w1]
        self.b = b
