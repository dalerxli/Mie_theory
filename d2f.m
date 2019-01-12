function r = d2f(f, x, eps)
    if(nargin<3)
        eps=1e-5;
    end
    r=(f(x+eps)-2*f(x)+f(x-eps))/(eps^2);
end