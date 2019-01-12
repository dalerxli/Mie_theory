function [COS_phi, SIN_phi, sin_theta,...
          pi_n, tau_n,...
          z_n, drhoz_divrho_n, rho_inv]=...
                MN_prep(nmax, rho, theta, phi, upindex)
    assert(isvector(rho) &...
           isvector(theta) &...
           isvector(phi), 'rho, theta and phi must be vectors');
    
    if(iscolumn(theta)); theta=theta'; end
    if(iscolumn(phi)); phi=phi'; end
    if(iscolumn(rho)); rho=rho'; end
    if(upindex==1)
        z_=@(n, rho) j_(n, rho);
    elseif(upindex==3)
        z_=@(n, rho) h1_(n, rho);
    end
    
    cos_theta=cos(theta);
    sin_theta=sin(theta);
    cos_phi=cos(phi);
    sin_phi=sin(phi);
    pi_n=pi_(nmax, cos_theta, sin_theta);
    tau_n=tau_(nmax, cos_theta, sin_theta, pi_n);
    z_n=zeros(nmax, numel(rho));
    drhoz_divrho_n=zeros(nmax, numel(rho));
    rho_inv=1./rho;
    for i=1:nmax
        z_n(i,:)=z_(i, rho);
        drhoz_divrho_n(i,:)=df(@(rho) rho.*z_(i, rho), rho).*rho_inv;
    end
    COS_phi=repmat(permute(cos_phi, [3 1 2]), numel(rho), numel(theta));
    SIN_phi=repmat(permute(sin_phi, [3 1 2]), numel(rho), numel(theta));
          
end