function [Mo_theta, Mo_phi,...
          Me_theta, Me_phi,...
          No_r, No_theta, No_phi,...
          Ne_r, Ne_theta, Ne_phi]=...
                MN(n, COS_phi, SIN_phi, sin_theta,...
                      pi_n, tau_n,...
                      z_n, drhoz_divrho_n, rho_inv)
    s=size(COS_phi);
    srho=s(1);
    stheta=s(2);
    sphi=s(3);
    
    
    ZPI_n=repmat((z_n(n,:)')*pi_n(n,:),1,1,sphi);
    ZTAU_n=repmat((z_n(n,:)')*tau_n(n,:),1,1,sphi);
    ZPISIN_theta_divrho_n=...
        repmat(((z_n(n,:).*rho_inv)')*(pi_n(n,:).*sin_theta), 1,1,sphi);
    dRHOZPI_divrho_n=...
        repmat((drhoz_divrho_n(n,:)')*pi_n(n,:), 1,1,sphi);
    dRHOZTAU_divrho_n=...
        repmat((drhoz_divrho_n(n,:)')*tau_n(n,:), 1,1,sphi);
    
    Mo_theta=COS_phi.*ZPI_n;
    Mo_phi=-SIN_phi.*ZTAU_n;
    
    Me_theta=-SIN_phi.*ZPI_n;
    Me_phi=-COS_phi.*ZTAU_n;
    
    No_r=n*(n+1)*SIN_phi.*ZPISIN_theta_divrho_n;
    No_theta=SIN_phi.*dRHOZTAU_divrho_n;
    No_phi=COS_phi.*dRHOZPI_divrho_n;
    
    Ne_r=n*(n+1)*COS_phi.*ZPISIN_theta_divrho_n;
    Ne_theta=COS_phi.*dRHOZTAU_divrho_n;
    Ne_phi=-SIN_phi.*dRHOZPI_divrho_n;
    
end
