function [roll,pitch,yaw] = get_euler_from_q(q0,q1,q2,q3)
roll = atan(2 * (q0 * q1 + q2 * q3)/(1 - 2 * (q1 * q1 + q2 * q2)));
pitch = asin(2 * (q0 * q2 - q3 * q1));
yaw = atan(2 * (q0 * q3 + q1 * q2)/(1 - 2 * (q2 * q2 + q3 * q3)));
end