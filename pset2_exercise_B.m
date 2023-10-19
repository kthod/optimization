%%%%%%%%%%%%%%% i %%%%%%%%%%%%%%%%%%

n=4

A = randn(n,n);
[U,S,V] = svd(A);

u_1 = U*U'
u_2 = U'*U

%%%%%%%%%%%%%%% ii %%%%%%%%%%%%%%%%%%
lmin =1;

lmax =1;

z = lmin +(lmax -lmin)*rand(n-2,1);
eig_P = [lmin;lmax;z];
L=diag(eig_P);

%%%%%%%%%%%%%%% iii %%%%%%%%%%%%%%%%%%
P = U'*L*U

q = rand(n,1)

f=@(x) 1/2*x'*P*x +q'*x;

x0 = -1*P\q;
pstar= f(x0)

%%%%%%%%%%%%%%% iv %%%%%%%%%%%%%%%%%%


cvx_begin
    variable x(n)
    minimize( f(x) )
    
cvx_end
%%%%%%%%%%%%%%% v %%%%%%%%%%%%%%%%%%
g=@(x)P*x +q;
s=1;
alpha=0.2;
beta=0.5;
epsilon=0.01;
x_rand = rand(n,1)
[x_backtrack,fun_val_backtrack,iter_backtrack]=gradient_method_backtracking(f,g,x_rand,s,alpha,beta,epsilon);
[x_exact,fun_val_exact,iter_exact]=gradient_method_exact(f,g,x_rand,P,epsilon);

fprintf('iter_number for backtrcking = %3d  fun_val = %2.6f \n',iter_backtrack,fun_val_backtrack(:,end))
fprintf('iter_number for exact line searching = %3d  fun_val = %2.6f \n',iter_exact,fun_val_exact(:,end))
%%%%%%%%%%%%%%% vi %%%%%%%%%%%%%%%%%%
%creating x axis for contour plot around x*
x1 = [x(1,end)-1:0.1:x(1,end)+1];
x2 = [x(2,end)-1:0.1:x(2,end)+1];
con= zeros(length(x1));

if (n==2) 
for ii=1:length(x1)
    for jj=1:length(x1)
            con(ii,jj) = f([x1(ii);x2(jj)]);  % function f
                                            
    end
end
end
figure(1)
contour(x1, x2, con,'LevelList',fun_val_backtrack),xlabel('x1'), ylabel('x2'),  title('Level sets of the function') ;hold on;
 
 plot(x_backtrack(1,:),x_backtrack(2,:),'r+-'); hold on;
 plot(x_exact(1,:),x_exact(2,:),'b+-')
 legend('f(x_k) level values for backtracking','backtracking line search', 'exact line search')
%for i = 1:length(x(1,:))
%     plot(x(1,i),x(2,i), '-r+', 'LineWidth', 2, 'MarkerSize', 5)
% end


%%%%%%%%%%%%%%% vii %%%%%%%%%%%%%%%%%%
figure(2)
l_backtrack = log(fun_val_backtrack - pstar);
l_exact = log(fun_val_exact - pstar);
plot([1:length(fun_val_backtrack)],l_backtrack,'r');hold on
plot([1:length(fun_val_exact)],l_exact,'b') ,xlabel('k'), ylabel('log(f(x_k) - p_*)'),  title('exact line searching vs backtracking comparison for K=',num2str(lmax/lmin));
legend('backtracking line search', 'exact line search')


%%%%%%%%%%%%%%% viii %%%%%%%%%%%%%%%%%%

k = lmax/lmin * log((f(x_rand) - pstar)/epsilon)

