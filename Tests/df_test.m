% test how fine differentiation work
n=5;
x=1000;
f=@(x) RBS(n, x);

eps=1e-8;
y=integral(@(x) df(@(x) f(x), x), 0, x)+f(0);
disp(abs((y-f(x))./y));
assert(mean(abs((y-f(x))./y))<eps);
disp("Differentiation works correct!");