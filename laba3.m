syms f(x) Diff1f(x) L(x) Diff1L(x) Diff4f(x) Diff1r(x);
f(x) = 4*x-cos(x);
 
Diff1f(x) = diff(f,x,1);
Diff4f(x) = diff(f,x,5);
  
h = 0.05;
 
L(x) =  f(0.1)*(x-0.15)*(x-0.2)*(x-0.25)* (x-0.3)/(24*h^4)+...
        f(0.15)*(x-0.1)*(x-0.2)*(x-0.25)*(x-0.3)/(-6*h^4) +...
        f(0.2)*(x-0.1)*(x-0.15)*(x-0.25) *(x-0.3)/(4*h^4) +...
        f(0.25)*(x-0.1)*(x-0.15)*(x-0.2) *(x-0.3)/(-6*h^4)+...
        f(0.3)*(x-0.1)*(x-0.15)*(x-0.2)*(x-0.25)/(24*h^4);
 
Diff1L(x) = diff(L, x, 1);
 
a = vpa(Diff1L(0.2))
b = vpa(Diff1f(0.2))
Rnk = vpa(a - b);
disp(Rnk);
 
syms omega(x);
omega(x) = (x-0.1)*(x-0.15)*(x-0.2)*(x-0.25) *(x-0.3);
R1min(x) = Diff4f(0.2)/(factorial(5))*omega(x);
Diff1r(x) = diff(R1min, x, 1);
 
Diff1rmax = 2.5e-05;
Diff1rmin = -2.5e-05;
 
if Diff1rmax > Rnk
    disp("first True")
end
if Rnk > Diff1rmin
    disp("second True")
end
Rnk