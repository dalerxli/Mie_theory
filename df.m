function r = df(f, x, eps)
    if(nargin<3)
        eps=1e-5;
    end
    r=(f(x+eps)-f(x-eps))/(2*eps);
end

