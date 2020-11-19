G1=tf(4,[1 0]);
G2=tf([1 0],[1 1]);
Gv=tf(1, [1 1 1]);
Gc=tf([5 0],[2 5 1]);
H=tf(1,[1 0]);

Gs1=G1+G2;
Gs2=Gv*Gc*Gs1;

sys=feedback(Gs2,H,-1);
step(sys)