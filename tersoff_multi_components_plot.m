
%Milind Malshe's code for Multicomponent system

function [Vij] = tersoff_multi_components_plot(variables,dat,config)%GA
R=1.815;
D=0.335;
% variables(1)=[4615.9501;];
variables(2)=905.0261;%[748.8164;];%[1203.3071;];
% variables(3)=[5.7438;];
% variables(4)=[4.0398;];
% variables(7)=[3.6908;];
% variables(8)=[53.9473;];
% variables(9)=[99189.7805;];
% variables(10)=[51.5055;];
% variables(11)=[-0.0234;];

% variables(5)=0.0;
% variables(6)=0.0;

% %from ref
% variables(7)=1.1632e-7;
variables(7)=1.3956e-007;%[15.6261;];%[2.2894;];%[1.6832;];%[1.636;];%[1.6105;];%[2.5772;];%[2.5468;];%[2.1396;];%[1.8774;];%[2.3073;];
% %from ref
% variables(8)=1.04968;
variables(8)=9.2887;%[27.9418;];%[3.2402;];%[1.2788;];%[1.279;];%[1.188;];%[2.2105;];%[86.9149;];%[1.2638;];%[1.1129;];%[1.901;];%[165.7662;];
% %from ref
% variables(9)=6.46921e4;
variables(9)=[27020.5961;];%[22302.0801;];%[8132.7947;];%[33515.4994;];%[338961.0628;];%[96832.3463;];%[51460.2328;];%[25904.0196;];%[66064.7341;];%[38994.7491;];%[20392.5701;];%[41751.2619;];
% %from ref
% variables(10)=4.11127;
variables(10)=[266.9815;];%[763.6177;];%[599.6724;];%[966.2;];%[993.9476;];%[722.8071;];%[733.7412;];%[650.7634;];%[674.8377;];%[857.9496;];%[689.0046;];%[202.7552;];
% %from ref
% variables(11)=-.845922;
variables(11)=[-0.3702;];%[-0.5019;];%[-0.3452;];%[-0.6996;];%[-0.001;];%[-0.1436;];%[-0.8216;];%[-0.8697;];%[-0.1659;];%[-0.2361;];%[-0.1066;];%[-0.0946;];
% variables(12)=[4.8211;];%[2.305;];%[5.9999;];%[5.9999;];%[1.7819;];
% variables(13)=[86.8794;];%[40.626;];%[12.7827;];%[67.6839;];
% variables(14)=[81269.8973;];%[65200.8387;];%[90342.1952;];%[5295.137;];
% variables(15)=[195.1904;];%[320.4956;];%[815.5522;];%[814.751;];
% variables(16)=[-1;];%[0.098791093337264;];%[-1;];%[-0.564157177207233;];
% variables(17)=[4359.86;];%[9724.9417;];%[3184.8477;];
% variables(18)=[493.97;][560.2379;];%[930.5002;];
% variables(19)=[4.3485;];%[3.3973;];
% variables(20)=[8.4533;];%[3.5931;];

