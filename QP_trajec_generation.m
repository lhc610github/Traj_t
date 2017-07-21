c = zeros(4*(order+1)*m);               %coefficients of polynomial functions


%Quadratic cost function (minimum snap) : J = c.' * A * c
mu_r = 1; mu_psi = 1;                   %constants that makes the integrand nondimensional
k_r = 3; k_psi = 2; %3  %2

%Compute the cost function matrix, A
A = computeA(order, m, mu_r, mu_psi, k_r, k_psi, t);

%Compute the constraint function matrix, C
% [C, b] = computeConstraint(order, m, k_r, k_psi, t, keyframe);
[C2, b2, C, b, Cin, bin] = computeConstraint(order, m, k_r, k_psi, t, keyframe, corridor_position, n_intermediate, corridor_width);
C_inv = C';
A_2 = 2*A;
options = optimoptions('quadprog', 'Display', 'iter', 'MaxIter', 4000);
%tic;
%solution_corridor = quadprog(2*A, [], Cin, bin, C, b, [], [], [], options);
%toc;
tic;
[solution,FVAL,EXITFLAG] = quadprog(2*A, [], [], [], C, b, [], [], [], options);
toc;
% solution = quadprog(2*A, [], [], [], [], [], [], [], [], options);