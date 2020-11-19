clear all
close all
clc

g1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
g4=tf([10],[2 1]);
g3=tf([20],[1 1]);
h=tf(5,[1 0]);
kl=2;

t1=series(g1,g2);
t2=series(t1,g3);
SYS1=feedback(t2,1,-1);

t3=feedback(g3,-1*g1*g2,1);
t4=parallel(kl,g4*g2);
SYS2=series(t3,t4);
sys=SYS1+SYS2
step(sys)