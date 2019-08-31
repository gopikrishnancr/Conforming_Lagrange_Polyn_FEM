function [uxv,uyv] = uxe(z)

x = z(1);
y = z(2);

%uxv = pi*cos(pi*x).*sin(pi*y);
%uyv = pi*cos(pi*y).*sin(pi*x);

%uxv = exp(x+y);
%uyv = exp(x+y);

%uxv = exp(x + y).*(x + y - 2*x.*y) - exp(x + y).*(2*y - 1);
%uyv = exp(x + y).*(x + y - 2*x.*y) - exp(x + y).*(2*x - 1);

%uxv=-2*y + 1;
%uyv=-2*x + 1;

%uxv = x.*y.*(y - 1) + y.*(x - 1).*(y - 1);
%uyv = x.*y.*(x - 1) + x.*(x - 1).*(y - 1);

%uxv = 4*x.*y;
%uyv = 2*x.^2;

uxv = y^2*sin(x^2)*exp(x + y) + 2*x*y^2*cos(x^2)*exp(x + y);
uyv = y^2*sin(x^2)*exp(x + y) + 2*y*sin(x^2)*exp(x + y);

end