function [x,fun_val,iter]=gradient_method_exact(f,g,x0,P,epsilon)
%
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% x0......... initial point
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
t=norm(grad)^2/(grad'*P*grad);


x=[x x(:,end)-t*grad];
fun_val=[fun_val f(x(:,end))];
grad=g(x(:,end));
%fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val(:,end))
end