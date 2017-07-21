function [roll,pitch,yaw] = get_euler_from_q(q0,q1,q2,q3)
% roll = atan2(2 * (q0 * q1 + q2 * q3)/(1 - 2 * (q1 * q1 + q2 * q2)));
% pitch = asin(2 * (q0 * q2 - q3 * q1));
% yaw = atan2(2 * (q0 * q3 + q1 * q2)/(1 - 2 * (q2 * q2 + q3 * q3)));
a = q0;
b = q1;
c = q2;
d = q3;
asq = q0*q0;
bsq = q1*q1;
csq = q2*q2;
dsq = q3*q3;
R = zeros(3,3);
R(1,1) = asq + bsq - csq - dsq;
R(1,2) = 2*(b*c - a*d);
R(1,3) = 2*(a*c + b*d);
R(2,1) = 2*(b*c + a*d);
R(2,2) = asq - bsq + csq - dsq;
R(2,3) = 2*(c*d - a*b);
R(3,1) = 2*(b*d - a*c);
R(3,2) = 2*(a*b + c*d);
R(3,3) = asq - bsq - csq + dsq;
phi_val = atan2(R(3,2),R(3,3));
theta_val = asin(-R(3,1));
psi_val = atan2(R(2,1),R(1,1));
if abs(theta_val - pi/2) < 0.001
    phi_val = 0
    psi_val = atan2(R(2,3),R(1,3));
else
    if abs(theta_val + pi/2) < 0.001
        phi_val = 0
        psi_val = atan2(-R(2,3),-R(1,3));
    end
end
roll = phi_val;
pitch = theta_val;
yaw = psi_val;
end