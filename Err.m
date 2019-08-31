function [L2e,H1e]=Err(Coord, Elem, uh,deg)

L2e=0; H1e=0; 

for j=1:size(Elem,1),
    
    curnodes=Elem(j,:);                  % nodes of the current triangle      
    vertices = Coord(curnodes(1:3),:);   % Coordinates of vertices
    Cuh=uh(curnodes);                    % approximate solution at nodes
    
    % Apprixmate solution is represented as sum(uh(i)*phi_i)_i=1^6 where phi_i
   % is the i^th local basis function. Then the L^2 error is computed using the
   % forumula Integral( sum( uh(i)*phi_i )(x,y) - u_exact(x,y) )^2 using
   % Gaussian quadrature rule. get_integral_err(n,vertices,cuh) do this
   % calculation with n^th order quadrature rule.
   
   L2e = L2e + get_integral_err(5,vertices,Cuh,1,deg);
   H1e = H1e + get_integral_err(5,vertices,Cuh,2,deg) +...
               get_integral_err(5,vertices,Cuh,3,deg);
end

   L2e=sqrt(L2e);                 %L^2  norm
   H1e=sqrt(H1e + L2e^2);         %H^1  norm
   
end


