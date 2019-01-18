function [res loss iter] = optiRMSprop( f,x0,tlr,bet)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  iter = 0;
  [l c]=size(x0');
  loss = [];
  grad_average = zeros(l,c);
  epsilon=10e-5;
  syms alpha;
  x0=x0';
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    grad_average = bet*grad_average +(1- bet) * grad(num2cell(x0){:}).^2;
    direction = grad(num2cell(x0){:})./sqrt(grad_average + epsilon);
    v=x0-alpha*direction;
    phi=fun(num2cell(v){:}); 
    mu = newton(phi,1,tlr);
    x0=x0-mu*direction;
    loss=[loss,fun(num2cell(x0){:})];
    iter++;
  endwhile
  res = x0 
  iter=iter
  loss = loss
endfunction