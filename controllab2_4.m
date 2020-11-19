G1=tf(1,[1 1]);
G2=tf(1,[1 2]);
K1=5;
K2=6;
K3=7;
K4=8;

%considering X(s)
Gs1=G1*K3*G2;
Gs2=feedback(Gs1,K2,+1);
sys1=K1*Gs2;

%considering Y(s)
Gs3=K4*G2;
Gs4=G2*K2*G1*K3;
sys2=feedback(Gs3,Gs4,+1);

sys=sys1+sys2;
step(sys)