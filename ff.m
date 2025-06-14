

function [n,y,Y]=ff(n)


    %Depth first version of Ford Fulkerson algorithm
    %adjacency matrix representing capacities
 
    %Generating random square matrix to represent capacities



    %Generate random matrix
     Cap = randi([1, 10], [n,n]);
     len=length(Cap);
     v=zeros(len);

     %set all diagnols to zero
     Cap = Cap - diag(diag(Cap)) + diag(v);

     %set first column and last row to zero to eliminate any loops
     Cap(:,1) = 0;
     Cap(len,:) = 0;
     %Ensure there are no paths from source to sink to keep things interesting
     Cap(1,len) = 0;

    % Ensuring there are no inward edges to souce and none outwards from sink
    G=digraph(Cap,'omitselfloops');
 
                         
    
    % source and sink
    %choosing INF to be a very large number
    INF=999999;
    s = 1; 
    t = len; 
    max_flow=0;


    %sent = 0;

    visited = false(1, len);
    Flow = zeros(len, len);
 
 
 
     %star dfs and MATLAB's maxflow function
     %start timers

   
    %Start timer
     tic
      sent = dfs(s, t, INF);

      while sent ~= 0
    
 
          max_flow =max_flow+sent;

          %reset visited to false
          visited = false(1, len);

          sent = dfs(s,t,INF);
      end 
      %Stop timer
      y=toc;
      
 
     %uncomment below to see residual graph(though very large)
     % disp('Residual graph:');
     %disp(Flow);
      disp(['Max flow is ' num2str(max_flow)]);
    

    
       function F = dfs(s,t,minimum)
           F=0;
       %set first element to true
        visited(s) = true;
     %ensure source isnt equal to sink
           if s==t
             F = minimum;
           end 
 
           for i = 1:len
               flow_cap = Cap(s,i) - Flow(s,i);
            
            %check to see node not visited and there is flow
               if ~visited(i) && flow_cap > 0
                
                     sent = dfs(i, t, min(minimum, flow_cap)); 
                  
                     if sent

                           %Mark forward and backward edges accordinagly
                           Flow(s,i) = Flow(s,i)+sent;
                           Flow(i,s) = Flow(i,s) - sent;
                           F=sent;
                     
                    
                     end 
               
               end 
           
           end

       end

       tic
       BFS=maxflow(G,s,len)
       Y=toc;

      
     end
