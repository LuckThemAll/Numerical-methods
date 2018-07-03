syms f(x) psi(x) phi(x) g(x) d(x)
f(x) = log(x)-7/(2*x+6);

%psi(x) = log(x);
%phi(x) = 7/(2*x+6);
a = 0.1;
b = 10;
 
 
%fplot(f, [a b]);
%hold on
%fplot(psi, [a b]);
%fplot(phi, [a b]);
%legend('2*sqrt(x)','cos(pi*x/2)')
%hold off
%grid
 
s_a = 0.001;
s_b = 1;
 
vpa(f(s_a))
g = diff(f, x, 2);
 
vpa(g(s_a))
 
eps = 0.01;
 
x_kas_prev  = s_a;
x_hord_prev = s_b;
 
d = diff(f, x);
 
while abs(vpa(x_kas_prev - x_hord_prev)) > eps
   x_hord_curr = x_hord_prev - (f(x_hord_prev)*(x_kas_prev-x_hord_prev))/(f(x_kas_prev)-f(x_hord_prev));
   x_kas_curr  = x_kas_prev - (f(x_kas_prev) / d(x_kas_prev)); 
   
   x_hord_prev = x_hord_curr;
   x_kas_prev = x_kas_curr;
   
   vpa(x_hord_prev)
   vpa(x_kas_prev)
   abs(vpa(x_kas_prev - x_hord_prev))
end
 
vpa(x_kas_prev)
