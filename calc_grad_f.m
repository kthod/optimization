function g = calc_grad_f(c,b,A,m,x)
    temp=c;
    for i = 1:m
        temp = temp+ 1/(b(i)-A(i,:)*x)*A(i,:)';
    end
    
    g = temp;
end