function z = get_integral(N,vertices,deg)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Input : 1) N - order of Gaussian quadrature 2) Coordinates vertices of  %
%                                                        current element  %
%                                                                         %
% Output : 6*1 vector with i^th entry [integral f(x,y)*phi_i(x,y)] where  %
%            phi_i is i^th local basis function in the current element.   %
%              Integral is over each triangle. i ranges from 1 to 6.      %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

basis_count = (deg+1)*(deg+2)/2;
z = zeros(basis_count,1);
[X,W] = simplexquad(N,vertices);
NP = length(W);

for i = 1:basis_count                 
 for j = 1:NP                
 x = X(j,1); y = X(j,2);
 coords = [x,y];
 z(i,1) = z(i,1) + f(coords)*basis(i,x,y,vertices(1:3,:),deg)*W(j);
 end
end

end