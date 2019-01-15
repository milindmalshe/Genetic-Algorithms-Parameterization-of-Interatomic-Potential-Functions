
function [ObjVal,sumSQerr] = GA_tersoff_objfun_RandomlySelectNconfig_NoGLOBALvariable(phen,target,Nind,totalConfig,dat,MAXGEN,gen,sumSQerr)
%ObjVal = sum((Phen.*Phen)')';

%ObjVal = sum(((Phen-20).*(Phen-20))')';

NConfig=totalConfig;

temp=size(phen);
Nind = temp(1);

ObjVal = zeros(temp(1),1);

% clust = 5;%GA
% dat= xlsread('siCartesian_DFT_B3LYP_FORCE.xls');%GA
% temp=size(dat);%GA
% total=temp(1);%GA
% 
% target = dat(:,16);

potential = zeros(Nind,totalConfig);
% err = zeros(Nind,totalConfig);
% sumSQerr = zeros(MAXGEN,Nind);
%ObjVal = zeros(Nind);

for j=1:NConfig
%     NConfigArray(j) = ceil(rand*totalConfig);
    NConfigArray(j) = j;
end



for i=1:temp(1)
    for j=1:NConfig
  
%         phen(i,:) = [1793.38633704315          467.444273848928          2.46532103517024          1.75401713726893          1.76066223552907     0 1.52395846622563e-006         0.765028829792856          100758.345573227          17.3215061957263        -0.587494263658031];

%FOLLOWING CODE is to get a plot of sum squared error as a function of change in one parameter keeping other parameters fixed
%         phen(1,:) = [1.8308e3 4.7118e2 2.4799 1.7322 1.7322 0 1.0999e-006 0.05 100390.00 11.0 -0.59826];
%         
%         phen(i,:) = phen(1,:);
%         phen(i,10) = phen(i,10)+ i*1;
        
        potential(i,NConfigArray(j)) = tersoff_multi_component_system(phen(i,:),dat(NConfigArray(j),:),NConfigArray(j));
        err(i,NConfigArray(j)) = (potential(i,NConfigArray(j)) - target(NConfigArray(j))).^2;
        err(i,NConfigArray(j));
%         err = (potential(i,NConfigArray(j)) - target(NConfigArray(j))).^2;
        %potential = tersoff_GA_Si3_2_ONLYpeNOforce(phen(i,:),dat(j,:),j);
        %err(i,j) = (potential - target(j)).^2;
        sumSQerr(gen,i); 
%         sumSQerr(gen,i) = sumSQerr(gen,i) + sum(err);
        sumSQerr(gen,i) = sumSQerr(gen,i) + err(i,NConfigArray(j));
        sumSQerr(gen,i) ;
        ObjVal(i) = sumSQerr(gen,i);
        ObjVal(i);
    j;   
        
%         ObjVal(i) = ObjVal(i) + (Phen(i,j)-j).^2;
        %  sum(((Phen-20).*(Phen-20))')';
    end
    if(rem(i,1)==0),i;,end
end

potential;


% 
% rij(1:NConfig)=dat(1:NConfig,2);
% ab_initio(1:NConfig)=dat(1:NConfig,4);
% sum_sq_err=0.0;
% for j=1:NConfig
%     potential_i(j) = tersoff_multi_components_plot(phen(i,:),dat(NConfigArray(j),:),NConfigArray(j));
%     my_error_2 (j) = (potential_i(j)-ab_initio(j))*(potential_i(j)-ab_initio(j));
%     sum_sq_err     =  sum_sq_err+ my_error_2 (j);
% end
% figure;
% plot(rij,potential_i);
% 
% hold on
% 
% plot(rij,ab_initio);
% 
% % % figure;
% % % plot(dat(1:NConfig,2),potential_i);
% % % 
% % % hold on
% % % 
% % % plot(dat(1:NConfig,2),ab_initio);
% % % % figure;
% % % % plot(rij, my_error_2);
%  sum_sq_err



