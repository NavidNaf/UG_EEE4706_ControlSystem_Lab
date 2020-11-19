G1=tf(1,[1 1]);
G2=tf(1,[1 2]);
G4=tf(1,[1 4]);
Gc=tf(1,[1 5]);
H=tf(1,[1 0]);

%considering X(s)
Gs1=feedback(G2,G4,-1);
Gs2=Gc*G1*Gs1;
sys1=feedback(Gs2,H,-1);

%considering Y(s)
Gs5=-G4*G2;
Gs6=feedback(1,Gs5,+1);
Gs7=-H*Gc*G1*G2;
Gs8=feedback(1,Gs7,+1);
sys2=Gs6+Gs8-1;

sys=sys1+sys2;
step(sys)