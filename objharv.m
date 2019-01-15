
function ObjVal = objharv(Chrom,switch);

% global gen;

% Dimension of objective function
   Dim = 20;

% values from MICHALEWICZ
   a = 1.1;
   x0 = 100;
   xend = x0;
   XENDWEIGHT = 0.4/(Dim^0.6);
   
% Compute population parameters
   [Nind,Nvar] = size(Chrom);

% Check size of Chrom and do the appropriate thing
   % if Chrom is [], then define size of boundary-matrix and values
   if Nind == 0
      % return text of title for graphic output
      if switch == 2
         ObjVal = ['HARVEST PROBLEM-' int2str(Dim)];
      % return value of global minimum
      elseif switch == 3
         ObjVal = -sqrt(x0*(a^Dim-1)^2/(a^(Dim-1)*(a-1)));
      % define size of boundary-matrix and values
      else   
         % lower and upper bound, identical for all n variables        
         ObjVal1 = [0; 10*Dim];
         ObjVal = rep(ObjVal1,[1 Dim]);
      end
   % if Dim variables, compute values of function
   elseif Nvar == Dim
      ObjVal = zeros(Nind,1);
      X = rep(x0,[Nind 1]);
      for irun = 1:Nvar,
         X = a*X - Chrom(:,irun);
      end
      X;
      ObjVal = -(sum(sqrt(Chrom)')' - XENDWEIGHT * abs(X-x0));
   % otherwise error, wrong format of Chrom
   else
      error('size of matrix Chrom is not correct for function evaluation');
   end   


% End of function

