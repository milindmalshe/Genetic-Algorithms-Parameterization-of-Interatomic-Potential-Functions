

function NewChrom = mutbga(OldChrom, FieldDR, MutOpt);

% Check parameter consistency
   if nargin < 2,  error('Not enough input parameter'); end

   % Identify the population size (Nind) and the number of variables (Nvar)
   [Nind,Nvar] = size(OldChrom);

   [mF, nF] = size(FieldDR);
   if mF ~= 2, error('FieldDR must be a matrix with 2 rows'); end
   if Nvar ~= nF, error('FieldDR and OldChrom disagree'); end

   if nargin < 3, MutR = 1/Nvar; MutShrink = 1;
   elseif isempty(MutOpt), MutR = 1/Nvar; MutShrink = 1;
   elseif isnan(MutOpt), MutR = 1/Nvar; MutShrink = 1;
   else   
      if length(MutOpt) == 1, MutR = MutOpt; MutShrink = 1;
      elseif length(MutOpt) == 2, MutR = MutOpt(1); MutShrink = MutOpt(2);
      else, error(' Too many parameter in MutOpt'); end
   end

   if isempty(MutR), MutR = 1/Nvar;
   elseif isnan(MutR), MutR = 1/Nvar;
   elseif length(MutR) ~= 1, error('Parameter for mutation rate must be a scalar');
   elseif (MutR < 0 | MutR > 1), error('Parameter for mutation rate must be a scalar in [0, 1]'); end

   if isempty(MutShrink), MutShrink = 1;
   elseif isnan(MutShrink), MutShrink = 1;
   elseif length(MutShrink) ~= 1, error('Parameter for shrinking mutation range must be a scalar');
   elseif (MutShrink < 0 | MutShrink > 1), 
      error('Parameter for shrinking mutation range must be a scalar in [0, 1]');
   end
     
% the variables are mutated with probability MutR
% NewChrom = OldChrom (+ or -) * Range * MutShrink * Delta
% Range = 0.5 * (upperbound - lowerbound)
% Delta = Sum(Alpha_i * 2^-i) from 0 to ACCUR; Alpha_i = rand(ACCUR,1) < 1/ACCUR

% Matrix with range values for every variable
   Range = rep(0.5 * MutShrink *(FieldDR(2,:)-FieldDR(1,:)),[Nind 1]);

% zeros and ones for mutate or not this variable, together with Range
   Range = Range .* (rand(Nind,Nvar) < MutR);

% compute, if + or - sign 
   Range = Range .* (1 - 2 * (rand(Nind,Nvar) < 0.5));

% used for later computing, here only ones computed
   ACCUR = 20;
   Vect = 2 .^ (-(0:(ACCUR-1))');
   Delta = (rand(Nind,ACCUR) < 1/ACCUR) * Vect;
   Delta = rep(Delta, [1 Nvar]);

% perform mutation 
   NewChrom = OldChrom + Range .* Delta;

% Ensure variables boundaries, compare with lower and upper boundaries
   NewChrom = max(rep(FieldDR(1,:),[Nind 1]), NewChrom);
   NewChrom = min(rep(FieldDR(2,:),[Nind 1]), NewChrom);


% End of function

