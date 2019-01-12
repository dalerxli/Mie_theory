function tau_n = tau_(n, cos_theta, sin_theta, pi_n)
    assert(isrow(cos_theta), 'cos theta must be row');
    tau_n=zeros(size(pi_n));
    tau_n(1,:)=cos_theta;
    N=(1:n)';
    N2=(2:n)';
    if(n>1)
        tau_n(2:end, :)=(N2*cos_theta).*pi_n(2:end, :)-repmat((N2+1), 1, numel(cos_theta)).*pi_n(1:end-1, :);
    end
    board=N.*(N+1)/2;
    eps=1e-7;
    if(sum(abs(sin_theta)<eps)>0)
        if(n>1); tau_n(2:2:n, abs(sin_theta)<eps)=repmat(board(2:2:n),1,sum(abs(sin_theta)<eps)); end
        tau_n(1:2:n, abs(sin_theta)<eps)=board(1:2:n)*cos_theta(abs(sin_theta)<eps);
    end
end