clc
clear all
close all



g1=tf(1,1);
g2=tf([1 0],1);
g3=g2;
g4=tf([1],[1 1]);
g5=tf([2 0],1);
g6=tf(4,1);
ip=1;
op=4;
system=append(g1,g2,g3,g4,g5,g6);
connection_matrix=[1 0 0 0 0;2 1 -4 0 0;3 2 -5 -3 0;4 3 5 -6 -4;5 1 0 0 0;6 4 0 0 0];
final= connect(system,connection_matrix,ip,op)
final= minreal(final)
transfer=tf(final)
    