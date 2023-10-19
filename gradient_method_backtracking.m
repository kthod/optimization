function [x,fun_val,iter]=gradient_method_backtracking(f,g,x0,s,alpha,beta,epsilon)
% Gradient method with backtracking stepsize rule
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% x0......... initial point
% s ......... initial choice of stepsize
% alpha ..... tolerance parameter for the stepsize selection
% beta ...... the constant in which the stepsize is multiplied
% at each backtracking step (0<beta<1)
% epsilon ... tolerance parameter for stopping rule
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value
x=[x0];
grad=g(x(:,end));
fun_val=[f(x(:,end))];
iter=0;
while (norm(grad)>epsilon)
iter=iter+1;
t=s;
while (fun_val(:,end)-f(x(:,end)-t*grad)<=alpha*t*norm(grad)^2)
t=beta*t;
end


x=[x x(:,end)-t*grad];
fun_val=[fun_val f(x(:,end))];
grad=g(x(:,end));
%fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val(:,end))
end