syms f(x) f_2(x) f_3(x) w(x, x_i, x_i_1) w_3(x, x_i, x_i_1, x_i_2)

f(x) = 4*x-cos(x);
f_2(x) = cos(x);
f_3(x) = -sin(x);
w(x, x_i, x_i_1) = (x-x_i)*(x-x_i_1);
w_3(x, x_i, x_i_1, x_i_2) = (x-x_i)*(x-x_i_1)*(x-x_i_2);

a = 0.1;
b = 0.6;
x_med = (a+b)/2;
x_1 = 0.37;

x_i = [];
j = 1;
for i=0.1:0.05:0.6
    x_i(j) = i;
    j = j + 1;
end

x_vals = [];
j = 1;
for i=a:(b-a)/10:b
    x_vals(j) = f(i);
    j = j + 1;
end

l_1 = [];
for i=1:1:10
    s_1 = x_vals(i)*(x_1-x_i(i+1))/(x_i(i)-x_i(i+1));
    s_2 = x_vals(i+1)*(x_1-x_i(i))/(x_i(i+1)-x_i(i));
    l_1(i) =  s_1+s_2;    
end

r = [];
f_2_val = [];
for i=1:1:10
    f_2_val(i) = f_2( (x_i(i)+x_i(i+1))/2 );
    r(i) = f_2_val(i) * w(x_med, x_i(i), x_i(i+1))/2;
end

f_2_max = max(f_2_val);
f_2_min = min(f_2_val);
r_min = min(r);
r_max = max(r);
r_1 = l_1(6) - f(x_1);
vpa(r_1)
if (r_1>r_min) && (r_1<r_max)
    disp("условие minR1<R1(x*)<maxR1 выполнилось");
    disp(vpa(r_1));
else
    disp("условие minR1<R1(x*)<maxR1 не выполнилось")
end

l_2 = [];

for i=2:1:10
   s_1 = ( ((x_1-x_i(i))*(x_1-x_i(i+1)))/( ((x_i(i-1)-x_i(i))*(x_i(i-1)-x_i(i+1)) ) )); 
   s_2 = ( ((x_1-x_i(i-1))*(x_1-x_i(i+1)))/( ((x_i(i)-x_i(i-1))*(x_i(i)-x_i(i+1)) ) )); 
   s_3 = ( ((x_1-x_i(i-1))*(x_1-x_i(i)))/( ((x_i(i+1)-x_i(i-1))*(x_i(i+1)-x_i(i)) ) )); 
   l_2(i-1) =  x_vals(i-1)*s_1 + x_vals(i)*s_2 + x_vals(i+1)*s_3;
end
for i=2:1:10
    r_2(i-1) = f_3 ( (x_i(i-1)+x_i(i+1))/2)*w_3(x_med, x_i(i-1), x_i(i), x_i(i+1))/6;
end
min_r2 = vpa(min(r_2));
max_r2 = vpa(max(r_2));

r_2 = vpa(l_2(5)-f(x_1));
vpa(r_2);

if (r_2>min_r2) && (r_2<max_r2)
    disp("условие minR2<R2(x*)<maxR2 выполнилось");
    disp(r_2);
else
    disp("условие minR2<R2(x*)<maxR2 не выполнилось")
end