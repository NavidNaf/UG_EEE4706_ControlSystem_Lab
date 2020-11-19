clear all
close all
clc

g1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
kc=12;
g3=tf([20],[1 1]);
h=tf(5,[1 0]);
t1=parallel(g1,g2);
t2=series(t1,kc);
t3=series(t2,g3);
SYS=feedback(t2,h,-1)
step(SYS)