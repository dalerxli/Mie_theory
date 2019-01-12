function [Er, Etheta, Ephi,...
          Hr, Htheta, Hphi] =...
          field_(r, theta, phi, k, mu, omega, a, b, upindex)
    % returns EM-field
    % Incident wave is linear-polarized, 
    % has E vector along x-axis, H vector along y axis
    % Ex_inc=exp(-i(k*z-omega*t))
    % Hy_inc=exp(-i(k*z-omega*t))
    % and amplitudes exactly 1
    % k is a wave vector in 1/mkm
    % nmax is number of members in infinite sum
    assert(isvector(r), 'r must be vector');
    assert(isvector(theta), 'theta must be vector');
    assert(isvector(phi), 'phi must be vector');
    
    nmax=numel(a);
    [COS_phi, SIN_phi, sin_theta,...
     pi_n, tau_n,...
     z_n, drhoz_divrho_n, rho_inv]=MN_prep(nmax, r*k, theta, phi, upindex);
    N=(1:nmax)';
    ic=(zeros(nmax, 1)+1i).^N;  % imaginary i coefficients
    sc=(2*N+1)./(N.*(N+1)).*ic;
 
    s=[numel(r) numel(theta) numel(phi)];
    Er=zeros(s);
    Etheta=zeros(s);
    Ephi=zeros(s);
    Hr=zeros(s);
    Htheta=zeros(s);
    Hphi=zeros(s);
    fprintf('%5.2f', 0);
    fprintf('%%');
    for n=1:nmax
       [Mo_theta, Mo_phi,...
        Me_theta, Me_phi,...
        No_r, No_theta, No_phi,...
        Ne_r, Ne_theta, Ne_phi]=...
            MN(n, COS_phi, SIN_phi, sin_theta,...
                  pi_n, tau_n,...
                  z_n, drhoz_divrho_n, rho_inv);
       Er=Er+sc(n)*(0-1i*b(n)*Ne_r);
       Etheta=Etheta+sc(n)*(a(n)*Mo_theta-1i*b(n)*Ne_theta);
       Ephi=Ephi+sc(n)*(a(n)*Mo_phi-1i*b(n)*Ne_phi);
       
       Hr=Hr+sc(n)*(0+1i*a(n)*No_r);
       Htheta=Htheta+sc(n)*(b(n)*Me_theta+1i*a(n)*No_theta);
       Hphi=Hphi+sc(n)*(b(n)*Me_phi+1i*a(n)*No_phi);
       fprintf('\b\b\b\b\b\b');
       fprintf('%5.2f', n/nmax*100);
       fprintf('%%');
    end
    fprintf('\n');
    Hr=Hr*(-k/omega/mu);
    Htheta=Htheta*(-k/omega/mu);
    Hphi=Hphi*(-k/omega/mu);
end

