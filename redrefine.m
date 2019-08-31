function [Coord,Elem,Db,Nb]=redrefine(Coord,Elem,n2ed,ed2el,Db,Nb)

nt=size(Elem,1);    % number of elements in the current triangulation
ne=size(ed2el,1);   % number of edges in the current triangulation
marker=sparse(ne,1);

for i=1:ne,    % take i^th edge.
    % inode and enode are the nodes connected by i^th edge.
    inode=ed2el(i,1); enode=ed2el(i,2);    
    % coord1 and coord2 are the cooresponding coordinates.
    coord1=Coord(inode,:); coord2=Coord(enode,:);
    % Take the midpoint of these two coordinates. This is a new node in the
    % next refinment. 
    nCoord=(coord1+coord2)/2;
    % Give a number to it. Well we have size(Coord,1)+1 elements now. Name
    % this Coord as the next. 
    marker(i)=size(Coord,1)+1; 
    % Expand the coordinate list.
    Coord(size(Coord,1)+1,:)=[nCoord(1) nCoord(2)];
end

% The next task is to update the elements. 
for i=1:nt % Take all i^th triangle
    % ct is the vector with nodes of triangle i.
    ct=Elem(i,:);
    % ce gives the esdge numbers between 2--3,3--1, and 1--2.
    ce=diag(n2ed(ct([2 3 1]),ct([3 1 2])));
    m1=marker(ce(1));  m2=marker(ce(2)); m3=marker(ce(3));
    % the new triangle is the triangle connecting the edge centres.
    Elem(i,:)=[m1 m2 m3];
    nt1=size(Elem,1);   % number of elems in current refinement.
     % new elem. Start from one corner and add next two edge centres.
    Elem(nt1+1,:)=[ct(1) m3 m2];  
    Elem(nt1+2,:)=[ct(2) m1 m3];  
    Elem(nt1+3,:)=[ct(3) m2 m1];  
end


%%%% Boundary Edges
if (~isempty(Db))
    db=size(Db,1);  % Number of Dirichlet boundary edges
    for i=1:db      % take ith Dirchlet node.
        base=n2ed(Db(i,1),Db(i,2));  % edge number of i^th Dirichlet edge.
        if (marker(base)>0)          % edge midpoint no. to the edge
            p=[Db(i,1) marker(base)  Db(i,2)];
            % give two Dirichlet edges. 
            Db(i,:)=[p(1) p(2)];     
            Db(size(Db,1)+1,:)=[p(2) p(3)];
        end
    end
end


if (~isempty(Nb))
    nb=size(Nb,1);
    for i=1:nb,
         base=n2ed(Nb(i,1),Nb(i,2));
        if (marker(base)>0)
            p=[Nb(i,1) marker(base)  Nb(i,2)];
            Nb(i,:)=[p(1) p(2)];
            Nb(size(Nb,1)+1,:)=[p(2) p(3)];
        end
    end
            
end
