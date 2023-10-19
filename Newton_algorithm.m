function [x,fun_val ,iter] = Newton_algorithm(f,g,H,x0,s,alpha,beta,epsilon,A,b)
% Gradient method with backtracking stepsize rule
%
% INPUT
%=======================================
% f ......... objective function
% g ......... gradient of the objective function
% H ......... Hessian of the function 
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
Hessian = H(x(:,end));
fun_val=[f(x(:,end))];
iter=0;
while (1)
Delta_xNt = - inv(Hessian)*grad;
lambda2 = grad'*inv(Hessian)*grad;
if(lambda2/2<=epsilon)
    break;
end
iter=iter+1;
t=s;
while (any(b-A*(x(:,end)+t*Delta_xNt)<=0))
    t=beta*t;
end
while (fun_val(:,end)-f(x(:,end)+t*Delta_xNt)<alpha*t*lambda2)%any(b-A*(x(:,end)-t*grad)<=0))
t=beta*t;
end


x=[x x(:,end)+t*Delta_xNt];
fun_val=[fun_val f(x(:,end))];
grad=g(x(:,end));
Hessian= H(x(:,end));
%fprintf('iter_number = %3d norm_grad = %2.6f fun_val = %2.6f \n',iter,norm(grad),fun_val(:,end))
end