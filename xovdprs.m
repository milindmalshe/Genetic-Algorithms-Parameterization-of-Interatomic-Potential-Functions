
function NewChrom = xovdprs(OldChrom, XOVR);

if nargin < 2, XOVR = NaN; end

% call low-level function with appropriate parameters
   NewChrom = xovmp(OldChrom, XOVR, 2, 1);


% End of function
