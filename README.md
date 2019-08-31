# Conforming_Lagrange_Polyn_FEM
This code is intended to perfomrm conforming Lagrange Finite Element Method for Elliptic PDES of the form

     - mu div(grad(u)) + alpha u  = f   in  \Omega,             
                  (u_x, u_y). n = u_N  on  \partial\Omega_N,   
                               u = u_D  on  \partial\Omega_D. 
         
Here, $\Omega$ is the domain of solution which is taken as the unit square (-1,1)^2. The boundaries, \partial \Omega_N
is the Nuemann boundary, and \partial \Omega_D is the Dirichlet boundary. 

The code is very user friendly. The parameters mu and alpha can be adjusted in the file user_interface.m 

Change parameter 'N' to adjust the number of refinements. 

The initial_mesh can be adjusted by changing the parameter 'mesh_np'.

The code can k^th degree polynomial FEM up to k = 5.
