function [res loss iter] = adadelta(f,x0,tlr,bet)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  iter = 0;
  x0=x0';
  [l c]=size(x0);
  loss = [];
  grad_average = zeros(l,c);
  param_average = zeros(l,c);
  epsilon=10e-5;
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    grad_average = bet * grad_average + (1- bet) * (grad(num2cell(x0){:}).^2); 
    RMS=sqrt(param_average+epsilon)./sqrt(grad_average + epsilon);
    direction = grad(num2cell(x0){:}).*RMS;
    x0=x0-direction;
    param_average = bet * param_average + (1- bet) * (direction.^2);

    loss=[loss,fun(num2cell(x0){:})];
    iter++;
  endwhile
  res = x0 
  iter=iter
  loss=loss;
endfunction
