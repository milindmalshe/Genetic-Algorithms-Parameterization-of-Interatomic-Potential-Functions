
function FitnV = scaling( ObjV, Smul )

if nargin == 1
	Smul = 2 ;
end

[Nind, Nobj] = size( ObjV ) ;
Oave = sum( ObjV ) / Nind ;
Omin = min( ObjV ) ;
Omax = max( ObjV ) ;

if (Omin > ( Smul * Oave - Omax ) / ( Smul - 1.0 ))
	delta = Omax - Oave 
	a = ( Smul - 1.0 ) * Oave / delta 
	b = Oave * ( Omax - Smul * Oave ) / delta 
else
	delta = Oave - Omin ;
	a = Oave / delta ;
	b = -Omin * Oave / delta ;
end

FitnV = ObjV.*a + b ;
