syms f(x) D10f(x)
 
f(x) = 4*x-cos(x);
%diff(f, x, 11) = -sin(x)

D11f(x) = -sin(x);
 
finit_difference = zeros(21, 11);
j = 1;
for i=0.1:0.05:0.6
    finit_difference(j) = f(i);
    j = j+2;
end

for col=2:11
    for line=col:2:21-(col-1)
        finit_difference(line, col) = finit_difference(line+1,col-1) - finit_difference(line-1, col-1);
    end
end
disp(finit_difference);
x_2 = 0.12;
%newtone forward
x_2_res = f(x_2);
t = (x_2 - 0.1)/0.05;
 
for i=1:10
    n = i;
    difference = finit_difference(n+1,n+1);
    a = 1;
    
    for j=0:n-1
        a = a * (t-j);
    end
    
    temp = (a * difference) /factorial(n);
    
    x_2_res = x_2_res + temp;
end
 
disp("x with 2 stars: ");
disp(vpa(x_2_res))
disp(vpa(f(x_2)));

x_3 = 0.57;
%2 формула Ньютона
 
x_3_res = f(0.6);
t = (x_3-0.6)/0.05;
 
for i=1:10
    n = i;
    difference = finit_difference(21 - n,n+1);
    a=1;
    
    for j=0:n-1
        a = a * (t+j);
    end
    temp = a * difference /factorial(n);
    
    x_3_res = x_3_res + temp;
end
 
disp("x with 3 stars: ");
disp(vpa(x_3_res));
disp(vpa(f(x_3)));
x_4 = 0.37;
%Формула Гаусса
 
r = 11;
t = (x_4 - 0.4)/0.05;
x_4_res = f(0.4) + t*finit_difference(r-1, 2);
 
a=t;
pos=1;
neg=1;
for i=2:10
    n=i;
    difference = finit_difference(r-mod(n,2),n+1);
 
    if mod(n,2) == 1
        a = a * (t - neg);
        neg = neg + 1;
    else
        a = a * (t + pos);
        pos = pos + 1;
    end
    temp = (a / factorial(n)) * difference;
    
    x_4_res = x_4_res + temp;
end
 
disp("x with 4 stars: ");
disp(vpa(x_4_res));
disp(vpa(f(x_4)));
syms omega(x);
omega(x) = (x-0.1)*(x-0.15)*(x-0.2)*(x-0.25)*(x-0.30)*(x-0.35)*(x-0.4)*(x-0.45)*(x-0.5)*(x-0.55)*(x-0.6);
 
%оценка производной
syms H(x)
H(x) = -sin(x);
 
%min
[x, fDerMin] = fminbnd(matlabFunction(H), 0.1, 0.6);
display(x);
display(fDerMin);
%max
[x, fDerMax] = fminbnd(matlabFunction(-1*H), 0.1, 0.6);
display(x);
fDerMax = -1 * fDerMax;
display(fDerMax);
 
%оценка остатночного члена
syms R1min(x)
R1min(x) = ((-sin(x))/(factorial(11)))*omega(x);
R1_etalon_min = -3.9e-14;
R1_etalon_max = 3.9e-14;

disp("min_eps - x**:");
vpa(R1_etalon_min - (x_2_res - f(x_2)))

disp("max_eps - x**:");
vpa(R1_etalon_max - (x_2_res - f(x_2)))

disp("min_eps - x***:");
vpa(R1_etalon_min - (x_3_res - f(x_3)))

disp("max_eps - x***:");
vpa(R1_etalon_max - (x_3_res - f(x_3)))

disp("Min_eps - x****:");
vpa(R1_etalon_min - (x_4_res - f(x_4)))

disp("Max_eps - x****:");
vpa(R1_etalon_max - (x_4_res - f(x_4)))
