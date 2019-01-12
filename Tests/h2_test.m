% test how fine differentiation work
n=20; % fixed do not change
x=1:1000;

y2=j_(n, x)+1i*(-1)^n*j_(-n-1, x);
eps=1e-8;
y1=h2_(n, x);
disp(mean(abs((y1-y2)./y1)));
assert(mean(abs((y1-y2)./y1))<eps);
disp("h2_ works correct!");