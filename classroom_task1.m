clearvars
close all
clc

m = 1000;
b = 1;
num = [1];
den = [m b 0];
H = tf(num, den)

figure(1)
step(H, 1e20)           % Plots step-response upto 10^20 seconds
