n=10;
a = rand(n,1);
b = rand(1,1);
f = @(x) 1/2*norm(x)^2;
g = @(x) x;
project = @(x) x - (a'*x - b)*a/norm(a)^2;

xstar_exact = b*a/norm(a)^2;
pstar_exact = f(xstar_exact);

lmax =1;
x0 = zeros(n,1);
epsilon = 0.01;
[iter,pstar_pgd] = projected_gradient_method(f,g,lmax,project,x0,epsilon,pstar_exact);


fprintf('iter_number =%3d, pstar computed by projected gradient descent = %2.6f \n',iter, pstar_pgd)
fprintf('pstar exact  = %2.6f \n', pstar_exact)