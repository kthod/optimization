function [iter ,fun_val]=projected_gradient_method(f,g,lmax,p,x0,epsilon,pstar)
%
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% x0......... initial point
% epsilon ... tolerance parameter for stopping rule
% lmax ...... max eigenvalue of the hessian of f
% p ......... projection function 
% pstar ..... optimal value we are trying to reach
% OUTPUT
%=======================================
% x ......... optimal solution (up to a tolerance)
% of min f(x)
% fun_val ... optimal function value
x=x0;
grad=g(x);
fun_val=f(x);
iter=0;
while (abs(fun_val - pstar) > epsilon)
iter=iter+1;

x = p(x-1/lmax*grad) ;
fun_val=f(x);
grad=g(x);
%fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val)
end