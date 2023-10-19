function flag = point_is_feasible(w_new, X_augm, y)
% method to check if w_new point is feasible by checking whether the
% inequality
% 1 - y(i)w'X(i) < = 0 
% is satisfied for every X(i) , y(i)
%ARGUMENTS
%============================================================
% w ........ unknown variable
% X_augm ... vector which inccludes the samples (X(i))
% y ........ labels of the samples
%============================================================
% returns flag which is 1 if all constraints are satisfied and 0 if at
% least one constraint is violated
% 
N = length(y);
flag = 1 ; 
for i = 1:N
    if (  1 - y(i)*(w_new'*X_augm(:,i)) > 0  )
        flag = 0;
    end
end