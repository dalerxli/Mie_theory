n=10; % fixed do not change
x=1;

cos_theta=cos(x);
sin_theta=sin(x);

y1=tau_(n, cos_theta, sin_theta, pi_(n, cos_theta, sin_theta));
y1=y1(n, :);
y2=tau_cos(n, x);
eps=1e-8;
disp(mean(abs((y1-y2)./y1)));
assert(mean(abs((y1-y2)./y1))<eps);
disp("tau_ works correct!");
%plottau(5);

function r=tau_cos(n, theta)
    % n must be scalar
    r=-df(@(t) fff(n, t), theta);
    r(abs(theta)<1e-7)=n*(n+1)/2;
end

function r=fff(n, theta)
    s=size(theta);
    theta=reshape(theta, [1 numel(theta)]);
    r=legendre(n, cos(theta));
    r=r(2,:);
    r=reshape(r, s);
end

function plottau(n)
    theta=-4:0.0001:2*4;
    cos_theta=cos(theta);
    sin_theta=sin(theta);
    y1=tau_(n, cos_theta, sin_theta, pi_(n, cos_theta, sin_theta));
    y1=y1(n, :);
    plot(theta, y1);
end
