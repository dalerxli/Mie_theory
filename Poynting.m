function [Px, Py, Pz]=Poynting(Ex, Ey, Ez, Hx, Hy, Hz)
    phix=angle(Ex);
    phiy=angle(Ey);
    phiz=angle(Ez);
    psix=angle(Hx);
    psiy=angle(Hy);
    psiz=angle(Hz);
    Ex=abs(Ex);
    Ey=abs(Ey);
    Ez=abs(Ez);
    Hx=abs(Hx);
    Hy=abs(Hy);
    Hz=abs(Hz);
    Px=Ey.*Hz.*cos(phiy-psiz)/2-Ez.*Hy.*cos(phiz-psiy);
    Py=Ez.*Hx.*cos(phiz-psix)/2-Ex.*Hz.*cos(phix-psiz);
    Pz=Ex.*Hy.*cos(phix-psiy)/2-Ey.*Hx.*cos(phiy-psix);
end