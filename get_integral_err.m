function z = get_integral_err(N,vertices,cuh,f_flag,deg)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input : 1) N - order of quadrature rule 2) coordinates of vertices of   %
% current triangle 3) approximate solution at current element nodes       %
%                                                                         %
% Output : L^2 error integral over current triangle                       %
%                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

basis_count = (deg+1)*(deg+2)/2;
z = 0;
[X,W] = simplexquad(N,vertices);
NP = length(W);
local_basis = zeros(basis_count,1);   

if f_flag == 1

for j = 1:NP                              % loop over quadrature points
     x = X(j,1); y = X(j,2);
     coords = [x,y];
    for i = 1:basis_count                  % loop over nodes
        local_basis(i,1) = basis(i,x,y,vertices(1:3,:),deg);  
    end
    z = z + (cuh'*local_basis - ue(coords))^2*W(j); 
end


elseif f_flag ==2
    
    for j = 1:NP                       % loop over quadrature points
     x = X(j,1); y = X(j,2);
     coords = [x,y];
    for i = 1:basis_count                  % loop over nodes
        local_basis(i,1) = basis_x(i,x,y,vertices(1:3,:),deg);  
    end
     [ux,uy] = uxe(coords);
    z = z + (cuh'*local_basis - ux)^2*W(j); 
    end
    
elseif f_flag ==3
    
    for j = 1:NP                           % loop over quadrature points
     x = X(j,1); y = X(j,2);
     coords = [x,y];
    for i = 1:basis_count                  % loop over nodes
        local_basis(i,1) = basis_y(i,x,y,vertices(1:3,:),deg);  
    end
     [ux,uy] = uxe(coords);
    z = z + (cuh'*local_basis - uy)^2*W(j); 
    end

end

end