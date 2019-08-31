function FEM_diffusion_PK(N,mesh_np,deg,mm,l)
 
L2e = zeros(N,1);
H1e = zeros(N,1);
di = zeros(N,1);

[Coord,Elem,Nb,Db]=InitialMesh(mesh_np);     


for ref = 1:N   
di(ref,1)=1/(2^(ref-1));  
[n2ed,ed2el]=edge(Elem,Coord);
Elem1 = Elem; Coord1 = Coord; Nb1 = Nb; Db1 = Db;
[Coord,Elem,Db,Nb]   = get_p_deg(Coord,Elem,n2ed,ed2el,Db,Nb,deg);  

nd = size(Coord,1);
A = zeros(nd,nd);
b = zeros(nd,1);
FullNodes= 1:size(Coord,1);                                      
FreeNodes=setdiff(FullNodes, unique(Db));
nelem  = size(Elem,1);


for j=1:nelem
    A(Elem(j,:),Elem(j,:)) = A(Elem(j,:),Elem(j,:))+...
                                 stima(Coord(Elem(j,1:3),:),deg,mm,l) ;                                                               
end

for j=1:nelem
    b(Elem(j,:))= b(Elem(j,:)) + get_integral(10,Coord(Elem(j,1:3),:),deg);
end   



if (~isempty(Nb))
   for j=1:size(Nb,1)
       b(Nb(j,1:deg+1))= b(Nb(j,1:deg+1)) +...
                 int_gaussian(15,Coord,Elem,Nb(j,:),deg,mm);   
   end
end


uh=zeros(length(FullNodes),1);


if (~isempty(Db))
    Dbnodes=unique(Db);
    for j=1:size(Dbnodes,1)
       uh(Dbnodes(j),1)=ue(Coord(Dbnodes(j),:));
    end
end

b=b-A*uh;


uh(FreeNodes)=A(FreeNodes,FreeNodes)\b(FreeNodes);         


u=u_nodes(Coord);     
figure(ref)
show(Coord,Elem,uh,u);

[L2e(ref,1),H1e(ref,1)]=Err(Coord,Elem,uh,deg);    
[Coord,Elem,Db,Nb] = redrefine(Coord1,Elem1,n2ed,ed2el,Db1,Nb1);
end

if ~(ref-1 == 0)
ocuh1 = zeros(ref-1,1);
ocul2 = zeros(ref-1,1);

for jj=1:(ref-1) 
 ocuh1(jj,1)=log(H1e(jj,1)/H1e(jj+1,1))/log(di(jj,1)/di(jj+1,1));
 ocul2(jj,1)=log(L2e(jj,1)/L2e(jj+1,1))/log(di(jj,1)/di(jj+1,1));
end
fprintf('\n')
fprintf('%45s %-5i \n','Finite Element Method : Basis Degree = ',deg)
fprintf('\n')
err_disp(L2e,H1e,ocul2,ocuh1,ref)
end

