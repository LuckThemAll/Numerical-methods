syms f(x) d1f(x)
 
f(x) = 4*x - cos(x);
a = 0.1; 
b = 0.6; 
breaks = 10;
h = (b-a)/breaks;
n = breaks + 1;
 
d1f = diff(f);
 
 
x_vals = zeros(1, breaks + 1);
f_vals = zeros(1, breaks + 1);
 
j=1;
for i=a:h:b
    x_vals(1,j) = i;
    f_vals(1,j) = f(i);
    j = j +1;
end
 
m_matrix = zeros(breaks + 1, breaks +1);
g_column = zeros(breaks + 1, 1);
 
m_matrix(1,1) = 1;
g_column(1,1) = d1f(a);
 
m_matrix(n,n) = 1;
g_column(n,1) = d1f(b);
 
for i=2:n-1
    mu = 1/2;
    lambda = 1/2;
    g = 3*(lambda * (f_vals(1, i+1) - f_vals(1, i))/h + mu*(f_vals(1,i) - f_vals(1, i - 1))/h);
    
    m_matrix(i, i-1) = mu;
    m_matrix(i, i) = 2;
    m_matrix(i, i+1) = lambda;
    
    g_column(i, 1) = g;
end
m = linsolve(m_matrix, g_column);
 
hold on;
xi = a;
i = 1;
h_plot = h/2;
max_eps = 0;
for x=a:h_plot:b-h
    vpa(d1f(x));
    diff_1_spline = vpa(m(i)+6*(x-xi)/h*((f(xi+h)-f(xi))/h -...
        (m(i+1)+2*m(i))/3) + ...
        (6*((x-xi)/h)^2)*(-(f(xi+h)-f(xi))/h + ...
        (m(i+1)+m(i))/2));
    plot(x, diff_1_spline, '*');
    debug = mod(x,h);
    max_eps = max(max_eps, abs(diff_1_spline - d1f(x)));
    if (debug == 0)
        xi = xi + h;
        i = i + 1;
    end
end
disp('min exp: ');
disp(vpa(max_eps));
plot(x, diff_1_spline, '*');
fplot(d1f, [a, b]);
hold off;
