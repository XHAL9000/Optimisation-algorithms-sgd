# DeepLearning-algorithms-octave
Implementation of deep learning optimization algorithms with octave

# Gradient Descent : 
Gradient descent is one of the most popular algorithms to perform optimization and by far the most common way to optimize neural networks

# RMSprop : 

RMSprop is an unpublished, adaptive learning rate method proposed by Geoff Hinton 
Geoff Hinton suggests βt to be set to 0.9, while a good default value for the learning rate η is 0.001.

# RMSprop with optimal βt and learning rate η using newton's algorithm  :
=>While Geof Hinton suggests βt to be set to 0.9 however in the experiments the constant
choice of βt leads sometimes to divergence of the sequence so I set 1 −1/t ≤ βt ≤ 1 −γ/t  which always leads to convergence 

=>For the learning rate I use newton's algorithm to pick the best learning rate to converge faster 

# Adagrad:
Adagrad modifies the general learning rate η at each time step t for every parameter θ based on the past gradients that have been computed 
 
# SOON : 
#Sadagrad :
#Momentum :
#Nesterov accelerated gradient :
#Adadelta :
#Adam :
#AdaMax:
#Nadam:
AMSGrad:
