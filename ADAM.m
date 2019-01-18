function [res loss iter] = ADAM( f,x0,tlr,bet1,bet2)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  iter = 0;
  [l c]=size(x0');
  loss = [];
  grad_average1 = zeros(l,c);
  grad_average2 = zeros(l,c);
  epsilon=10e-5;
  syms alpha;
  x0=x0';
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    grad_average1 = bet1*grad_average1 +(1- bet1) * grad(num2cell(x0){:});  
    grad_average2 = bet2*grad_average2 +(1- bet2) * grad(num2cell(x0){:}).^2;
    m1=grad_average1./1-bet1;
    m2=grad_average2./1-bet2;
    direction = grad_average1./sqrt(grad_average2 + epsilon);
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