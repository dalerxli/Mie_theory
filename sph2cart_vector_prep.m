function [COS_theta, SIN_theta,...
          COS_phi, SIN_phi] = sph2cart_vector_prep(theta, phi, numel_r)
    assert(isvector(theta) &...
           isvector(phi), 'theta and phi must be vectors');
    
    if(iscolumn(theta)); theta=theta'; end
    if(iscolumn(phi)); phi=phi'; end
       
   
    COS_theta=repmat(cos(theta), numel_r, 1, numel(phi));
    SIN_theta=repmat(sin(theta), numel_r, 1, numel(phi));
    COS_phi=repmat(permute(cos(phi), [3 1 2]), numel_r, numel(theta));
    SIN_phi=repmat(permute(sin(phi), [3 1 2]), numel_r, numel(theta));
    
end