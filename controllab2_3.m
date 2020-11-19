G1=tf(1,[1 1]);
G2=tf(1,[1 2]);
G3=tf(1,[1 3]);
G4=tf(1,[1 4]);
KL=5;

%considering Tc
Gs1=G1*G2*G3;
sys1=feedback(Gs1,1,-1);

%considering L
Gs2=(G4*G2)+KL;
Gs3=G3*Gs2;
Gs4=G3*(-1)*G1*G2;
sys2=feedback(Gs3,Gs4,+1);

sys=sys1+sys2;
step(sys)