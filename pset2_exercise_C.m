%%%%%%%%%%%%%%%%%%% (a) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n = 2
m = 20
c = rand(n,1);
b = rand(m,1);
A = randn(m,n);

f =@(x) c'*x -sum(log(b-A*x)); 


cvx_begin
    variable x(n)
    minimize( f(x) )
cvx_end

pstar = f(x)
%%%%%%%%%%%%%%%%%%% (b) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

x1 = [x(1,1)-0.5:0.1:x(1,1)+0.5];
x2 = [x(2,1)-0.5:0.1:x(2,1)+0.5];
f_x= zeros(length(x1));

if (n==2) 
for ii=1:length(x1)
    for jj=1:length(x1)
            if (all(b-A*[x1(ii);x2(jj)]>0))
                f_x(ii,jj) = f([x1(ii);x2(jj)]);  % function f
            else
                f_x(ii,jj) = 10^3;
            end
         

    end
end
end
figure(1)
mesh(x1, x2, f_x),xlabel('x1'), ylabel('x2'),  title('plot of the function') ;
figure(2)
contour(x1, x2, f_x),xlabel('x1'), ylabel('x2'),  title('Level sets of the function') ;
 %%%%%%%%%%%%%%%%%%% (c) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g=@(x) calc_grad_f(c,b,A,m,x);



s=1;
alpha=0.2;
beta=0.5;
epsilon=0.01;
[x,fun_val_gradient,iter]=alternative_gradient_method_backtracking(f,g,zeros(n,1),s,alpha,beta,epsilon,A,b);


fprintf('iter_number for gradient = %3d  fun_val_gradient = %2.6f \n',iter,fun_val_gradient(:,end))
 %%%%%%%%%%%%%%%%%%% (d) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
H=@(x) calc_Hessian_f(b,A,m,x);

[x,fun_val_newton,iter]=Newton_algorithm(f,g,H,zeros(n,1),s,alpha,beta,epsilon,A,b);


fprintf('iter_number for newton = %3d  fun_val_newton = %2.6f \n',iter,fun_val_newton(:,end))

 %%%%%%%%%%%%%%%%%%% (e) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 figure()
 semilogy ( [ 1:length(fun_val_gradient)],fun_val_gradient - pstar,'r'),  title('semilog of f(x_k) - p_* for gradient descent') ;hold on;
 semilogy ( [ 1:length(fun_val_newton)],fun_val_newton - pstar,'b'),  title('semilog of f(x_k) - p_* for Newton algorithm')
 legend('gradient descent', 'newton algorithm')
 