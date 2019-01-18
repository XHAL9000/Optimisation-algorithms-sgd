function [res loss iter] = nestrov( f,x0,tlr,bet)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  iter = 0;
  [l c]=size(x0');
  loss = [];
  grad_average = zeros(l,c);
  syms alpha;
  mu=1;
  x0=x0';
  while(norm(grad(num2cell(x0){:}))>tlr && iter<100 )
    nest=x0-bet*grad_average;
    grad_average = bet*grad_average +(1- bet) * grad(num2cell(nest){:});
    v=x0-alpha*grad_average;
     phi=fun(num2cell(v){:}); 
    mu = newton(phi,1,0.1);
    x0=x0-mu*grad_average;
    loss=[loss,fun(num2cell(x0){:})];
    iter++;
  endwhile
  res = x0 
  iter=iter
  loss = loss
endfunction