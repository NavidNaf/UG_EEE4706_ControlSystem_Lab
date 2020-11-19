clear all
close all
clc
%Analytical solution
m=68.1;
c=12.5;
g=9.8;
ta=0:1:11;
va=(m*g/c)*(1-exp(-c/m*ta));
hold on
plot(ta,va)

%Numerical solution
v=0;
v=zeros(1,12);
for t=2:1:12
v(t)=(g-(c/m)*v(t-1))*1+v(t-1);
v(t)=v(t);
end
t=0:11;
plot(t,v,'r--')
title('Analytical vs numerical solution')
legend('numerical','analytical')
