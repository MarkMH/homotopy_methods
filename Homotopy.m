%% Written by Mark Marner-Hausen
function NashEQ = Homotopy(A,B,j,w)

    % Syntax:
    %   NashEQ = Homotopy(A, B, j, w)
    
    
    % Parameters: 
        % A is player 1's payoff matrix
        % B is player 2's payoff matrix
        % First make sure that A and B are such that the game is non-degenerate
        % 
        % j is the initial strategy which will be assigned with bonus b 
        % w defines by how much t is increased with every iteration 

    % Return:
    %   NashEQ is a 2x1 cell array where the first entry is the equilibrium
    %   profile of the player to whome j belongs
    
   

% Check Inputs
 if any(size(A) ~= size(B))
		error('Matrices must have same dimension');
 end

 if j < 1 || j > size(A,1) + size(B,2)
        error(['Initial strategy must be in {1,...,' num2str(size(A,1) + size(B,2)) '}']);
 end


% Switch positions if j is of player 2
K = A;
L = B;
if j <= size(A,1)
   A = K;
   B = L;
else
    j = j - size(A,1);
    A = transpose(L);
    B = transpose(K);
end

B_prime = transpose(B);


% Calculate the initial Nash Equilibrium (sigmai_0,sigmaj) for t=0 
sigmai_0 = zeros(size(A,1),1);
sigmai_0(j) = 1;
sigmai = sigmai_0;

sigmaj = B_prime * sigmai_0;
sigmaj = ismember(sigmaj,max(sigmaj));


% Let t start at 0 and go to 1 with steps of size w
At = A;
for t = 0:w:1  
    
    % Give a sufficiently large bonus to the j-th row of A 
     At(j,:) = A(j,:) + ones(1,size(A,2))*(1-t)*max(max(A));
   
    % Remember that the game is non-degenerate
    sigmai_tmp = sum(sigmai > zeros(size(sigmai,1),1));
    sigmaj_tmp = sum(sigmaj > zeros(size(sigmaj,1),1));
    
    if sigmai_tmp + sigmaj_tmp < 2*min([size(sigmai,1) size(sigmaj,1)])
    
    % Calculate the best response of player i against the strategy of j. 
    % Note that for now it is enough to assign probability 1 to the 
    % strategies which are best responses
    sigmai = round(At * sigmaj);
    sigmai = ismember(sigmai,max(sigmai));
   
    % Later we want to check whether the b.r. of i against j chances as
    % soon as sigmaj is known
    sigmai_t = sigmai ;
         
         
          % If player i assigns positive probability to several strategies
          % it follows that j must mix as well 
          if sum(sigmai)~=1  
         
          % Set up the complementary condition to calculate sigma j
          AL = A(logical(sigmai),:);

          AA = zeros(size(AL,1)+1,size(AL,2)+1);
          AA(1:size(AA,1)-1,1) = ones;
          AA(1:size(AL,1),2:size(AL,2)+1) = -AL;
          AA(size(AA,1),2:size(AL,2)+1)= ones;
 
          d=zeros(size(AA,1),1);
          d(size(AA,1),1) = 1;
                
          sigmaj = lsqnonneg(AA,d) ;   
          sigmaj(1,:)=[];
        
         
            
          % Set up the complementary condition to calculate sigma i
          BL = B_prime(logical(sigmaj),:);
    
          BB = zeros(size(BL,1)+1,size(BL,2)+1);
          BB(1:size(BB,1)-1,1) = ones;
          BB(1:size(BL,1),2:size(BL,2)+1) = -BL;
          BB(size(BB,1),2:size(BL,2)+1)= ones;
                          
          d=zeros(size(BB,1),1);
          d(size(BB,1),1) = 1;
                                
          sigmai = lsqnonneg(BB,d);
          sigmai(1,:) = [];
             
         
          % Check whether sigmai assigns positive probability to same 
%           strategies as initially defined as best responses by sigmai_t 
%           for given t. If not calculate sigmai and sigmaj again 
            f = find(sigmai > zeros(size(sigmai,1),1));
            g = find(sigmai_t==1);
            
            if sum(g) ~= sum(f)
                         
                 AL = A(logical(sigmai),:);
                 AA = zeros(size(AL,1)+1,size(AL,2)+1);
                 AA(1:size(AA,1)-1,1) = ones;
                 AA(1:size(AL,1),2:size(AL,2)+1) = -AL;
                 AA(size(AA,1),2:size(AL,2)+1)= ones;  
                 d=zeros(size(AA,1),1);
                 d(size(AA,1),1) = 1;      
                 sigmaj = lsqnonneg(AA,d);   
                 sigmaj(1,:)=[];
                  
                  
                 BL = B_prime(logical(sigmaj),:);
                 BB = zeros(size(BL,1)+1,size(BL,2)+1);
                 BB(1:size(BB,1)-1,1) = ones;
                 BB(1:size(BL,1),2:size(BL,2)+1) = -BL;
                 BB(size(BB,1),2:size(BL,2)+1)= ones;       
                 d=zeros(size(BB,1),1);
                 d(size(BB,1),1) = 1;                   
                 sigmai = lsqnonneg(BB,d);
                 sigmai(1,:) = [];
             
                 AL = A(logical(sigmai),:);
                 AA = zeros(size(AL,1)+1,size(AL,2)+1);
                 AA(1:size(AA,1)-1,1) = ones;
                 AA(1:size(AL,1),2:size(AL,2)+1) = -AL;
                 AA(size(AA,1),2:size(AL,2)+1)= ones;
                 d=zeros(size(AA,1),1);
                 d(size(AA,1),1) = 1;
                 sigmaj = lsqnonneg(AA,d);   
                 sigmaj(1,:)=[];
             
            end
          else
              % if sigmai is a pure strategy it is simple to calculate 
              % sigmaj
              sigmaj = B_prime * sigmai;
              sigmaj = ismember(sigmaj,max(sigmaj));
          end
    end
             
      
end



          
          
NashEQ = {sigmai ; sigmaj};

