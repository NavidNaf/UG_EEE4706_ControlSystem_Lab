G1=tf(4,[1 0]);
G2=tf([1 0],[1 1]);
G3=tf(1,[1 1 1]);
Kc=5;
H=tf(1,[1 0]);

Gs1=feedback(G1,G2,-1);
Gs2=Kc*Gs1*G3;

sys=feedback(Gs2,H,-1);
step(sys)