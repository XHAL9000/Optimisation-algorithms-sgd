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

# Momentum :

Essentially, when using momentum, we push a ball down a hill. The ball accumulates momentum as it rolls downhill, becoming faster and faster on the way (until it reaches its terminal velocity if there is air resistance, i.e. γ<1). The same thing happens to our parameter updates: The momentum term increases for dimensions whose gradients point in the same directions and reduces updates for dimensions whose gradients change directions. As a result, we gain faster convergence and reduced oscillation.

# Adadelta :
Adadelta is an extension of Adagrad that seeks to reduce its aggressive, monotonically decreasing learning rate. Instead of accumulating all past squared gradients, Adadelta restricts the window of accumulated past gradients to some fixed size

# Adam :
 Adaptive Moment Estimation (Adam) is another method that computes adaptive learning rates for each parameter. In addition to storing an exponentially decaying average of past squared gradients vt like Adadelta and RMSprop, Adam also keeps an exponentially decaying average of past gradients mt, similar to momentum. Whereas momentum can be seen as a ball running down a slope, Adam behaves like a heavy ball with friction, which thus prefers flat minima in the error surface
# Nesterov accelerated gradient :
Momentum first computes the current gradient and then takes a big jump in the direction of the updated accumulated gradient , NAG first makes a big jump in the direction of the previous accumulated gradient , measures the gradient and then makes a correction , which results in the complete NAG update . This anticipatory update prevents us from going too fast and results in increased responsiveness, which has significantly increased the performance of RNNs on a number of tasks
# SOON : 
#Sadagrad :
#AdaMax:
#Nadam:
#AMSGrad:
# RESOURCE : 
http://ruder.io/optimizing-gradient-descent/index.html
