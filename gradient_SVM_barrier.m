function grad = gradient_SVM_barrier( w, X_augm, y, t )
% method to calculate the gradient of g function on point w
% g = t f_0(w) + phi
% grad = tw + sum(y(i)/(1 - y(i)w'X(i))X(i) 
% 
%ARGUMENTS
%============================================================
% w ........ unknown variable
% X_augm ... vector which includes the samples (X(i))
% y ........ labels of the samples
% t ........ barrier method parametre
%============================================================
% returns the gradient of g

N = length(y); 
n = length(w);
sum = zeros(n,1);
for i = 1:N
    sum = sum + y(i)/(1 - y(i)*w'*X_augm(:,i))*X_augm(:,i);
end    


grad = t*w + sum;