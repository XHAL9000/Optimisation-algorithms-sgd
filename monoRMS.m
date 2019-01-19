function [res loss k] = monoRMS( f,x0,bet=0.9,M=10)
  fun=function_handle(f);
  grad=function_handle(gradient(f));
  k = 1;
  [l c]=size(x0');
  loss =fun(num2cell(x0){:});
  grad_average = zeros(l,c);
  epsilon=10e-5;
  eps =1/4;
  m=0;
  x0=x0';
  while( k <= 100 )
    a=0.9999;
    grad_average = bet*grad_average +(1- bet) * grad(num2cell(x0){:}).^2;
    dir = -grad(num2cell(x0){:})./sqrt(grad_average + epsilon);
    maxF = max(loss(k-m:k));
    display(maxF);
     while( fun(num2cell(x0+a*dir){:}) > maxF + eps*a*(grad(num2cell(x0){:})')*dir )
         a=a^2;
     endwhile
    m= min(m+1,M);
    display(m)
    x0=x0+a*dir;
    loss=[loss,fun(num2cell(x0){:})];
    k++;
  endwhile
  res = x0 
  k=k
  loss = loss
endfunction