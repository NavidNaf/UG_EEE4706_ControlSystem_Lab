g1=1;
g2=tf([1 0],1);
g3=g2;
g4=tf(1,[1 1]);
g5=tf([2 0],1);
g6=4;

ip=1;
op=4;

system=append(g1,g2,g3,g4,g5,g6);

cm=[1 0 0 0 0;
    2 1 -4 0 0;
    3 2 5 -3 0;
    4 3 5 -6 -4;
    5 1 -4 0 0;
    6 4 0 0 0];s

sys=connect(system,cm,ip,op);
t=tf(sys);
step(t)