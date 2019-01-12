m=1.33+1i*1e-8; % fixed
x=3;            % fixed 
y=m*x;
[a, b, c, d]=coeffs_(x, y);
atest=[5.1631e-1-1i*4.9973e-1;...       % fixed
       3.4192e-1-1i*4.7435e-1;...
       4.8467e-2-1i*2.1475e-1;...
       1.0346e-3-1i*3.2148e-2;...
       9.0375e-6-1i*3.0062e-3;];
btest=[7.3767e-1-1i*4.3990e-1;
       4.0079e-1-1i*4.9006e-1;
       9.3553e-3-1i*9.6269e-2;
       6.8810e-5-1i*8.2949e-3;
       2.8309e-7-1i*5.3204e-4;];
a=a(1:numel(atest));
b=b(1:numel(btest));

eps=1e-5;
disp(max(abs((a-atest)./a)));
assert(max(abs((a-atest)./a))<eps);
disp("coeffs_ works correct!");