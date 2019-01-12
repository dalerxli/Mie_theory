% test how fine differentiation work
n=50;

x=8;
f=@(x) RBS(n, x);

eps=1e-5;
y=integral(@(x) mult_int(@(x) d2f(@(x) f(x), x), x), 0, x)+f(0)+x*df(f, 0);
disp(abs((y-f(x))./y));
assert(mean(abs((y-f(x))./y))<eps);
disp("Double differentiation works correct!");

function y=mult_int(f, x)
    y=zeros(size(x));
    for i=1:numel(x)
        y(i)=integral(f, 0, x(i));
    end
end