% %%C-C-C
% param(1,1,1,1)=1544.8;% type_1, type_2, type_3, A
% param(1,1,1,2)=389.63;% type_1, type_2, type_3, B
% param(1,1,1,3)=3.4653;% type_1, type_2, type_3, lamda1
% param(1,1,1,4)=2.3064;% type_1, type_2, type_3, lamda2
% param(1,1,1,5)=0.0;% type_1, type_2, type_3, lamda3
% param(1,1,1,6)=0.0;% type_1, type_2, type_3, alpha
% param(1,1,1,7)=variables(12);% type_1, type_2, type_3, beta
% param(1,1,1,8)=variables(13);% type_1, type_2, type_3, eta
% param(1,1,1,9)=variables(14);% type_1, type_2, type_3, c
% param(1,1,1,10)=variables(15);% type_1, type_2, type_3, d
% param(1,1,1,11)=variables(16);% type_1, type_2, type_3, h
% param(1,1,1,12)=1.95;% type_1, type_2, type_3, R
% param(1,1,1,13)=0.15;% type_1, type_2, type_3, D
% %%C-C-O
% param(1,1,2,1)=1544.8;% type_1, type_2, type_3, A
% param(1,1,2,2)=389.63;% type_1, type_2, type_3, B
% param(1,1,2,3)=3.4653;% type_1, type_2, type_3, lamda1
% param(1,1,2,4)=2.3064;% type_1, type_2, type_3, lamda2
% param(1,1,2,5)=0.0;% type_1, type_2, type_3, lamda3
% param(1,1,2,6)=0.0;% type_1, type_2, type_3, alpha
% param(1,1,2,7)=variables(12);% type_1, type_2, type_3, beta
% param(1,1,2,8)=variables(13);% type_1, type_2, type_3, eta
% param(1,1,2,9)=variables(14);% type_1, type_2, type_3, c
% param(1,1,2,10)=variables(15);% type_1, type_2, type_3, d
% param(1,1,2,11)=variables(16);% type_1, type_2, type_3, h
% param(1,1,2,12)=R;% type_1, type_2, type_3, R---------------------->
% param(1,1,2,13)=D;% type_1, type_2, type_3, D---------------------->
% %%C-O-C
% param(1,2,1,1)=variables(1);% type_1, type_2, type_3, A
% param(1,2,1,2)=variables(2);% type_1, type_2, type_3, B
% param(1,2,1,3)=variables(3);% type_1, type_2, type_3, lamda1
% param(1,2,1,4)=variables(4);% type_1, type_2, type_3, lamda2
% param(1,2,1,5)=variables(5);% type_1, type_2, type_3, lamda3
% param(1,2,1,6)=variables(6);% type_1, type_2, type_3, alpha
% param(1,2,1,7)=variables(12);%1.5724e-7;% type_1, type_2, type_3, beta
% param(1,2,1,8)=variables(13);%0.72751;% type_1, type_2, type_3, eta
% param(1,2,1,9)=variables(14);%3.8049e4;% type_1, type_2, type_3, c
% param(1,2,1,10)=variables(15);%4.384e0;% type_1, type_2, type_3, d
% param(1,2,1,11)=variables(16);%-0.57058;% type_1, type_2, type_3, h
% param(1,2,1,12)=1.95;% type_1, type_2, type_3, R
% param(1,2,1,13)=0.15;% type_1, type_2, type_3, D
% %%C-O-O
% param(1,2,2,1)=variables(1);% type_1, type_2, type_3, A
% param(1,2,2,2)=variables(2);% type_1, type_2, type_3, B
% param(1,2,2,3)=variables(3);% type_1, type_2, type_3, lamda1
% param(1,2,2,4)=variables(4);% type_1, type_2, type_3, lamda2
% param(1,2,2,5)=variables(5);% type_1, type_2, type_3, lamda3
% param(1,2,2,6)=variables(6);% type_1, type_2, type_3, alpha
% param(1,2,2,7)=variables(12);%1.5724e-7;% type_1, type_2, type_3, beta
% param(1,2,2,8)=variables(13);%0.72751;% type_1, type_2, type_3, eta
% param(1,2,2,9)=variables(14);%3.8049e4;% type_1, type_2, type_3, c
% param(1,2,2,10)=variables(15);%4.384e0;% type_1, type_2, type_3, d
% param(1,2,2,11)=variables(16);%-0.57058;% type_1, type_2, type_3, h
% param(1,2,2,12)=R;% type_1, type_2, type_3, R----------------->
% param(1,2,2,13)=D;% type_1, type_2, type_3, D------------------>
%%O-O-O
param(2,2,2,1)=variables(1);% type_1, type_2, type_3, A
param(2,2,2,2)=variables(2);% type_1, type_2, type_3, B
param(2,2,2,3)=variables(3);% type_1, type_2, type_3, lamda1
param(2,2,2,4)=variables(4);% type_1, type_2, type_3, lamda2
param(2,2,2,5)=0.0;% type_1, type_2, type_3, lamda3
param(2,2,2,6)=0.0;% type_1, type_2, type_3, alpha
param(2,2,2,7)=variables(7);% type_1, type_2, type_3, beta
param(2,2,2,8)=variables(8);% type_1, type_2, type_3, eta
param(2,2,2,9)=variables(9);% type_1, type_2, type_3, c
param(2,2,2,10)=variables(10);% type_1, type_2, type_3, d
param(2,2,2,11)=variables(11);% type_1, type_2, type_3, h
param(2,2,2,12)=R;% type_1, type_2, type_3, R
param(2,2,2,13)=D;% type_1, type_2, type_3, D
%%O-O-C
% param(2,2,1,1)=4.35986e3;% type_1, type_2, type_3, A
% param(2,2,1,2)=4.9397e2;% type_1, type_2, type_3, B
% param(2,2,1,3)=5.32;% type_1, type_2, type_3, lamda1
% param(2,2,1,4)=3.07;% type_1, type_2, type_3, lamda2
% param(2,2,1,5)=0.0;% type_1, type_2, type_3, lamda3
% param(2,2,1,6)=0.0;% type_1, type_2, type_3, alpha
% param(2,2,1,7)=variables(7);% type_1, type_2, type_3, beta
% param(2,2,1,8)=variables(8);% type_1, type_2, type_3, eta
% param(2,2,1,9)=variables(9);% type_1, type_2, type_3, c
% param(2,2,1,10)=variables(10);% type_1, type_2, type_3, d
% param(2,2,1,11)=variables(11);% type_1, type_2, type_3, h
% param(2,2,1,12)=R;% type_1, type_2, type_3, R------------------------>
% param(2,2,1,13)=D;% type_1, type_2, type_3, D------------------------>
% %%O-C-O
% param(2,1,2,1)=variables(1);% type_1, type_2, type_3, A
% param(2,1,2,2)=variables(2);% type_1, type_2, type_3, B
% param(2,1,2,3)=variables(3);% type_1, type_2, type_3, lamda1
% param(2,1,2,4)=variables(4);% type_1, type_2, type_3, lamda2
% param(2,1,2,5)=variables(5);% type_1, type_2, type_3, lamda3
% param(2,1,2,6)=variables(6);% type_1, type_2, type_3, alpha
% param(2,1,2,7)=variables(7);% type_1, type_2, type_3, beta
% param(2,1,2,8)=variables(8);% type_1, type_2, type_3, eta
% param(2,1,2,9)=variables(9);% type_1, type_2, type_3, c
% param(2,1,2,10)=variables(10);% type_1, type_2, type_3, d
% param(2,1,2,11)=variables(11);% type_1, type_2, type_3, h
% param(2,1,2,12)=2.0;% type_1, type_2, type_3, R
% param(2,1,2,13)=0.4;% type_1, type_2, type_3, D
% %%O-C-C
% param(2,1,1,1)=variables(1);% type_1, type_2, type_3, A
% param(2,1,1,2)=variables(2);% type_1, type_2, type_3, B
% param(2,1,1,3)=variables(3);% type_1, type_2, type_3, lamda1
% param(2,1,1,4)=variables(4);% type_1, type_2, type_3, lamda2
% param(2,1,1,5)=variables(5);% type_1, type_2, type_3, lamda3
% param(2,1,1,6)=variables(6);% type_1, type_2, type_3, alpha
% param(2,1,1,7)=variables(7);% type_1, type_2, type_3, beta
% param(2,1,1,8)=variables(8);% type_1, type_2, type_3, eta
% param(2,1,1,9)=variables(9);% type_1, type_2, type_3, c
% param(2,1,1,10)=variables(10);% type_1, type_2, type_3, d
% param(2,1,1,11)=variables(11);% type_1, type_2, type_3, h
% param(2,1,1,12)=R;% type_1, type_2, type_3, R------------------------->
% param(2,1,1,13)=D;% type_1, type_2, type_3, D------------------------->

                                                  



%no of atoms present in the calculation
clust = 3;%GA
type=[2,2,2];
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
r(1,2)=dat(1);
r(2,1)=dat(1);

r(2,3)=dat(2);
r(3,2)=dat(2);

r(1,3)=dat(3);
r(3,1)=dat(3);


for i=1:numMov
    
    iMov = i;%GA
     for j=1:numMov%list(config,1)+1 
        
         jBond = j;
		if(jBond == iMov)
			continue;
		end
		%rij= sqrt( (x(iMov)-x(jBond)).^2 + (y(iMov)-y(jBond)).^2 + (z(iMov)-z(jBond)).^2 );
        rij= r(i,j);
		
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
        for k=1:numMov%list(config,1)+1
            k3Body = k;
			if((k3Body == iMov) | (k3Body == jBond))
				continue
			end
% 			rik= sqrt( (x(iMov)-x(k3Body)).^2 + (y(iMov)-y(k3Body)).^2 + (z(iMov)-z(k3Body)).^2 );
            rik= r(i,k);
% 			rjk= sqrt( (x(jBond)-x(k3Body)).^2 + (y(jBond)-y(k3Body)).^2 + (z(jBond)-z(k3Body)).^2 );
            rjk= r(j,k);
            
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
		

