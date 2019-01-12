function [Q, scase]=Q_specialcase(x, m)
    % this function returns Q factor for some special cases;
    % It is used to test definite calculations;
    % m must be real
    
    if(~isreal(m))
        scase='Not a special case';
        Q=NaN;
        return;
    end
    
    % determine case:
    % 2 means big, 1 means small, 0 means any
    bx=(x<=0.1)+(x>=10)*2;
    bm=((m-1)<0.1)+((m-1)>10)*2;
    bxm=(x*(m-1)<0.1)+(x*(m-1)>10)*2;
    c=bx*100+bm*10+bxm;
    switch c
        case {111, 011}
            scase= 'Rayleigh - Hans area';
            Q=((m-1)^2)*(x^4)*32/27;
        case {211, 210}
            scase= 'Anomal difraction';
            Q=2*((m-1)^2)*(x^2);
        case {212, 202}
            scase=  'Big balls';
            Q=2;
        case {222, 022}
            scase='Complete reflection';
            Q=2;
        case {122, 120}
            scase= 'Optical resonance';
            Q=10/3*x^4;
        case {121, 101}
            scase= 'Rayleigh dissipation';
            Q=8/3*x^4;
        otherwise
            scase='Not a special case';
            Q=NaN;
    end
end