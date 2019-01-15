
%Milind Malshe's code for Multicomponent system

function [Vij] = tersoff_multi_components_plot(variables,dat,config)%GA
variables(1)=[1540.0071;];
variables(2)=[959.4134;];
variables(3)=[4.8028;];
variables(4)=[3.1531;];
variables(5)=0.0;
variables(6)=0.0;

%from ref
%variables(7)=1.1632e-7;
variables(7)=[4.7334;];%[0.5394;];%[0.642105555422294;];%[2.370186111006423;];
%from ref
%variables(8)=1.04968;
variables(8)=[57.1971;];%[13.8554;];%[8.17948518004332;];%[59.19833530129349;];
%from ref
%variables(9)=6.46921e4;
variables(9)=[21273.3654;];%[99513.8812;];%[92719.33976065787;];%[41035.74985696795;];
%from ref
%variables(10)=4.11127;
variables(10)=[646.203;];%[269.8073;];%[309.62570946557594;];%[785.5362127059153;];
%from ref
%variables(11)=-.845922;
variables(11)=[-1;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
variables(12)=[6.5897;];%[9.627;];
variables(13)=[15.0518;];%[91.4935;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
variables(14)=[34702.6187;];%[71181.9855;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
variables(15)=[2.5678;];%[571.5753;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
variables(16)=[-1;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
R=2.4;
D=0.2;
%%C-C-C
param(1,1,1,1)=1544.8;% type_1, type_2, type_3, A
param(1,1,1,2)=389.63;% type_1, type_2, type_3, B
param(1,1,1,3)=3.4653;% type_1, type_2, type_3, lamda1
param(1,1,1,4)=2.3064;% type_1, type_2, type_3, lamda2
param(1,1,1,5)=0.0;% type_1, type_2, type_3, lamda3
param(1,1,1,6)=0.0;% type_1, type_2, type_3, alpha
param(1,1,1,7)=variables(12);% type_1, type_2, type_3, beta
param(1,1,1,8)=variables(13);% type_1, type_2, type_3, eta
param(1,1,1,9)=variables(14);% type_1, type_2, type_3, c
param(1,1,1,10)=variables(15);% type_1, type_2, type_3, d
param(1,1,1,11)=variables(16);% type_1, type_2, type_3, h
param(1,1,1,12)=1.95;% type_1, type_2, type_3, R
param(1,1,1,13)=0.15;% type_1, type_2, type_3, D
%%C-C-O
param(1,1,2,1)=1544.8;% type_1, type_2, type_3, A
param(1,1,2,2)=389.63;% type_1, type_2, type_3, B
param(1,1,2,3)=3.4653;% type_1, type_2, type_3, lamda1
param(1,1,2,4)=2.3064;% type_1, type_2, type_3, lamda2
param(1,1,2,5)=0.0;% type_1, type_2, type_3, lamda3
param(1,1,2,6)=0.0;% type_1, type_2, type_3, alpha
param(1,1,2,7)=variables(12);% type_1, type_2, type_3, beta
param(1,1,2,8)=variables(13);% type_1, type_2, type_3, eta
param(1,1,2,9)=variables(14);% type_1, type_2, type_3, c
param(1,1,2,10)=variables(15);% type_1, type_2, type_3, d
param(1,1,2,11)=variables(16);% type_1, type_2, type_3, h
param(1,1,2,12)=R;% type_1, type_2, type_3, R---------------------->
param(1,1,2,13)=D;% type_1, type_2, type_3, D---------------------->
%%C-O-C
param(1,2,1,1)=variables(1);% type_1, type_2, type_3, A
param(1,2,1,2)=variables(2);% type_1, type_2, type_3, B
param(1,2,1,3)=variables(3);% type_1, type_2, type_3, lamda1
param(1,2,1,4)=variables(4);% type_1, type_2, type_3, lamda2
param(1,2,1,5)=variables(5);% type_1, type_2, type_3, lamda3
param(1,2,1,6)=variables(6);% type_1, type_2, type_3, alpha
param(1,2,1,7)=variables(12);%1.5724e-7;% type_1, type_2, type_3, beta
param(1,2,1,8)=variables(13);%0.72751;% type_1, type_2, type_3, eta
param(1,2,1,9)=variables(14);%3.8049e4;% type_1, type_2, type_3, c
param(1,2,1,10)=variables(15);%4.384e0;% type_1, type_2, type_3, d
param(1,2,1,11)=variables(16);%-0.57058;% type_1, type_2, type_3, h
param(1,2,1,12)=1.95;% type_1, type_2, type_3, R
param(1,2,1,13)=0.15;% type_1, type_2, type_3, D
%%C-O-O
param(1,2,2,1)=variables(1);% type_1, type_2, type_3, A
param(1,2,2,2)=variables(2);% type_1, type_2, type_3, B
param(1,2,2,3)=variables(3);% type_1, type_2, type_3, lamda1
param(1,2,2,4)=variables(4);% type_1, type_2, type_3, lamda2
param(1,2,2,5)=variables(5);% type_1, type_2, type_3, lamda3
param(1,2,2,6)=variables(6);% type_1, type_2, type_3, alpha
param(1,2,2,7)=variables(12);%1.5724e-7;% type_1, type_2, type_3, beta
param(1,2,2,8)=variables(13);%0.72751;% type_1, type_2, type_3, eta
param(1,2,2,9)=variables(14);%3.8049e4;% type_1, type_2, type_3, c
param(1,2,2,10)=variables(15);%4.384e0;% type_1, type_2, type_3, d
param(1,2,2,11)=variables(16);%-0.57058;% type_1, type_2, type_3, h
param(1,2,2,12)=R;% type_1, type_2, type_3, R----------------->
param(1,2,2,13)=D;% type_1, type_2, type_3, D------------------>
%%O-O-O
param(2,2,2,1)=4.35986e3;% type_1, type_2, type_3, A
param(2,2,2,2)=4.9397e2;% type_1, type_2, type_3, B
param(2,2,2,3)=5.32;% type_1, type_2, type_3, lamda1
param(2,2,2,4)=3.07;% type_1, type_2, type_3, lamda2
param(2,2,2,5)=0.0;% type_1, type_2, type_3, lamda3
param(2,2,2,6)=0.0;% type_1, type_2, type_3, alpha
param(2,2,2,7)=variables(7);% type_1, type_2, type_3, beta
param(2,2,2,8)=variables(8);% type_1, type_2, type_3, eta
param(2,2,2,9)=variables(9);% type_1, type_2, type_3, c
param(2,2,2,10)=variables(10);% type_1, type_2, type_3, d
param(2,2,2,11)=variables(11);% type_1, type_2, type_3, h
param(2,2,2,12)=2.0;% type_1, type_2, type_3, R
param(2,2,2,13)=0.4;% type_1, type_2, type_3, D
%%O-O-C
param(2,2,1,1)=4.35986e3;% type_1, type_2, type_3, A
param(2,2,1,2)=4.9397e2;% type_1, type_2, type_3, B
param(2,2,1,3)=5.32;% type_1, type_2, type_3, lamda1
param(2,2,1,4)=3.07;% type_1, type_2, type_3, lamda2
param(2,2,1,5)=0.0;% type_1, type_2, type_3, lamda3
param(2,2,1,6)=0.0;% type_1, type_2, type_3, alpha
param(2,2,1,7)=variables(7);% type_1, type_2, type_3, beta
param(2,2,1,8)=variables(8);% type_1, type_2, type_3, eta
param(2,2,1,9)=variables(9);% type_1, type_2, type_3, c
param(2,2,1,10)=variables(10);% type_1, type_2, type_3, d
param(2,2,1,11)=variables(11);% type_1, type_2, type_3, h
param(2,2,1,12)=R;% type_1, type_2, type_3, R------------------------>
param(2,2,1,13)=D;% type_1, type_2, type_3, D------------------------>
%%O-C-O
param(2,1,2,1)=variables(1);% type_1, type_2, type_3, A
param(2,1,2,2)=variables(2);% type_1, type_2, type_3, B
param(2,1,2,3)=variables(3);% type_1, type_2, type_3, lamda1
param(2,1,2,4)=variables(4);% type_1, type_2, type_3, lamda2
param(2,1,2,5)=variables(5);% type_1, type_2, type_3, lamda3
param(2,1,2,6)=variables(6);% type_1, type_2, type_3, alpha
param(2,1,2,7)=variables(7);% type_1, type_2, type_3, beta
param(2,1,2,8)=variables(8);% type_1, type_2, type_3, eta
param(2,1,2,9)=variables(9);% type_1, type_2, type_3, c
param(2,1,2,10)=variables(10);% type_1, type_2, type_3, d
param(2,1,2,11)=variables(11);% type_1, type_2, type_3, h
param(2,1,2,12)=2.0;% type_1, type_2, type_3, R
param(2,1,2,13)=0.4;% type_1, type_2, type_3, D
%%O-C-C
param(2,1,1,1)=variables(1);% type_1, type_2, type_3, A
param(2,1,1,2)=variables(2);% type_1, type_2, type_3, B
param(2,1,1,3)=variables(3);% type_1, type_2, type_3, lamda1
param(2,1,1,4)=variables(4);% type_1, type_2, type_3, lamda2
param(2,1,1,5)=variables(5);% type_1, type_2, type_3, lamda3
param(2,1,1,6)=variables(6);% type_1, type_2, type_3, alpha
param(2,1,1,7)=variables(7);% type_1, type_2, type_3, beta
param(2,1,1,8)=variables(8);% type_1, type_2, type_3, eta
param(2,1,1,9)=variables(9);% type_1, type_2, type_3, c
param(2,1,1,10)=variables(10);% type_1, type_2, type_3, d
param(2,1,1,11)=variables(11);% type_1, type_2, type_3, h
param(2,1,1,12)=R;% type_1, type_2, type_3, R------------------------->
param(2,1,1,13)=D;% type_1, type_2, type_3, D------------------------->

                                                  



%no of atoms present in the calculation
clust = 3;%GA
type=[2,1,2];
temp=size(dat);%GA
total=temp(1);%GA

Vij=0;
list = zeros(total,clust);%GA
list(:,1) = clust-1;%GA
list(:,2) = 2;%GA
list(:,3) = 3;%GA
list(:,4) = 4;%GA
list(:,5) = 5;%GA

    % list=bondList(coord,numMov,total,rCutoff,movAtom); 
% [list,listSurface] = bondList_surface(coord,numMov,numSurface,total,rCutoff,movAtom,surfaceAtom); 
    % countStore = 0; % ****THIS MODIFICATION IS MADE WHILE STORING THE CONFIGURATIONS 

config=1;    
numMov = clust;%GA
% for config = 1:total %GA%WAS WRITTEN FOR GA MAY BE USEFUL IF only Tersoff file IS RUN STANDALONE
%     x= xALL(config,:);  y= yALL(config,:);  z= zALL(config,:);%GA

% x= [0 0];
% y= [0 0];
% z= [0 dat(1)];
%depend on the cluster size

%O1 as i, C as j and O2 as k
r(1,1,2)=dat(1,1);%O1-C, ij
r(1,2,3)=dat(1,2);%C-O2, jk
r(1,1,3)=dat(1,3);%O1-O2, ik

%O1 as i, C as k and O2 as j
r(1,2,1)=dat(1,3);%O1-O2, ij
r(1,3,2)=dat(1,2);%C-O2, jk
r(1,3,1)=dat(1,1);%O1-C, ik


%C as i, O1 as j and O2 as k
r(2,1,2)=dat(1,1);%C-O1, ij
r(2,2,3)=dat(1,3);%O1-O2, jk
r(2,1,3)=dat(1,2);%C-O2, ik

%C as i, O1 as k and O2 as j
r(2,2,1)=dat(1,2);%C-O2, ij
r(2,3,2)=dat(1,3);%O1-O2, jk
r(2,3,1)=dat(1,1);%C-O1, ik

%O2 as i, C as j, and O1 and k
r(3,1,2)=dat(1,2);% O2-C, ij
r(3,2,3)=dat(1,1);% C-O1, jk
r(3,1,3)=dat(1,3);% O2-O1, ik

%O2 as i, C as k, and O1 and i
r(3,2,1)=dat(1,3);% O2-O1, ij
r(3,3,2)=dat(1,1);% C-O1, jk
r(3,3,1)=dat(1,2);% O2-C, ik
%--


for i=1:numMov
    
    iMov = i;%GA
     for j=1:numMov%list(config,1)+1 
        
         jBond = j;
		if(jBond == iMov)
			continue;
		end
		%rij= sqrt( (x(iMov)-x(jBond)).^2 + (y(iMov)-y(jBond)).^2 + (z(iMov)-z(jBond)).^2 );
        rij= r(i,i,j);
		
		%passing params
        A=param(type(i),type(j),type(j),1);
        B=param(type(i),type(j),type(j),2);
        lamda1=param(type(i),type(j),type(j),3);
        lamda2=param(type(i),type(j),type(j),4);
        lamda3=param(type(i),type(j),type(j),5);
        alpha=param(type(i),type(j),type(j),6);
        beta=param(type(i),type(j),type(j),7);
        eta=param(type(i),type(j),type(j),8);
        c=param(type(i),type(j),type(j),9);
        d=param(type(i),type(j),type(j),10);
        h=param(type(i),type(j),type(j),11);
        R=param(type(i),type(j),type(j),12);
        D=param(type(i),type(j),type(j),13);
        
        
        
		
		[fR] = fr(rij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);
		[fA] = fa(rij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);
		% 			[fC,Dfcij] = fc(rij,iMov,jBond);
		
		
		zetaij=0;
		
		% 			Dzetak= zeros(total,3);
		
		%START 3-body parameters calculation
% 		for k=2:list(iMov,1)+1
% 			k3Body=list(iMov,k);
        for k=1:list(config,1)+1
            k3Body = k;
			if((k3Body == iMov) | (k3Body == jBond))
				continue
			end
% 			rik= sqrt( (x(iMov)-x(k3Body)).^2 + (y(iMov)-y(k3Body)).^2 + (z(iMov)-z(k3Body)).^2 );
            rik= r(i,i,k);
% 			rjk= sqrt( (x(jBond)-x(k3Body)).^2 + (y(jBond)-y(k3Body)).^2 + (z(jBond)-z(k3Body)).^2 );
            rjk= r(i,j,k);
            
            %passing params
			A=param(type(i),type(j),type(k),1);
            B=param(type(i),type(j),type(k),2);
            lamda1=param(type(i),type(j),type(k),3);
            lamda2=param(type(i),type(j),type(k),4);
            lamda3=param(type(i),type(j),type(k),5);
            alpha=param(type(i),type(j),type(k),6);
            beta=param(type(i),type(j),type(k),7);
            eta=param(type(i),type(j),type(k),8);
            c=param(type(i),type(j),type(k),9);
            d=param(type(i),type(j),type(k),10);
            h=param(type(i),type(j),type(k),11);
            R=param(type(i),type(j),type(k),12);
            D=param(type(i),type(j),type(k),13);					
			
			[zetaij] = zeta(k3Body,rij,rik,rjk,zetaij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);		
			
		end
		
		%passing params
        A=param(type(i),type(j),type(j),1);
        B=param(type(i),type(j),type(j),2);
        lamda1=param(type(i),type(j),type(j),3);
        lamda2=param(type(i),type(j),type(j),4);
        lamda3=param(type(i),type(j),type(j),5);
        alpha=param(type(i),type(j),type(j),6);
        beta=param(type(i),type(j),type(j),7);
        eta=param(type(i),type(j),type(j),8);
        c=param(type(i),type(j),type(j),9);
        d=param(type(i),type(j),type(j),10);
        h=param(type(i),type(j),type(j),11);
        R=param(type(i),type(j),type(j),12);
        D=param(type(i),type(j),type(j),13);

		[bij] = b(iMov,jBond,zetaij,list,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);		
		
		[fC] = fc(rij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);
		
        Vij = Vij + fC*(fR + bij * fA); 
% 		Vij(config) = Vij(config) + fC*(fR + bij * fA); 	

		

	end   %end for jBond

end   %end for iMov
config;
% end   %end for config

Vij = Vij/2;
% Vij(config) = Vij(config)/2;%WAS WRITTEN FOR GA

%**************************************************************************

function [fR] = fr(r,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)
% global x y z;
% global A  B lamda1 lamda2 lamda3 alpha beta n c d h R D;


fR = A.*exp(-1.*lamda1.*r);


% DrijDxi= (x(iMov)-x(jBond))./r;
% DrijDyi= (y(iMov)-y(jBond))./r;
% DrijDzi= (z(iMov)-z(jBond))./r;


%-------------------------------------------------------

function [fA] = fa(r,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)
% global A  B lamda1 lamda2 lamda3 alpha beta n c d h R D;


fA = -1.*B.*exp(-1.*lamda2.*r);

%-------------------------------------------------------

function [fC] = fc(r,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)
% global A  B lamda1 lamda2 lamda3 alpha beta n c d h R D;


if (r < (R-D))
	fC = 1;
	% end
elseif (r >= (R-D) & r <= (R+D))
	%                     fC(j,k,i)=0.5-0.5.*sin(pi./2.*(r(j,k,i)-R)./D);
	fC = 0.5+0.5.*cos(pi.*(r-(R-D))./(2.*D));
	% end
elseif (r > (R+D))
	fC=0;
end



%--------------------------------------------------------------------------

function [g_ijk] = g(rij,rik,rjk,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)
% global A  B lamda1 lamda2 lamda3 alpha beta n c d h R D;



cosTh = (rij^2 + rik^2 - rjk^2)/(2 * rij * rik);

th=acos(cosTh);
sinTh = sin(th);

g_ijk = 1+ c^2/d^2 - c^2/(d^2+(h-cosTh)^2);



%-------------------------------------------------------------------

function [zetaij] = zeta(k3Body,rij,rik,rjk,zetaij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)

% global A  B lamda1 lamda2 lamda3 alpha beta n c d h R D;



	[fC] = fc(rik,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);
	
	[g_ijk] = g(rij,rik,rjk,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);
	
	zetaij = zetaij + fC*g_ijk;
		
%--------------------------------------------------------------------------

function [bij] = b(iMov,jBond,zetaij,list,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D)

% global A  B lamda1 lamda2 lamda3 alpha beta eta c d h R D;

bij=(1+ (beta^eta * zetaij^eta))^(-1/(2*eta));

if(zetaij == 0)
	zetaij = 1.0e-10; % to avoid infinity if zeta is 0 then in the calculation of derivative of the bij index of beta becomes -ve, therefore it becomes infinity
end
		

