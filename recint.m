function NewChrom = recint(OldChrom, XOVR);

% Identify the population size (Nind) and the number of variables (Nvar)
   [Nind,Nvar] = size(OldChrom);

% Identify the number of matings
   Xops = floor(Nind/2);

% Performs recombination
   odd = 1:2:Nind-1;
   even= 2:2:Nind;

   % position of value of offspring compared to parents
   Alpha = -0.25 + 1.5 * rand(Xops,Nvar);

   % recombination
   NewChrom(odd,:)  = OldChrom(odd,:) + Alpha .* (OldChrom(even,:) - OldChrom(odd,:));

   % the same ones more for second half of offspring
   Alpha = -0.25 + 1.5 * rand(Xops,Nvar);
   NewChrom(even,:) = OldChrom(odd,:) + Alpha .* (OldChrom(even,:) - OldChrom(odd,:));

% If the number of individuals is odd, the last individual cannot be mated
% but must be included in the new population
   if rem(Nind,2),  NewChrom(Nind,:)=OldChrom(Nind,:); end


% End of function

