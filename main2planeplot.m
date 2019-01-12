
[~, phii1]=min(abs(phi-phi0));
[~, phii2]=min(abs(phi-pi-phi0));

[ThetaP, RP]=meshgrid(theta, r);
PhiP=zeros(size(ThetaP));
[~, rborderi]=min(abs(r-particle_r));

ExP=(Ex_inc+Ex_sc);
%ExP=Ex_inc;
ExP(1:rborderi,:,:)=Ex_in(1:rborderi,:,:);


EyP=(Ey_inc+Ey_sc);
%ExP=Ex_inc;
EyP(1:rborderi,:,:)=Ey_in(1:rborderi,:,:);

EthetaP=(Etheta_inc+Etheta_sc);
EthetaP(1:rborderi,:,:)=Etheta_in(1:rborderi,:,:);
EphiP=(Ephi_inc+Ephi_sc);
EphiP(1:rborderi,:,:)=Ephi_in(1:rborderi,:,:);
HphiP=(Hphi_inc+Hphi_sc);
HphiP(1:rborderi,:,:)=Hphi_in(1:rborderi,:,:);
HyP=(Hy_inc+Hy_sc);
HyP(1:rborderi,:,:)=Hy_in(1:rborderi,:,:);
ErP=(Er_inc+Er_sc);
ErP(1:rborderi,:,:)=Er_in(1:rborderi,:,:);


[X1, Y1, Z1]=sph2cart(PhiP, pi/2-ThetaP, RP);
[X2, Y2, Z2]=sph2cart(PhiP+pi, pi/2-ThetaP, RP);
fig=figure;
s1=surf(X1,Y1,Z1,squeeze(real(ExP(:, :, phii1))));
hold on;
s2=surf(X2,Y2,Z2,squeeze(real(ExP(:, :, phii2))));
shading flat;
colormap jet;
colorbar;
view(0,0);

ax=caxis;
caxis(ax)


for i=1:300
    t=i/6;
    s1.CData=real(ExP(:, :, phii1)*exp(-1i*omega*t));
    s2.CData=real(ExP(:, :, phii2)*exp(-1i*omega*t));
    pause(0.00);
end