function MatOut = rep(MatIn,REPN)

% Get size of input matrix
   [N_D,N_L] = size(MatIn);

% Calculate
   Ind_D = rem(0:REPN(1)*N_D-1,N_D) + 1;
   Ind_L = rem(0:REPN(2)*N_L-1,N_L) + 1;

% Create output matrix
   MatOut = MatIn(Ind_D,Ind_L);


% End of function
