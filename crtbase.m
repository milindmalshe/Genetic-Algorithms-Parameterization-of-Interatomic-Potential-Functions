
function BaseVec = crtbase(Lind, Base)

[ml LenL] = size(Lind) ;
if nargin < 2 
	Base = 2 * ones(LenL,1) ; % default to base 2
end
[mb LenB] = size(Base) ;

% check parameter consistency
if ml > 1 | mb > 1
	error( 'Lind or Base is not a vector') ;
elseif (LenL > 1 & LenB > 1 & LenL ~= LenB) | (LenL == 1 & LenB > 1 ) 
	error( 'Vector dimensions must agree' ) ;
elseif LenB == 1 & LenL > 1
	Base = Base * ones(LenL,1) ;
	
end

BaseVec = [] ;
for i = 1:LenL
	BaseVec = [BaseVec, Base(i)*ones(Lind(i),1)'];
end
