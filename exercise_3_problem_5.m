n=10;
p=6;

% construction o positive definite matrix P
X = randn(n,n);
[U,S,V] = svd(X);
lmin =1;

lmax =10;

z = lmin +(lmax -lmin)*rand(n-2,1);
eig_P = [lmin;lmax;z];
L=diag(eig_P);

P = U'*L*U;

q = rand(n,1);  % construction of q
A = rand(p,n); % construction of A matrix (using rand we get a rows linear independent matrix with propability of 1
b = rand(p,1); % construction of b

f = @(x) 1/2*x'*P*x +q'*x; 
g = @(x) P*x +q;


% solving the optimization problem using cvx 
cvx_begin
    variable x(n)
    minimize( f(x) )
    subject to 
    A*x == b
    
cvx_end

fprintf('pstar computed by cvx  = %2.6f \n', f(x))

% solving the problem by calculating exactly the optimal point using the
% linsolve according to the equation
%       | P A'| |x|   |-q|
%       | A O | |v| = |b |

U = [P A' ; A zeros(p,p)];
v = [-q ; b];
x = linsolve(U,v);

xstar_exact = x(1:n);
pstar_exact = f(xstar_exact);

fprintf('pstar computed by linsolve  = %2.6f \n', pstar_exact)

% solving the problem using projected gradiend descent method

x0 = zeros(n,1); %initial point
project = @(x) x - A'/(A*A')*(A*x-b); %projection function
epsilon = 0.00001; 
eigmax = eigs(P,1);
[iter ,pstar_pgd] = projected_gradient_method(f,g,eigmax,project,x0,epsilon,pstar_exact);

fprintf('iter_number =%3d, pstar computed by projected gradient descent = %2.6f \n',iter, pstar_pgd)
