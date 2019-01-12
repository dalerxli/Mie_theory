function [Ax, Ay, Az] = sph2cart_vector(Ar, Atheta, Aphi, ...
                        COS_theta,SIN_theta, COS_phi, SIN_phi)
    
    Ax=Ar.*SIN_theta.*COS_phi+Atheta.*COS_theta.*COS_phi-Aphi.*SIN_phi;
    Ay=Ar.*SIN_theta.*SIN_phi+Atheta.*COS_theta.*SIN_phi+Aphi.*COS_phi;
    Az=Ar.*COS_theta         -Atheta.*SIN_theta;
end

