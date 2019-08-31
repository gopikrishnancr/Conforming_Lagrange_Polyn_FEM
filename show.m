function show(coordinates,elements,uh,u)
subplot(1,2,1)
trisurf(elements(:,1:3),coordinates(:,1),coordinates(:,2),uh,'facecolor','interp')
title('$\textrm{Approximate solution}$','Interpreter','latex','FontSize',14);
xlabel('$x$','Interpreter','latex','FontSize',12);
ylabel('$y$','Interpreter','latex','FontSize',12);
zlabel('$u_h(t,x)$','Interpreter','latex','FontSize',12);

subplot(1,2,2)
trisurf(elements(:,1:3),coordinates(:,1),coordinates(:,2),u','facecolor','interp')
title('$\textrm{Exact solution}$','Interpreter','latex','FontSize',14);
xlabel('$x$','Interpreter','latex','FontSize',12);
ylabel('$y$','Interpreter','latex','FontSize',12);
zlabel('$u(t,x)$','Interpreter','latex','FontSize',12);
