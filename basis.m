function bv = basis(n,x,y,vertices,deg)

L1=[ones(1,3);vertices']'\[1;0;0];
L2=[ones(1,3);vertices']'\[0;1;0];
L3=[ones(1,3);vertices']'\[0;0;1];

L1 = L1'*[1 x y]';
L2 = L2'*[1 x y]';
L3 = L3'*[1 x y]';


if deg == 1
    if n==1
    bv = L1;
elseif n==2
    bv = L2;
elseif n==3
    bv = L3;
    end
    
elseif deg == 2
    if n==1
    bv = L1*(2*L1-1);
elseif n==2
    bv = L2*(2*L2-1);
elseif n==3
    bv = L3*(2*L3-1);
elseif n==4
    bv = 4*L1*L2;
elseif n==5
    bv = 4*L2*L3;
elseif n==6
    bv = 4*L1*L3;
else
    end

elseif deg == 3
    
if n==1
    bv = L1*(3*L1 - 1)*(3*L1 - 2)/2;
elseif n==2
    bv = L2*(3*L2 - 1)*(3*L2 - 2)/2;
elseif n==3
    bv = L3*(3*L3 - 1)*(3*L3 - 2)/2;
elseif n==4
    bv = (9/2)*L1*L2*(3*L1-1);
elseif n==5
    bv = (9/2)*L1*L2*(3*L2-1);
elseif n==6
    bv = (9/2)*L2*L3*(3*L2-1);
elseif n==7
    bv = (9/2)*L2*L3*(3*L3-1);
elseif n==8
    bv = (9/2)*L1*L3*(3*L3-1);
elseif n==9
    bv = (9/2)*L1*L3*(3*L1-1);
elseif n==10
    bv = 27*L1*L3*L2;
else
end

elseif deg == 4
if n == 1
 bv = (L1*(-3 + 4*L1)*(-2 + 4*L1)*(-1 + 4*L1))/6;
elseif n == 2
 bv = (L2*(-3 + 4*L2)*(-2 + 4*L2)*(-1 + 4*L2))/6;
elseif n == 3
 bv = (L3*(-3 + 4*L3)*(-2 + 4*L3)*(-1 + 4*L3))/6;
elseif n == 4
 bv = (8*L1*(-2 + 4*L1)*(-1 + 4*L1)*L2)/3;
elseif n == 5
 bv = 4*L1*(-1 + 4*L1)*L2*(-1 + 4*L2);
elseif n == 6
 bv = (8*L1*L2*(-2 + 4*L2)*(-1 + 4*L2))/3;
elseif n == 7
 bv = (8*L2*(-2 + 4*L2)*(-1 + 4*L2)*L3)/3;
elseif n == 8.
 bv = 4*L2*(-1 + 4*L2)*L3*(-1 + 4*L3);
elseif n == 9
 bv = (8*L2*L3*(-2 + 4*L3)*(-1 + 4*L3))/3;
elseif n == 10
 bv = (8*L1*L3*(-2 + 4*L3)*(-1 + 4*L3))/3;
elseif n == 11
 bv = 4*L1*(-1 + 4*L1)*L3*(-1 + 4*L3);
elseif n == 12
 bv = (8*L1*(-2 + 4*L1)*(-1 + 4*L1)*L3)/3;
elseif n == 13
 bv = 32*L1*L2*L3*(-1 + 4*L3);
elseif n == 14
 bv = 32*L1*L2*(-1 + 4*L2)*L3;
elseif n == 15
 bv = 32*L1*(-1 + 4*L1)*L2*L3;
end

elseif deg == 5
    
 if n == 1
 bv = (625*(-4/5 + L1)*(-3/5 + L1)*(-2/5 + L1)*(-1/5 + L1)*L1)/24;
elseif n == 2
 bv = (625*(-4/5 + L2)*(-3/5 + L2)*(-2/5 + L2)*(-1/5 + L2)*L2)/24;
elseif n == 3
 bv = (625*(-4/5 + L3)*(-3/5 + L3)*(-2/5 + L3)*(-1/5 + L3)*L3)/24;
elseif n == 4
 bv = (3125*(-3/5 + L1)*(-2/5 + L1)*(-1/5 + L1)*L1*L2)/24;
elseif n == 5
 bv = (3125*(-2/5 + L1)*(-1/5 + L1)*L1*(-1/5 + L2)*L2)/12;
elseif n == 6
 bv = (3125*(-1/5 + L1)*L1*(-2/5 + L2)*(-1/5 + L2)*L2)/12;
elseif n == 7
 bv = (3125*L1*(-3/5 + L2)*(-2/5 + L2)*(-1/5 + L2)*L2)/24;
elseif n == 8
 bv = (3125*(-3/5 + L2)*(-2/5 + L2)*(-1/5 + L2)*L2*L3)/24;
elseif n == 9
 bv = (3125*(-2/5 + L2)*(-1/5 + L2)*L2*(-1/5 + L3)*L3)/12;
elseif n == 10
 bv = (3125*(-1/5 + L2)*L2*(-2/5 + L3)*(-1/5 + L3)*L3)/12;
elseif n == 11
 bv = (3125*L2*(-3/5 + L3)*(-2/5 + L3)*(-1/5 + L3)*L3)/24;
elseif n == 12
 bv = (3125*L1*(-3/5 + L3)*(-2/5 + L3)*(-1/5 + L3)*L3)/24;
elseif n == 13
 bv = (3125*(-1/5 + L1)*L1*(-2/5 + L3)*(-1/5 + L3)*L3)/12;
elseif n == 14
 bv = (3125*(-2/5 + L1)*(-1/5 + L1)*L1*(-1/5 + L3)*L3)/12;
elseif n == 15
 bv = (3125*(-3/5 + L1)*(-2/5 + L1)*(-1/5 + L1)*L1*L3)/24;
elseif n == 16
 bv = (3125*L1*L2*(-2/5 + L3)*(-1/5 + L3)*L3)/6;
elseif n == 17
 bv = (3125*L1*(-1/5 + L2)*L2*(-1/5 + L3)*L3)/4;
elseif n == 18
 bv = (3125*L1*(-2/5 + L2)*(-1/5 + L2)*L2*L3)/6;
elseif n == 19
 bv = (3125*(-1/5 + L1)*L1*L2*(-1/5 + L3)*L3)/4;
elseif n == 20
 bv = (3125*(-1/5 + L1)*L1*(-1/5 + L2)*L2*L3)/4;
elseif n == 21
 bv = (3125*(-2/5 + L1)*(-1/5 + L1)*L1*L2*L3)/6;
 end
 
end

end