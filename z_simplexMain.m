

global numCallSimplex 
global hB
global hS
global pB
global pS
N=3;
ki=zeros(N,1);
ui=zeros(N,1);
tao=zeros(N-1,1);
ki(1)=2.8;
ki(2)=sqrt(0.45);
ki(3)=sqrt(0.25);
ui(1)=1.1;
ui(2)=sqrt(0.33);
ui(3)=sqrt(0.16);
for i=1:N-1
    tao(i)=10^(1-i);
end


%Creat ideal experimental data,
%xi are the parameters after fitting into
%polynomial series
xi=GetH(ki,ui,tao,N);

v1=0.0198;
v2=0.019802;
dt=0.1;
expB=xi(:,1);
expS=xi(:,2);
tt=zeros(1000,1);
hhB=zeros(1000,1);
hhS=zeros(1000,1);
for i=1:1000
    tt(i)=dt*(i-1);
end
figure(1)
plot(tt,kmiu(tt,ki,tao,N),'-r',tt,kmiu(tt,ui,tao,N),'-b');
hold all
figure(2)
plot(hB,pB,'ob',hS,pS,'or');
hold all
%hhB and hhS are the created displacement for
%Berkovich and spherical indenters, respectively
for i=1:size(expB,1);
    hhB=hhB+expB(i)*(v1.*tt).^(i-1);
    hhS=hhS+expS(i)*(v2.*tt).^(i-1);
end
hhB(1)=0;
hhS(1)=0;

kk=zeros(6,1);
uu=zeros(6,1);
numCallSimplex = 0;
Nind =1;


options = optimset('Display','iter','MaxIter',10000,'MaxFunEvals',1000000,'TolFun',1e-10,'TolX',1e-10);

% [coeff,fval,exitflag] = fminsearch(@(coeff) Objective(hhB,hhS,coeff,tao,N,Nind),[1,1,1,1,1,1],optimset('MaxIter',10000,'MaxFunEvals',10000,'TolFun',1e-6))
[coeff,fval,exitflag] = fminsearch(@(coeff) Objective(hhB,hhS,coeff,tao,N,Nind),[1,1,1,1,1,1],options)

coeff=coeff';
kk=coeff(1:3,1);
uu=coeff(4:6,1);
figure(1);
kSim=kmiu(tt,kk,tao,N);
uSim=kmiu(tt,uu,tao,N);
plot(tt,kSim,'-r',tt,uSim,'-b');
hold all
xi=GetH(kk,uu,tao,N);
figure(2)
plot(hB,pB,'-r',hS,pS,'-b');
hold all
numCallSimplex