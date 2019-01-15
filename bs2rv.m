
function Phen = bs2rv(Chrom,FieldD)

% Identify the population size (Nind)
%      and the chromosome length (Lind)
[Nind,Lind] = size(Chrom);

% Identify the number of decision variables (Nvar)
[seven,Nvar] = size(FieldD);

if seven ~= 7
	error('FieldD must have 7 rows.');
end

% Get substring properties
len = FieldD(1,:);
lb = FieldD(2,:);
ub = FieldD(3,:);
code = ~(~FieldD(4,:));
scale = ~(~FieldD(5,:));
lin = ~(~FieldD(6,:));
uin = ~(~FieldD(7,:));

% Check substring properties for consistency
if sum(len) ~= Lind,
	error('Data in FieldD must agree with chromosome length');
end

if ~all(lb(scale).*ub(scale)>0)
	error('Log-scaled variables must not include 0 in their range');
end

% Decode chromosomes
Phen = zeros(Nind,Nvar);

lf = cumsum(len);
li = cumsum([1 len]);
Prec = .5 .^ len;

logsgn = sign(lb(scale));
lb(scale) = log( abs(lb(scale)) );
ub(scale) = log( abs(ub(scale)) );
delta = ub - lb;

Prec = .5 .^ len;
num = (~lin) .* Prec;
den = (lin + uin - 1) .* Prec;

for i = 1:Nvar,
    idx = li(i):lf(i);
    if code(i) % Gray decoding
	    Chrom(:,idx)=rem(cumsum(Chrom(:,idx)')',2);
    end
    Phen(:,i) = Chrom(:,idx) * [ (.5).^(1:len(i))' ];
    Phen(:,i) = lb(i) + delta(i) * (Phen(:,i) + num(i)) ./ (1 - den(i));
end

expand = ones(Nind,1);
if any(scale)
	Phen(:,scale) = logsgn(expand,:) .* exp(Phen(:,scale));
end
