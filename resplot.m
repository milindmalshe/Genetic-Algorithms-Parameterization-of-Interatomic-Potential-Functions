
function resplot(Chrom,IndAll,ObjV,Best,gen);

   % plot of best and mean value per generation
      subplot(2,2,1), plot(Best);
      title('Best and mean objective value');
      xlabel('generation'), ylabel('objective value');

   % plot of best individuals in all generations
      subplot(2,2,2), plot(IndAll);
      title(['Best individuals']);
      xlabel('generation'), ylabel('value of variable');

   % plot of variables of all individuals in current generation
      subplot(2,2,3), plot(Chrom');
      title(['All individuals in gen ',num2str(gen)]);
      xlabel('number of variable'), ylabel('value of variable');

   % plot of all objective values in current generation
      subplot(2,2,4), plot(ObjV,'y.');
      title(['All objective values']);
      xlabel('number of individual'), ylabel('objective value');

   drawnow;


% End of function

