clearvars
close all
clc

m = 1000;
b = 1;
num = 1;
den = [m b];
H = tf(num, den);
[y, time] = step(H);
plot(time,y, 'k', 'LineWidth', 2)
hold on

math_function = @(t) 1/b*(1-exp(-b*t/m));
math_solution = math_function(time);
plot(time, math_solution, 'ro')
legend('Simulation Result','Analytic Result')