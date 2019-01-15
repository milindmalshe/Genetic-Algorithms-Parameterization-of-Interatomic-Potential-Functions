%########## THIS CODE IS EXACTLY SAME AS FILE GA_tersoff.m EXCEPT FOR CALLING GA_tersoff_objfun_RandomlySelectNconfig.m WHICH RANDOMLY SELECTS SOME CONFIGS 
clc();
clear();
Nind=25;
MAXGEN=10000;
NVAR=11;
PRECI=50;
GGAP=0.619;

% % %Trial 1
% lowerBound = [ 1e2, 1e2,1e0, 1e0, 0.00, 0.0, 1e-8,1e-3, 0,        0,  -1.0];
% upperBound = [ 1e6, 1e6,1e1, 1e1, 0.00, 0.0, 1e-5, 1.e1, 1e6, 1.00e3,  1.0];

% % %Trial 2
% lowerBound = [ 1e1, 1e1,1e0, 1e0, 0.00, 0.0, 1e-7,1e-3, 1e4,       1e1,  -1.0];
% upperBound = [ 1e5, 13,1e1, 1e1, 0.00, 0.0, 1e1, 1.e1, 9e5, 1.00e3,  0];

% [44864.4959,12.134,9.3647,1.3356,0,0,1.501,6.1264,867437.6105,888.2306,-0.1952;]

% % %Trial 3
lowerBound = [ 1e3, 1e1,1e0, 1e0, 0.00, 0.0, 1e-7,1e-3, 1e4,    1e1,  -1.0];
upperBound = [ 9e5, 9e5,1e1, 1e1, 0.00, 0.0, 1e1, 1.e1, 9e5, 1.00e3,  0];







FieldD = [rep([PRECI],[1,NVAR]); lowerBound; upperBound; rep([1;0;1;1],[1,NVAR])];

% FieldD = [rep([PRECI],[1,NVAR]); rep([-512;512],[1,NVAR]); rep([1;0;1;1],[1,NVAR])];
Chrom = crtbp(Nind,NVAR*PRECI);
gen=0;
%%%ABOVE is GA Initialization


clust = 3;%GA
dat= xlsread('O3_UMP4_grid_traindata_trunc.xls');%GA
%dat= xlsread('Co2_MP4SDQ_ConfigEnergy_sorted.xls');
%dat= xlsread('test_C_C.xls');%GA
temp=size(dat);%GA
totalConfig=temp(1);%GA

target = dat(:,4);
sumSQerr = zeros(MAXGEN,Nind);
[ObjV,sumSQerr] = GA_tersoff_objfun_RandomlySelectNconfig_NoGLOBALvariable(bs2rv(Chrom,FieldD),target,Nind,totalConfig,dat,MAXGEN,1,sumSQerr);
gen=1;
while gen < MAXGEN
    FitnV = ranking(ObjV);
    SelCh = select('sus',Chrom,FitnV,GGAP);
%     SelCh = recombin('xovdp',SelCh,exp(-gen/MAXGEN));
    
    SelCh = recombin('xovsp',SelCh,0.9);
    SelCh=mut(SelCh,0.8);
    
%     [ObjVSel,sumSQerr] = GA_tersoff_objfun_RandomlySelectNconfig_NoGLOBALvariable(bs2rv(SelCh,FieldD),target,Nind,totalConfig,dat,MAXGEN,gen,sumSQerr);
    
    options = optimset('Display','iter','MaxIter',10000,'MaxFunEvals',1000000,'TolFun',1e-10,'TolX',1e-10);
    
    [coeff,fval,exitflag] = fminsearch(@(coeff) GA_tersoff_objfun_RandomlySelectNconfig_NoGLOBALvariable(bs2rv(SelCh,FieldD),target,Nind,totalConfig,dat,MAXGEN,gen,sumSQerr),[1,1,1,1,1,1],options)
    
    
    [Chrom ObjV] = reins(Chrom,SelCh,1,1,ObjV,ObjVSel);
    
    gen = gen+1
    min(ObjV)
end

phen=bs2rv(Chrom,FieldD);


