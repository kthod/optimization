function Hess = Hess_SVM_barrier( w, X_augm, y, t )
% method to calculate the Hessian of g function on point w
% g = t f_0(w) + phi
% Hess = tI + sum(1/(y(i)w'X(i)-1)^2 X(i)X(i)' 
% 
%ARGUMENTS
%============================================================
% w ........ unknown variable
% X_augm ... vector which includes the samples (X(i))
% y ........ labels of the samples
% t ........ barrier method parametre
%============================================================
% returns the Hessian of g

N = length(y);  
n = length(w);
sum = zeros(n);
for i = 1:N
    sum = sum + 1/(((y(i)*w'*X_augm(:,i)) - 1)^2)*X_augm(:,i)*(X_augm(:,i))';
end    


Hess = t*eye(n) + sum;