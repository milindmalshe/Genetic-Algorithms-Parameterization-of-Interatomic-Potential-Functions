
function NewChrIx = rws(FitnV,Nsel);

% Identify the population size (Nind)
[Nind,ans] = size(FitnV);

% Perform Stochastic Sampling with Replacement
cumfit  = cumsum(FitnV);
trials = cumfit(Nind) .* rand(Nsel, 1);
Mf = cumfit(:, ones(1, Nsel));
Mt = trials(:, ones(1, Nind))';
[NewChrIx, ans] = find(Mt < Mf & ...
                        [ zeros(1, Nsel); Mf(1:Nind-1, :) ] <= Mt);
