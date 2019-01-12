function r=RBZeta(n, z)
    % Riccati–Bessel Zeta function
    % If nu and Z are arrays of the same size, the result is also that size. 
    % If either input is a scalar, it is expanded to the other input's size.
   r=sqrt(pi*z/2).*besselh(n+0.5,2,z);
end