lambda= 0.532;
m=1.33+1i*1e-8;      % complex refraction index
mu=1;
omega=1;
k=2*pi/lambda;


r=(lambda/10000:lambda/10:lambda*8)';
theta=(0:pi/30:pi)';
phi=(0.0:2*pi/5:2*pi);


nmax=500;
[Er_inc, Etheta_inc, Ephi_inc,...       use this to test field_ function
 Hr_inc, Htheta_inc, Hphi_inc] =...
          field_(r, theta, phi, k, mu, omega, ones(nmax,1), ones(nmax,1), 1); 
[COS_theta, SIN_theta,...
 COS_phi, SIN_phi] = sph2cart_vector_prep(theta, phi, numel(r));
[Ex_inc, Ey_inc, Ez_inc]=sph2cart_vector(Er_inc, Etheta_inc, Ephi_inc, ...
                             COS_theta, SIN_theta, COS_phi, SIN_phi);

Ex_inc2=repmat(exp(1i*k*r*cos(theta')),1,1,numel(phi));
      
eps=1e-7;
disp(max(max(max(abs((Ex_inc-Ex_inc2)./Ex_inc2)))));
assert(max(max(max(abs((Ex_inc-Ex_inc2)./Ex_inc2))))<eps);
disp("field_ works correct!");