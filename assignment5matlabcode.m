clear all
close all
clc


g1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
g4=tf([10],[1 1]);
gc=tf([20],[1 1]);
h=tf(5,[1 0]);


t1=feedback(g4,g2,-1);
t2=series(g1,gc);
t3=series(t1,t2);
SYS1=feedback(t3,h,-1);

t4=series(-gc,g1);
t5=series(t4,h);
t6=parallel(t5,-g4);
t7=series(t6,g2);
SYS2=feedback(1,t7,1);
sys=SYS1+SYS2
step(sys)