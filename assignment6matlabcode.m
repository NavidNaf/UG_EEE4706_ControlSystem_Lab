clear all
close all
clc

h1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
g4=tf([10],[1 1]);
g3=tf([20],[1 1]);
h2=tf(5,[1 0]);
k1=2;

t1=feedback(g3*g2,h2,-1);
t2=series(k1*t1,g4);
SYS1=feedback(t2,h1,-1);

t3=series(-k1*h1,g4);
t4=parallel(t3,-h2);
t5=series(t4,g2);
t6=feedback(g3,t5,1);
SYS2=series(t3,t4);

t7=feedback(g2*g3,h2,-1);
t8=series(k1*h1,t7);
SYS3=feedback(g4,t8,1);

sys=SYS1+SYS2+SYS3
step(sys)