function [Coord,Elem_P_deg,Db,Nb_int] = get_p_deg(Coord,Elem,n2ed,ed2el,Db,Nb,deg)

nt=size(Elem,1);    
ne=size(ed2el,1);   
marker=zeros(ne,deg-1);
n_nodes = (deg+1)*(deg+2)/2;
Elem_P_deg = zeros(nt,n_nodes);
Nb_int = zeros(size(Nb,1),deg+2);

for i=1:ne
    scoord = size(Coord,1);
    inode=ed2el(i,1); enode=ed2el(i,2);    
    coord1=Coord(inode,:); coord2=Coord(enode,:); 
    lam = linspace(0,1,deg+1);
    for ind = 1:deg-1
        nCoord        = lam(ind+1)*coord2 + (1-lam(ind+1))*coord1;
        marker(i,ind) = scoord + ind;
        Coord(size(Coord,1)+1,:) = nCoord;
    end
end

for i=1:nt
    ct=Elem(i,:);
    if deg > 2 || deg == 2
    c1 =Coord(ct(1),:);  c2 =Coord(ct(2),:);  c3 =Coord(ct(3),:);
    lam_bary = linspace(1,deg-1,deg-1);
    cen_coord = (deg-2)*(deg-1)/2;
    n_bary = zeros(cen_coord,1);
    k_in = 1;
for i_bary = 1:deg-1
    for tr_bary = 1:deg-1
        if deg-lam_bary(i_bary)-lam_bary(tr_bary) > 0 
        n_bary(k_in,1) = size(Coord,1)+1;
        coord_bary = (c1*lam_bary(i_bary) + c2*lam_bary(tr_bary) +...
                     c3*(deg-lam_bary(i_bary)-lam_bary(tr_bary)))/deg;
        Coord(n_bary(k_in,1),:) = coord_bary;
        k_in = k_in + 1;
        end
    end
end
    end
    ce = diag(n2ed(ct([2 3 1 ]),ct([3 1 2])));
    ce = ce([3 1 2]);
   % m1=marker(ce(1),:);  m2=marker(ce(2),:); m3=marker(ce(3),:);
    a = ct;
    if deg > 2 || deg==2
    for tr_bary = 1:3
        if ct(tr_bary) == ed2el(ce(tr_bary),1) 
            a = [a,marker(ce(tr_bary),:)];
        else
            a = [a,fliplr(marker(ce(tr_bary),:))];
        end
    end
    a = [a,n_bary'];
    end
    Elem_P_deg(i,:) = a;
end


%--------------------------Boundary  Edges--------------------------%
if (~isempty(Db))
    db=size(Db,1);  
    for i=1:db       
        base=n2ed(Db(i,1),Db(i,2));            
        p=[Db(i,1) marker(base,:)  Db(i,2)];
        Db(i,:)=[p(1) p(2)];  
        if deg >2 || deg==2
        for db_ind = 2:deg
            Db(size(Db,1)+1,:) = [p(db_ind) p(db_ind+1)];
        end
        end
    end
end


if (~isempty(Nb))
    nb=size(Nb,1);
    for i=1:nb
            base=n2ed(Nb(i,1),Nb(i,2));
            tr_ind = ed2el(base,3);
      
            if ed2el(base,1)==Nb(i,1)
                p=[Nb(i,1) marker(base,:)  Nb(i,2)];
            else
                p=[Nb(i,1) fliplr(marker(base,:))  Nb(i,2)];
            end
            Nb_int(i,:) = [p,tr_ind];           
    end
            
end