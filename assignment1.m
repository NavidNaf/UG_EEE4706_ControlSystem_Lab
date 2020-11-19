clear all
close all
clc

num = 1;            % Numerator 
den = [1 10 1];     % Denominator
H = tf(num,den)
step(H)