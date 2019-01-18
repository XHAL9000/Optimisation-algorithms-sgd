function [res loss iter] = adagrad(f,x0,tlr)
  x0=x0';
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  [l c]=size(x0);
  loss = [];
  grad_square = zeros(l,c);
  epsilon=10e-5;
  iter = 0;
  syms alpha;
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    grad_square = grad_square + grad(num2cell(x0){:}).^2;
    direction = grad(num2cell(x0){:})./sqrt(grad_square + epsilon);
    v=x0-alpha*direction;
    phi=fun(num2cell(v){:}); 
    mu = newto(phi,1,tlr);
    x0=x0-mu*direction;
    loss=[loss,fun(num2cell(x0){:})];
    iter++;
  endwhile
  res = x0 
  iter=iter
endfunction