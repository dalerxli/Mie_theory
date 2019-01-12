function [a, b, c, d]=coeffs_(x, y, eps)
    % pairs [a b] and [c d] have different sizes
    % because series with them converge at different speed
    nlim=30000;
    if(nargin<3)
        eps=1e-20;
    end
    nmin=1;
    nmax=10;
    mult=1.5;
    
    m=y/x;
    a=[];
    b=[];
    c=[];
    d=[];
    isabstop=false;
    iscdstop=nargout<=2;
    isabconverged=false;
    iscdconverged=false;
    
    while((~isabstop || ~iscdstop) && nmin<nlim)
        
        psix=RBS((nmin:nmax)', x);
        psiy=RBS((nmin:nmax)', y);
        xix=RBXi((nmin:nmax)', x);
        dpsix=df(@(x) RBS((nmin:nmax)', x), x);
        dpsiy=df(@(y) RBS((nmin:nmax)', y), y);
        dxix= df(@(x) RBXi((nmin:nmax)', x), x);
        denom_ad=          dpsiy.*xix -m*psiy.*dxix;
        denom_bc=        m*dpsiy.*xix -  psiy.*dxix;
        
        if(~isabstop)
            a=[a; zeros(nmax-nmin+1, 1)];  %#ok
            b=[b; zeros(nmax-nmin+1, 1)];  %#ok
            a(nmin:nmax) =   (  dpsiy.*psix-m*psiy.*dpsix)./denom_ad;
            b(nmin:nmax) =   (m*dpsiy.*psix-  psiy.*dpsix)./denom_bc;
            
            abrem=find(isnan(a) | isnan(b), 1 );
            if(numel(abrem)>0)
                a=a(1:abrem-1);
                b=b(1:abrem-1);
                isabstop=true;
            end
            isabconverged= abs(a(end)/a(1))<eps && abs(b(end)/b(1))<eps;
            if(isabconverged); isabstop=true; end
        end
        if(~iscdstop && nargout>2)
            c=[c; zeros(nmax-nmin+1, 1)];  %#ok
            d=[d; zeros(nmax-nmin+1, 1)];  %#ok
            nom_cd=        (m*dpsix.*xix -m*psix.*dxix);
            c(nmin:nmax)=nom_cd./denom_bc;
            d(nmin:nmax)=nom_cd./denom_ad;
            
            cdrem=find(isnan(c) | isnan(d), 1 );
            if(numel(cdrem)>0)
                c=c(1:cdrem-1);
                d=d(1:cdrem-1);
                iscdstop=true;
            end
            iscdconverged= abs(c(end)/c(1))<eps && abs(d(end)/d(1))<eps;
            if(iscdconverged); iscdstop=true; end
        end
        
        nmin=nmax+1;
        nmax=round(nmax*mult);
    end
    
    if(~isabconverged || (~iscdconverged && nargout>2))
        warning('Series coefficients did not converge');
    end
end