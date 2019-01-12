% test how fine differentiation work
n=3; % fixed do not change
x=1:1000;
j3=@(x) (15./x.^3-6./x).*sin(x)./x-(15./(x.^2)-1).*cos(x)./x;

eps=1e-8;
y=j_(n, x);
disp(mean(abs((y-j3(x))./y)));
assert(mean(abs((y-j3(x))./y))<eps);
disp("j_ works correct!");