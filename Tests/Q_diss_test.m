function Q = Q_diss_test(x, a, b)
    i1=@(theta) abs(S1(theta, a, b)).^2;
    i2=@(theta) abs(S2(theta, a, b)).^2;
    Q=integral(@(t)1/x^2*(i1(t)+i2(t)).*sin(t), 0, pi);
end