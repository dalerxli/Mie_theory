function r=S1(theta, a, b)
    nmax=length(a);
    r=zeros(size(theta));
    for n=1:nmax
        r=r+(2*n+1)/(n*(n+1))*...
            (a(n)*pi_cos(n, theta)+b(n)*tau_cos(n, theta));
    end
end