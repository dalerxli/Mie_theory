if(isrow(r))
    r=r';
end
if(iscolumn(theta))
    theta=theta';
end
if(iscolumn(phi))
    phi=phi';
end

I=1:round(numel(theta)/2);
energyflow_inc=EnergyFlow(Ex_inc(:,I,:),Ey_inc(:,I,:),Ez_inc(:,I,:),Hx_inc(:,I,:),Hy_inc(:,I,:),Hz_inc(:,I,:), r, theta(I), phi, particle_r);
energyflow_in= EnergyFlow(Ex_in, Ey_in, Ez_in, Hx_in, Hy_in, Hz_in, r, theta, phi, particle_r);
energyflow_sc= EnergyFlow(Ex_sc, Ey_sc, Ez_sc, Hx_sc, Hy_sc, Hz_sc, r, theta, phi, particle_r);

Q1=abs(energyflow_sc/energyflow_inc);
Q2=Q_diss(x, a, b);


[~, ri]=min(abs(r-particle_r));
I=1:ri;
energy_inc=Energy(Ex_inc(I,:,:),Ey_inc(I,:,:),Ez_inc(I,:,:),Hx_inc(I,:,:),Hy_inc(I,:,:),Hz_inc(I,:,:), r(I), theta, phi);
energy_in=Energy(Ex_in(I,:,:),Ey_in(I,:,:),Ez_in(I,:,:),Hx_in(I,:,:),Hy_in(I,:,:),Hz_in(I,:,:), r(I), theta, phi);