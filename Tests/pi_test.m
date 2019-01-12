% test how fine differentiation work
n=10000; % fixed do not change
x=10;

cos_theta=cos(x);
sin_theta=sin(x);

y1=pi_(n, cos_theta, sin_theta);
y1=y1(n, :);
y2=pi_cos(n, x);
eps=1e-8;
disp(mean(abs((y1-y2)./y1)));
assert(mean(abs((y1-y2)./y1))<eps);
disp("pi_ works correct!");
%plotpi(2);


function r=pi_cos(n, theta)
    % n is scalar
    s=size(theta);
    theta=reshape(theta, [1 numel(theta)]);
    r=legendre(n, cos(theta));
    r=r(2,:);
    r=r./sin(theta);
    r(abs(theta)<1e-7)=n*(n+1)/2;
    r=reshape(r, s);
end

function plotpi(n)
    theta=-pi:0.0001:2*pi;
    cos_theta=cos(theta);
    sin_theta=sin(theta);
    y1=pi_(n, cos_theta, sin_theta);
    y1=y1(n, :);
    polarplot(theta, y1);
end