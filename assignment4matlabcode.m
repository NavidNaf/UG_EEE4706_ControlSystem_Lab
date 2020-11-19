clear all
close all
clc
g1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
k1=2;
k2=1;
k3=1;
k4=8;

t1=series(k3*g1,g2);
t2=feedback(t1,k2,1);
SYS1=k1*t2;

t3=feedback(g2,k2*g1*k3,1);
SYS2=k4*t3;
sys=SYS1+SYS2
step(sys)