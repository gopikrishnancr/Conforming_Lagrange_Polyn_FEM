function fv = f(z)

x = z(1); y = z(2);

%fv = sin(pi*x).*sin(pi*y) + 2*pi^2*sin(pi*x).*sin(pi*y);

%fv = -exp(x+y);

%fv = 2*exp(x + y).*(2*x - 1) + 2*exp(x + y).*(2*y - 1) - exp(x + y).*(x + y - 2*x.*y);

%fv=-2*x.*y + x + y;

%fv = -2*x.*(x - 1)-2*y.*(y - 1) + x.*(1-x).*y.*(1-y);

%fv = 2*y.*x.^2 - 4*y;

fv = 12*x^2*y^2*sin(x^2)*exp(x + y) - 6*y^2*cos(x^2)*exp(x + y) - 4*y^2*sin(x^2)*exp(x + y) - 12*y*sin(x^2)*exp(x + y) - 6*sin(x^2)*exp(x + y) - 12*x*y^2*cos(x^2)*exp(x + y);

end