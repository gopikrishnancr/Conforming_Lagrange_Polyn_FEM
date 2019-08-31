function uv = ue(z)

  x = z(1);
  y = z(2);
  
  %uv = sin(pi*x).*sin(pi*y);
  
  %uv = exp(x + y);
  
  %uv = exp(x + y).*(x + y - 2*x.*y);
  
  %uv=-2*x.*y + x + y;

  %uv = x.*(1-x).*y.*(1-y);
  
  %uv  = x.^2.*y + y.*x.^2;
  
  %  m = 3; l = 2;
  uv = exp(x+y)*sin(x^2)*y^2;

end