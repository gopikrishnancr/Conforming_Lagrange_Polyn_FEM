%~~~~~~~~~~~~~~~~~~~~~~~~~User Interface~~~~~~~~~~~~~~~~~~~~~~~~~% 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%       F.E.M. using quadratic basis functions  (P_deg basis)   %
%---------------------------------------------------------------%
%     - mu div(grad(u)) + alpha u  = f   in  \Omega             %
%                   (u_x, u_y). n = u_N  on  \partial\Omega_N   %
%                               u = u_D  on  \partial\Omega_D   %
%                                                               %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clearvars;             
format long;

% Number of refinements needed. Choose N to be less that or equal to 5.
% There is slight chance of system-out since the large data accumulation if
% N is 6 or above.
N = 5;

% Mesh number :- This parameter decides what should be the initial mesh. This
% dicatates the shape of the domain in which the calculations are being
% done.
mesh_np  = 1;

% This code can execute all P_k methods from k = 1 to 5. Set the parameter
% deg as k to execte P_k method.
deg = 2;                                 


%mu and alpha are parameters controlling the diffusion and convection term.
%Parameter mm denotes the value of mu and l denotes the value of alpha;
mm = 3;          l = 2;

% Function call %
FEM_diffusion_PK(N,mesh_np,deg,mm,l);

% CREATIVE COMMON LICENCE -- Knowledge is free %
