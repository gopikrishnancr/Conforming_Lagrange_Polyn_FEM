function val = int_gaussian(nweight,Coord,Elem,Nb,deg,mm)

val = zeros(deg+1,1);
cin = Coord(Nb(1),:);
cfin = Coord(Nb(deg+1),:);
ver_nodes = Elem(Nb(end),1:3);
vertices = Coord(ver_nodes,:);
h = norm(cin - cfin,2)/2;

% Normal %
P1 = cin;
P2 = cfin;
P3 =  Coord(setdiff(ver_nodes,[Nb(1),Nb(deg+1)]),:);
AB = P2 - P1;
AC = P3 - P1;
N = [-AB(2),AB(1)];
if dot(N,AC) > 0
    N = -N;
end
N = N/norm(N);

[X,W] = simplexquad(nweight,[-1;1]);
for i = 1:deg+1
    b_index = find(Elem(Nb(end),:)==Nb(i));
    for j = 1:length(W)  
        coord = X(j)*(cfin - cin)/2 + (cfin+cin)/2;
        val(i,1) = val(i,1) +W(j)*basis(b_index,coord(1),coord(2),vertices,deg)*...
                              dot(ugn(coord),N);
    end
    val(i,1) = mm*val(i,1)*h;
end