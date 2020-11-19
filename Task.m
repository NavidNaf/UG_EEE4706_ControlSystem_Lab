%% preamble
%P_motor = K/(s*((J*s+b)*(L*s+R)+K^2));

%J = 0.01;  %moment of inertia of the rotor  b = 0.1;   %damping ratio of the mechanical system 
%K = 0.01;  %electromotive force constant; K=Ke=Kt  R = 1;     %electric resistance L = 0.5;   %electric inductance


%%
%Task 1 2 3 have done in the simulation file which showed similar results
plot(tout,simout,'r') % differential equation
hold on
plot(tout,simout1,'b--') % Transfer function 

%%
% task 4 
data = stepinfo(simout1);
overshoot = data.Overshoot
rise_time = data.RiseTime
SSE1 = (1-max(simout1))/100


%plotting root locus
figure
rlocus([0 .01],[.5*.01 1*.01+.1*.5 .01*.01+1*.1]);
axis([-20 20 -6 6])

%%
% task 5 
po=5;
tr=1;
zeta = sqrt(((log(po/100))^2)/(pi^2+(log(po/100)^2)));
wn = 1.8/tr;
sgrid(zeta,wn)

[k poles] = rlocfind([0 .01],[.5*.01 1*.01+.1*.5 .01*.01+1*.1]);

[numcl dencl] = cloop(k*[0 .01],[.5*.01 1*.01+.1*.5 .01*.01+1*.1]);
figure
step(numcl,dencl)


%%
% task 6 
data2 = stepinfo(numcl,dencl);
overshoot2 = data2.Overshoot
rise_time2 = data2.RiseTime
[yy tt] = step(numcl,dencl);
SSE2 = (k - max(yy))/100;

trans_func = tf(k*[0 .01],[.5*.01 1*.01+.1*.5 .01*.01+1*.1]);

%%
% task 7 
% taking Zo = .3 & Po = .03 parameters for lag controller
l = tf([1 .3],[1 .03]);
g1 = l * trans_func;
figure
rlocus(g1)
sgrid(zeta,wn)
[k2 poles2] = rlocfind(g1);
struct = get(g1);
a = struct.Numerator;
num4 = cell2mat(a);
b = struct.Denominator;
den4 = cell2mat(b)

[numcl2 dencl2] = cloop(k2*num4,den4);
figure
step(numcl2,dencl2)

%%
% task 8 
[yyy ttt] = step(numcl2,dencl2);
SSE3 = (k2-max(yyy))/100;
display(SSE1,'The first error with k Absent')

display(k,'The second error with k=')
display(SSE2)
display(k2,'The third error with k=')
display(SSE3)