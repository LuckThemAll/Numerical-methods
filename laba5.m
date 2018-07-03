syms f(x)
 
f(x) = 4*x-cos(x);
a = 0.1; 
b = 0.6; 
L = (b-a)/2;
a_0 = (1/L) * int(f,x, a, b);
 
n = 5;
f_x = a_0/2;
for n=1:n
    a_n = (1/L) * int(f*cos(pi*n*x/L),x,a, b);
    b_n = (1/L) * int(f*sin(n*pi*x/L),x,a, b);
    f_x = f_x + a_n * cos(n*pi*x/L) + b_n * sin(n*pi*x/L);
end
f_x
hold on
fplot(f, [a b]);
fplot(f_x, [a b]);
legend('4*x-cos(x)','Fourier series')
hold off
