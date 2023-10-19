function g = barrier_SVM_cost_function( w, X_augm, y, t )
% method to calculate the function g on point w 
% g = t f_0(w) + phi = t 1/2 ||w||^2 - log(-(1- y(i)w'X(i)))
%  
%ARGUMENTS
%============================================================
% w ........ unknown variable
% X_augm ... vector which includes the samples (X(i))
% y ........ labels of the samples
% t ........ barrier method parametre
%============================================================
% returns the function g

N = length(y);   
sum = 0;
for i = 1:N
    sum = sum + log(y(i)*w'*X_augm(:,i) -1) ;
end    
g = t*1/2*norm(w)^2 - sum; 