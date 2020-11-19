%%
n1=[5];d1=[1 1 5];
n2=[2];d2=[1 2];
g1=tf(n1,d1);
g2=tf(n2,d2);%step(g1)step(g2)
h=tf([5,0],[0,1]);
t1=series(g1,g2);
t2=parallel(g1,g2);
t5=feedback(t1,h);%  the feedback block should be second param
%figure ,step(t5) figure ,impulse(t5)
n3=[1];d3=[1 0];
g3=tf(n3,d3);
t3=series(t2,g3);%step(t3)
%%
num=[0 2];den=[1,3];
t=0:.1:6;
r=exp(-t);
lsim(t3,r,t)
%%
t7=zpk([-3,-5],[7,-1,-10,13],5);
%impulse(t7)
g1=zpk([],[0],1);g2=g1;g3=g1;
h1=zpk([],[-1],1);h2=h1;h3=h1;
system=append(g1,g2,g3,h1,h2,h3);
ip=1;op=3;
cm=[1,-4,0,0,0;
    2,1,-5,0,0;
    3,1,2,-5,-6;
    4,2,0,0,0;
    5,2,0,0,0;
    6,3,0,0,0];

final=connect(system,cm,ip,op);
final=minreal(final);
tf(final)
%%
g1=tf([1,0],1);
g2=g1;
g5=g1;
g3=tf(1,[1,0]);
g4=g3;
ip=[1 4];op=3;
system=append(g1,g2,g3,g4,g5);
cm=[1,-2,-4,-5;
    2,1,0,0;
    3,4,2,0;
    4,-2,-4,-5;
    5,3,0,0];
final=connect(system,cm,ip,op);
final=minreal(final);
tf(final)

    

















