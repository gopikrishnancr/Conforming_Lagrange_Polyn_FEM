function u=u_nodes(Coord)
for j=1:size(Coord,1),
    curcoords=Coord(j,:);
    u(j)=ue(curcoords);
end