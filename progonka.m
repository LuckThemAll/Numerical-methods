matrix =    [2, -1,  0,  0, 0
             -3, 8, -1,  0, 0
             0, -5, 12,  2, 0
             0,  0, -6, 18, -4 
             0,  0,  0, -5, 10];

f = [-25
    72
    -69
    -156
    20];

n = 4;

for i=1:1:n
    c(i) = matrix(i, i);
    b(i) = matrix(i, i+1);
    a(i+1) = matrix(i+1, i);
end

for i=2:1:n
    lower = a(i)/c(i-1);
    c(i) = c(i) - lower*b(i-1);
    f(i) = f(i) - lower*f(i-1);
end

x(n) = f(n)/c(n);

for i=n-1:-1:1
    x(i)=(f(i)-b(i)*x(i+1))/c(i);
end
x
