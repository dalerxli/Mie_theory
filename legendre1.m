function res = legendre1(n, cos_theta)
    %LEGENDRE1 Summary of this function goes here
    % First associated Legendre polinom of n_th order
    assert(isrow(cos_theta), 'cos_theta must be row');
    res=zeros([n numel(cos_theta)]);
    
    for i=1:n
        if(i<=2)
            leg_n=legendre(i, cos_theta);
            res(i, :)=reshape(leg_n(2, :), size(cos_theta));
        else
            res(i,:)=((2*i-1).*cos_theta.*res(i-1,:)-i*res(i-2,:))/(i-1);
        end
    end
end