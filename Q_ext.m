function Q = Q_ext(x, a, b)
    N=(1:length(a))';
    if(size(a, 2)>size(a, 1))
        N=N';
    end
    Q=2/x^2*sum((2*N+1).*real(a+b));
end