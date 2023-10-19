%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   EXERCISE 5(C)   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x = [0:0.1:10];
a=0.5
f_x = x.^a;

plot (x,f_x),xlabel('x'), ylabel('f(x)'),title('f(x) for 0<a<1');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   EXERCISE 5(D)   %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x0=rand(2,1);


x1 = [x0(1,1)-10:0.1:x0(1,1)+10];
x2 = [x0(2,1)-10:0.1:x0(2,1)+10];
f1= zeros(length(x1));
f2= zeros(length(x1));
for ii=1:length(x1)
    for jj=1:length(x1)
            f1(ii,jj) = norm([x1(ii);x2(jj)]);  
            f2(ii,jj) = norm([x1(ii);x2(jj)])^2; 
                                            
    end
end
figure(4)
mesh(x1, x2,f1),xlabel('x1'), ylabel('x2'), zlabel('f_1(x1,x2)'),title('f_1=|x|_2'), hold on;
figure(5)
mesh(x1, x2,f2),xlabel('x1'), ylabel('x2'), zlabel('f_2(x1,x2)'),title('f_2=|x|_2^2'),hold on;



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%   EXERCISE 6     %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
A =rand(3,2);
x0=rand(2,1);
dt = 0
e =[dt;dt;dt];
b = A*x0 + e;

x1 = [x0(1,1)-10:0.1:x0(1,1)+10];
x2 = [x0(2,1)-10:0.1:x0(2,1)+10];
f= zeros(length(x1));

for ii=1:length(x1)
    for jj=1:length(x1)
            f(ii,jj) = norm(A*[x1(ii);x2(jj)] -b)^2;  % function f
                                            % Second-order Taylor around [x_01; x_02]
    end
end
figure(2)
mesh(x1, x2,f),xlabel('x1'), ylabel('x2'), zlabel('f(x1,x2)'), hold on;
plot(x0(1,1),x0(2,1), 'r+', 'LineWidth', 2, 'MarkerSize', 10)
figure(3)
contour(x1, x2, f),xlabel('x1'), ylabel('x2'),  title('Level sets of the function'),
hold on;
plot(x0(1,1),x0(2,1), 'r+', 'LineWidth', 2, 'MarkerSize', 10)
%axis([-5 5 -5 5])