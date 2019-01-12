rplot=particle_r;
[~, ri]=min(abs(r-rplot));
[PhiP, ThetaP]=meshgrid(phi, theta);
RP=zeros(size(ThetaP))+rplot;

[X, Y, Z]=sph2cart(PhiP, pi/2-ThetaP, RP);
figure;
surf(X,Y,Z,real(squeeze(real(Ez_in(ri, :, :)))));
shading interp;
colorbar;
