g1=tf([1],[1 1]);
g2=tf([1],[1 1 8]);
gc=tf([10],[2 1]);
gv=tf([20],[1 1]);
h=tf(5,[1 0]);
t1=series(gc,gv);
t2=parallel(g1,g2);
t3=series(t1,t2);
SYS=feedback(t3,h,-1)
step(SYS)
