function [Coord,Elem,Nb,Db]=InitialMesh(N) 

%%%%%%%%%%%%% Square N=1 %%%%%%%%%%%%%%%%%%%%
if N==1
Coord=[0 0;1 0;0 1;1 1;1/2 1/2];
Elem=[1 2 5;1 5 3;3 5 4;5 2 4];
Db=[1 2;2 4];
Nb=[4 3;3 1];
end
%%%%%%%%%%%%%%%% Diamond N=2 %%%%%%%%%%%%%%%%
if N==2
   Coord=[1 0;0 1;-1 0;0 -1];
   Elem=[1 2 3;3 4 1];
   Db=[];
   Nb=[3 4;4 1;1 2;2 3];
end
if N==3
   Coord=[1/2 0;0.5 0.5;1 0.5;1 1;0 1;0 0];
   Elem=[1 2 6;3 4 2;2 4 5;2 5 6];
   Db=[1 2;2 3;3 4;4 5];
   Nb=[5 6;6 1];
end


