function [res loss]=bfgs(f,x0,M=10,tlr=0.002)
  k=1;
  fgradient=gradient(f);
  fhess=hessian(f);
  hes=function_handle(fhess);
  grd=function_handle(fgradient);
  fun=function_handle(f);
  loss =fun(num2cell(x0){:});
  eps =1/4;
  m=0;
  x0 = x0';
  g=grd(num2cell(x0){:});
  B=eye(length(x0));
  a=1;
   while( k <= 500 && norm(g)>tlr )
    a=0.97;
    direction = -B*g;
    maxF = max(loss(k-m:k));
     while( fun(num2cell(x0+a*direction){:}) > maxF + eps*a*(grd(num2cell(x0){:})')*direction)
         a=a^2;
     endwhile
     display(a);
    m= min(m+1,M);
    s=a*direction; 
        x0=x0+s
        g1=grd(num2cell(x0){:});
        ## determine A
        y=g1-g;
        q=inv((s')*y)
        B=(eye(length(x0))-q*s*y')*B*(eye(length(x0))-q*y*s')+q*s*s';
        k=k+1;
        g=g1; 
        loss=[loss,fun(num2cell(x0){:})];
  endwhile
    res = x0;
    disp(res);