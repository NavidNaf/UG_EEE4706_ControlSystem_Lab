K=5;
K1=10;
K2=1;
G1=tf([10 400],1);
G2=tf(2,[1 5 0]);
G3=tf(20,[1 0]);
G4=tf(1,[1 1]);
G5=tf([1 0],1);
G6=tf(1,[1 0]);
H1=tf(3,[1 2 5]);

Gs1=feedback((G1*G2),H1,-1);
Gs2=G3*(G4+G5);
Gs3=feedback(Gs2,K1,-1);
Gs4=feedback((Gs3*G6),K2,-1);
Gs5=K*Gs1*Gs4;

sys=feedback(Gs5,1,-1);
step(sys)