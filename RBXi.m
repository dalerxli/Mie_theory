function r=RBXi(n, z)
    % Riccati–Bessel S function
    % If nu and Z are arrays of the same size, the result is also that size. 
    % If either input is a scalar, it is expanded to the other input's size.
   r=sqrt(pi*z/2).*besselh(n+0.5,1, z);
end