function [x e iter]=newton(f,x0,err)
  df=function_handle(diff(f));
  df2=function_handle(diff(f,2));
  iter = 0;
  do 
   if(df2(x0)==0)
    break;
   else
   direction = - df(x0) / df2(x0);
   x0=x0 + direction;
   e = abs(direction);
   iter++;
   endif
  until(e < err || iter == 100)
 x=x0;
end

