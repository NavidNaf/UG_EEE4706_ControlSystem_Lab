G2=tf(1,[1 2]);
G3=tf(1,[1 3]);
G4=tf(1, [1 4]);
H1=tf(1,[1 0]);
H2=tf(1,[2 0]);
K1=5;

%considering Tc
Gs1=feedback(G2*G3,H2,-1);
Gs2=K1*Gs1*G4;
sys1=feedback(Gs2,H1,-1);

%considering L1
Gs3=G4*(-H1)*K1*Gs1;
sys2=feedback(G4,Gs3,+1);

%considering L2
Gs4=G4*(-H1)*K1;
Gs5=parallel(Gs4,(-H2));
Gs6=Gs5*G2;
Gs7=feedback(G3,Gs6,+1);
sys3=Gs7*G4;

sys=sys1+sys2+sys3;
step(sys)