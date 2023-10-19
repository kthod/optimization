function H = calc_Hessian_f(b,A,m,x)
    temp=zeros(length(x));
    for i = 1:m
        temp = temp+ 1/((b(i)-A(i,:)*x)^2)*A(i,:)'*A(i,:);
    end
    
    H = temp;
end