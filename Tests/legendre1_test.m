% test how fine differentiation work
n=100; % fixed do not change
x=1:10;

cos_theta=cos(x);
res=legendre1(n, cos_theta);
y1=res(n, :);
y2=legendre(n, cos_theta);
y2=y2(2,:);
eps=1e-8;
disp(mean(abs((y1-y2)./y1)));
assert(mean(abs((y1-y2)./y1))<eps);
disp("legendre1 works correct!");