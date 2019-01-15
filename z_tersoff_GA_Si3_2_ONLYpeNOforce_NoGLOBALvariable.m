
% function [Vij,DEDmov] = tersoff_GA_Si3(coord,total,numMov,numPeriph,numBound,numSurface,movAtom,periphAtom,boundAtom,surfaceAtom);
% function [Vij,DEDmov] = tersoff_GA_Si3_2(A,B,lmda1,lamda2,lamda3,alpha,beta,eta,c,d,h,dat)%GA
function [Vij] = tersoff_GA_Si3_2_ONLYpeNOforce_NoGLOBALvariable(variables,dat,config)%GA

% global x y z;
% global A  B lamda1 lamda2 lamda3 alpha beta eta c d h R D rCutoff;


% global countStore;% ****THIS MODIFICATION IS MADE WHILE STORING THE CONFIGURATIONS 
% global coordStore;% ****THIS MODIFICATION IS MADE WHILE STORING THE CONFIGURATIONS 
% global countFFT;
% global rijFFT;
% global countSurface;
% global coordSurface;

A=variables(1); B=variables(2); lamda1=variables(3); lamda2=variables(4); lamda3=variables(5); alpha=variables(6); beta=variables(7); eta=variables(8);
c=variables(9); d=variables(10); h=variables(11);

% A=1.8308e3;
% B=4.7118e2;
% lamda1=2.4799;
% lamda2=1.7322;
% lamda3=1.7322;
% alpha=0;
% beta=1.0999e-6;
% eta=7.8734e-1;
% c=1.0039e5;
% d=1.6218e1;
% h=-5.9826e-1;

% A=2846.53791410021;
% B=332.112304577964;
% lamda1=2.98165901883066;
% lamda2=1.42762362654664;
% lamda3=1.34312076622734;
% alpha=0;
% beta=0.00065961668112477;
% eta=0.214823171353063;
% c=133907.435600856;
% d=22.8707825146121;
% h=-0.700632490870871;

% A=3583.193659;
% B=410.2105509;
% lamda1=2.940194934;
% lamda2=1.539244681;
% lamda3=1.539244681;
% alpha=0;
% beta=9.38E-05;
% eta=0.663110379;
% c=106865.0717;
% d=18.55683974;
% h=-0.820575637;



% A=1.8308e3;
% B=4.7116e2;
% lamda1=2.4799;
% lamda2=1.7322;
% lamda3=1.7322;
% alpha=0;
% beta=1.099901e-6;
% eta=7.8734e-1;
% c=1.00391e5;
% d=1.6219e1;
% h=-5.9824e-1;

% A=2093.79801764599;
% B=676.777761593833;
% lamda1=2.73410014276209;
% lamda2=1.89146813149318;
% lamda3=2.38761159247034;
% alpha=0;
% beta=9.39935771935504e-006;
% eta=0.379764473760383;
% c=102125.324574127;
% d=16.5205130687821;
% h=-0.000900398912451326;

% A= 1.77e3;
% B= 4.7e2;
% lamda1= 2.472;
% lamda2= 1.721;
% lamda3= 1.721;
% alpha= 0;
% beta= 9.99e-7;
% eta= 7.2e-1;
% c= 1.11e5;
% d= 1.69e1;
% h= -6.44e-1;

R=2.85;
D=0.15; 




rCutoff=3.0;



clust = 5;%GA

% dat= xlsread('siCartesian_DFT_B3LYP_FORCE_TRY.xls');%GA
temp=size(dat);%GA
total=temp(1);%GA

Vij=0;
% Vij=zeros(1,total);%GA

% xALL=zeros(total,clust);%GA
% yALL=zeros(total,clust);%GA
% zALL=zeros(total,clust);%GA

% xALL(:,3) = dat(:,3); xALL(:,4) = dat(:,5); xALL(:,5) = dat(:,8);%GA
% yALL(:,4) = dat(:,6); yALL(:,5) = dat(:,9);%GA
% zALL(:,2) = dat(:,2); zALL(:,3) = dat(:,4); zALL(:,4) = dat(:,7); zALL(:,5) = dat(:,10);%GA

% x=coord(:,1);
% y=coord(:,2);
% z=coord(:,3);

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

x= [0 0     dat(3) dat(5) dat(8)];
y= [0 0     0       dat(6) dat(9)];
z= [0 dat(2) dat(4) dat(7) dat(10)];

for i=1:numMov
% 	iMov=movAtom(i);
    iMov = i;%GA
    % 	if(list(iMov,1) ~=1 & list(iMov,1) ~=2 & list(iMov,1) ~=4)
    % 		iMov
    % 	end
    
% 	for j=2:list(iMov,1)+1
% 		jBond=list(iMov,j);
  
    for j=1:list(config,1)+1 
        jBond = j;
		if(jBond == iMov)
			continue;
		end
		rij= sqrt( (x(iMov)-x(jBond)).^2 + (y(iMov)-y(jBond)).^2 + (z(iMov)-z(jBond)).^2 );
		
		
		
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
			rik= sqrt( (x(iMov)-x(k3Body)).^2 + (y(iMov)-y(k3Body)).^2 + (z(iMov)-z(k3Body)).^2 );
			rjk= sqrt( (x(jBond)-x(k3Body)).^2 + (y(jBond)-y(k3Body)).^2 + (z(jBond)-z(k3Body)).^2 );
								
			
			[zetaij] = zeta(k3Body,rij,rik,rjk,zetaij,   A,B,lamda1,lamda2,lamda3,alpha,beta,eta,c,d,h,R,D);		
			
		end
		
		

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
		

