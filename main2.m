lambda= 0.532;
m=1.33;      % complex refraction index
mu=1;
omega=1;
k=2*pi/lambda;
particle_r=0.1;        % radius in mkm
x=k*particle_r;
y=m*k*particle_r;
[a, b, c, d]=coeffs_(x, y);


% incident wave
%r=(particle_r/10000:lambda/8:particle_r*5)';
r=(particle_r/10000:particle_r/20:particle_r*13)';
%r=(particle_r-particle_r/10:particle_r/100:particle_r+particle_r/10)';
theta=(0:pi/300:pi)';
phi=(0.0:2*pi/100:2*pi);
phi0=pi/4;
phi=[pi/4 pi+pi/4];

disp("Calculating incident field");
nmax=200;
[Er_inc, Etheta_inc, Ephi_inc,...       
 Hr_inc, Htheta_inc, Hphi_inc] =...
          field_(r, theta, phi, k, mu, omega, ones(nmax,1), ones(nmax,1), 1); 


disp("Calculating inner field");
[Er_in, Etheta_in, Ephi_in,...
 Hr_in, Htheta_in, Hphi_in] =...
          field_(r, theta, phi, k, mu, omega, c, d, 1);
      
disp("Calculating scattered field");
[Er_sc, Etheta_sc, Ephi_sc,...
 Hr_sc, Htheta_sc, Hphi_sc] =...
          field_(r, theta, phi, k, mu, omega, -b, -a, 3);

      
[COS_theta, SIN_theta,...
 COS_phi, SIN_phi] = sph2cart_vector_prep(theta, phi, numel(r));
[Ex_inc, Ey_inc, Ez_inc]=sph2cart_vector(Er_inc, Etheta_inc, Ephi_inc, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
[Ex_in, Ey_in, Ez_in]=sph2cart_vector(Er_in, Etheta_in, Ephi_in, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
[Ex_sc, Ey_sc, Ez_sc]=sph2cart_vector(Er_sc, Etheta_sc, Ephi_sc, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
[Hx_inc, Hy_inc, Hz_inc]=sph2cart_vector(Hr_inc, Htheta_inc, Hphi_inc, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
[Hx_in, Hy_in, Hz_in]=sph2cart_vector(Hr_in, Htheta_in, Hphi_in, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
[Hx_sc, Hy_sc, Hz_sc]=sph2cart_vector(Hr_sc, Htheta_sc, Hphi_sc, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);
                          
main2planeplot;