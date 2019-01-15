
function NewChrom = xovsprs(OldChrom, XOVR);

if nargin < 2, XOVR = NaN; end

% call low-level function with appropriate parameters
   NewChrom = xovmp(OldChrom, XOVR, 1, 1);


% End of function
