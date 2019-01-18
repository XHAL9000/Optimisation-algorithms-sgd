function [res] = RMSprop( f,x0, tlr)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  iter = 0;
  [l c]=size(x0');
  loss = [];
  grad_average = zeros(l,c);
  a=0.1;
  bet=0.9;
  epsilon=10e-5;
  x0=x0';
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    grad_average = bet * grad_average + (1- bet) * grad(num2cell(x0){:}).^2; 
    x0=x0-a*grad(num2cell(x0){:})./sqrt(grad_average + epsilon);
    loss=[loss,fun(num2cell(x0){:})];
    iter++;
  endwhile
  res = x0 ;
  iter=iter;
endfunction
