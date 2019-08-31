function err_disp(L2e,H1e,ocul2,ocuh1,ref)

 fprintf('%30s \n','Order of Convergence');
 fprintf('\n');
 fprintf('%10s %15s %15s \n','Iteration No.','L^2 O.O.C.','H^1 O.O.C.');
 for j =1:ref-1
 fprintf('%-10i %18.8f %15.8f \n',j,ocul2(j,1),ocuh1(j,1));
 end
 fprintf('\n');
 
 fprintf('%30s \n','L2 and H1 error');
 fprintf('\n');
 fprintf('%10s %15s %15s \n','Iteration No.','L^2 error','H^1 error');
 for j =1:ref
 fprintf('%-10i %18.4d %15.4d \n',j,L2e(j,1),H1e(j,1));
 end
 fprintf('\n');
 
end