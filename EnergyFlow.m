function E=EnergyFlow(Ex, Ey, Ez, Hx, Hy, Hz, r, theta, phi, r0)
    if(iscolumn(phi))
        phi=phi';
    end
    if(iscolumn(theta))
        theta=theta';
    end
    
    [~, ri]=min(abs(r-r0));
    Ex=squeeze(Ex(ri, :, :));
    Ey=squeeze(Ey(ri, :, :));
    Ez=squeeze(Ez(ri, :, :));
    Hx=squeeze(Hx(ri, :, :));
    Hy=squeeze(Hy(ri, :, :));
    Hz=squeeze(Hz(ri, :, :));
    [Px, Py, Pz]=Poynting(Ex, Ey, Ez, Hx, Hy, Hz);
    [Phi, Theta]=meshgrid(phi, theta);
    R=ones(size(Theta));
    [nx, ny, nz]=sph2cart(Phi, pi/2-Theta, R);
    dphi=[phi(2)-phi(1) (phi(3:end)-phi(1:end-2))/2 phi(end)-phi(end-1)];
    dcos_theta=-[cos(theta(2))-cos(theta(1)) (cos(theta(3:end))-cos(theta(1:end-2)))/2 cos(theta(end))-cos(theta(end-1))];
    dS=r0^2*dcos_theta'*dphi;
    E=sum(sum((Px.*nx+Py.*ny+Pz.*nz).*dS));
    
end