%          1     2      3     4     5    6    7   8     9    10    11    12
X=     [0.05;    1;    50;   50; 1000;  50;  50;  1; 0.05; 0.05;0.001; 0.05];
M1=    [0.05; 0.05; 0.001; 0.05; 0.05;   1;  50; 50; 5000;   50;   50;    1];

M=M1+1;

for i=1:length(X)
    x=X(i);
    m=M(i);
    y=m*x;
    
    [a, b, c, d]=coeffs_(x, y);
    Q=Q_diss(x, a, b);
    [Q_test, s]=Q_specialcase(x, m);
    
    err=abs((Q-Q_test)/Q);
    err=Q/Q_test;
    disp("Q = " + num2str(Q, '%6.3e')+"; "+...
         "Q test = "+num2str(Q_test, '%6.3e')+"; "+...
         "Tradeoff = "+num2str(err, '%7.1f')+"; "+...
         "Case: "+s);
    assert(0.1<err & err<1.2, 'Q works incorrectly');
     
end

disp('Q works correct!');