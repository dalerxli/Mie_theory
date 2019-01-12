function E=Energy(Ex, Ey, Ez, Hx, Hy, Hz, r, theta, phi)
    if(iscolumn(r))
        r=r';
    end
    if(iscolumn(phi))
        phi=phi';
    end
    if(iscolumn(theta))
        theta=theta';
    end
    
    Ex=abs(Ex);
    Ey=abs(Ey);
    Ez=abs(Ez);
    Hx=abs(Hx);
    Hy=abs(Hy);
    Hz=abs(Hz);
    
    E_=(Ex.^2+Ey.^2+Ez.^2+Hx.^2+Hy.^2+Hz.^2)/(16*pi);
    
    dphi=[phi(2)-phi(1) (phi(3:end)-phi(1:end-2))/2 phi(end)-phi(end-1)];
    dcos_theta=-[cos(theta(2))-cos(theta(1)) (cos(theta(3:end))-cos(theta(1:end-2)))/2 cos(theta(end))-cos(theta(end-1))];
    dR3=[r(2)^3-r(1)^3 (r(3:end).^3-r(1:end-2).^3)/2 r(end).^3-r(end-1).^3];
    dR3cos_theta=dR3'*dcos_theta;
    dV=repmat(dR3cos_theta,1,1,numel(phi)).*repmat(permute(dphi, [1 3 2]), numel(r), numel(theta), 1)/3;
    
    E=sum(sum(sum(E_.*dV)));
    
end