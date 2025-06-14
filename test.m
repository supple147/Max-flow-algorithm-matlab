function test()


    %vector arrays to hold times and size of network
    dfsTime=[];
    bfsTime=[];
    mag=[];

  %step size of 2
    for k = 4:2:10

       [n,y,Y]=ff(k);
         mag(end+1)=n;
         dfsTime(end+1)=y;
         bfsTime(end+1)=Y;


    end

%plots
  semilogy(mag,bfsTime,'--rs')
  hold on
  semilogy(mag,dfsTime,'--bs')
  xlabel('network size(number of nodes)') 
  ylabel('Time (toc)') 
  title('DFS vs MATLAB')
  legend({'MATLAB','DFS'},'Location','southwest')
 



end