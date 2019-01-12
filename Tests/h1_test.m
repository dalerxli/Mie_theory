% test how fine differentiation work

h1=@(n, x) (-1i).^n.*exp(1i*x)./(1i*x);  % asymptotes
h2=@(n, x) -(1i).^n.*exp(-1i*x)./(1i*x);
n=5:10;
x=1000000;

y2=h1(n, x);
eps=1e-4;
y1=h1_(n, x);
disp(mean(abs((y1-y2)./y1)));
assert(mean(abs((y1-y2)./y1))<eps);
disp("h1_ works correct!");