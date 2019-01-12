function pi_n = pi_(n, cos_theta, sin_theta)
    assert(isrow(cos_theta), 'cos and sin theta must be rows of same size');
    pi_n=-legendre1(n, cos_theta)./abs(sin_theta);
    N=(1:n)';
    board=N.*(N+1)/2;
    eps=1e-7;
    if(sum(abs(sin_theta)<eps)>0)
        if(n>1); pi_n(2:2:n, abs(sin_theta)<eps)=board(2:2:n)*cos_theta(abs(sin_theta)<eps); end
        pi_n(1:2:n, abs(sin_theta)<eps)=repmat(board(1:2:n),1,sum(abs(sin_theta)<eps));
    end
end