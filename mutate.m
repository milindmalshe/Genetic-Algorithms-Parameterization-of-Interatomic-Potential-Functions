function NewChrom = mutate(MUT_F, OldChrom, FieldDR, MutOpt, SUBPOP);

% Check parameter consistency
   if nargin < 2,  error('Not enough input parameter'); end

   % Identify the population size (Nind) and the number of variables (Nvar)
   [Nind,Nvar] = size(OldChrom);

   if nargin < 3, IsDiscret = 1; FieldDR = [];
   elseif isempty(FieldDR), IsDiscret = 1; FieldDR = [];
   elseif isnan(FieldDR), IsDiscret = 1; FieldDR = [];
   else 
      [mF, nF] = size(FieldDR);
      if nF ~= Nvar, error('FieldDR and OldChrom disagree'); end
      if mF == 2, IsDiscret = 0;
      elseif mF == 1, IsDiscret = 1;
      else error('FieldDR must be a matrix with 1 or 2 rows'); end
   end

   if nargin < 4, MutOpt = NaN; end

   if nargin < 5, SUBPOP = 1;
   elseif nargin > 4,
      if isempty(SUBPOP), SUBPOP = 1;
      elseif isnan(SUBPOP), SUBPOP = 1;
      elseif length(SUBPOP) ~= 1, error('SUBPOP must be a scalar'); end
   end

   if (Nind/SUBPOP) ~= fix(Nind/SUBPOP), error('OldChrom and SUBPOP disagree'); end
   Nind = Nind/SUBPOP;  % Compute number of individuals per subpopulation

% Select individuals of one subpopulation and call low level function
   NewChrom = [];
   for irun = 1:SUBPOP,
      ChromSub = OldChrom((irun-1)*Nind+1:irun*Nind,:);  
      if IsDiscret == 1, NewChromSub = feval(MUT_F, ChromSub, MutOpt, FieldDR);
      elseif IsDiscret == 0, NewChromSub = feval(MUT_F, ChromSub, FieldDR, MutOpt); end
      NewChrom=[NewChrom; NewChromSub];
   end


% End of function

