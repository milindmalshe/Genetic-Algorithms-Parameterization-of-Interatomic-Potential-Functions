

function Chrom = crtrp(Nind,FieldDR);

% Check parameter consistency
   if nargin < 2, error('parameter FieldDR missing'); end
   if nargin > 2, nargin = 2; end

   [mN, nN] = size(Nind);
   [mF, Nvar] = size(FieldDR);

   if (mN ~= 1 & nN ~= 1), error('Nind has to be a scalar'); end
   if mF ~= 2, error('FieldDR must be a matrix with 2 rows'); end

% Compute Matrix with Range of variables and Matrix with Lower value
   Range = rep((FieldDR(2,:)-FieldDR(1,:)),[Nind 1]);
   Lower = rep(FieldDR(1,:), [Nind 1]);

% Create initial population
% Each row contains one individual, the values of each variable uniformly
% distributed between lower and upper bound (given by FieldDR)
   Chrom = rand(Nind,Nvar) .* Range + Lower;


% End of function
