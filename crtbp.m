
function [Chrom, Lind, BaseV] = crtbp(Nind, Lind, Base)
nargs = nargin ;

% Check parameter consistency

if nargs >= 1, [mN, nN] = size(Nind) ; end
if nargs >= 2, [mL, nL] = size(Lind) ; end
if nargs == 3, [mB, nB] = size(Base) ; end

if nN == 2
   if (nargs == 1) 
      Lind = Nind(2) ; Nind = Nind(1) ; BaseV = crtbase(Lind) ;
   elseif (nargs == 2 & nL == 1) 
      BaseV = crtbase(Nind(2),Lind) ; Lind = Nind(2) ; Nind = Nind(1) ; 
   elseif (nargs == 2 & nL > 1) 
      if Lind ~= length(Lind), error('Lind and Base disagree'); end
      BaseV = Lind ; Lind = Nind(2) ; Nind = Nind(1) ; 
   end
elseif nN == 1
   if nargs == 2
      if nL == 1, BaseV = crtbase(Lind) ;
      else, BaseV = Lind ; Lind = nL ; end
   elseif nargs == 3
      if nB == 1, BaseV = crtbase(Lind,Base) ; 
      elseif nB ~= Lind, error('Lind and Base disagree') ; 
      else BaseV = Base ; end
   end
else
   error('Input parameters inconsistent') ;
end

% Create a structure of random chromosomes in row wise order, dimensions
% Nind by Lind. The base of each chromosomes loci is given by the value
% of the corresponding element of the row vector base.

Chrom = floor(rand(Nind,Lind).*BaseV(ones(Nind,1),:)) ;


% End of file 
