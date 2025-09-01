%% Prandtl-Meyer Expansion Calculator
% Author: Dipendra Kumar Dewangan
% Department of Aerospace Engineering, IIT Kanpur

clear; clc;

%% ===== USER INPUTS =====
M1 = input('Enter upstream Mach number M1: ');
gamma = input('Enter specific heat ratio gamma: ');
theta = input('Enter flow deflection angle (deg): '); % turn angle (expansion)

theta = deg2rad(theta); % radians

%% ===== Prandtl-Meyer function =====
nu_fun = @(M) sqrt((gamma+1)/(gamma-1)) * atan( sqrt((gamma-1)/(gamma+1) * (M.^2 - 1)) ) ...
              - atan( sqrt(M.^2 - 1) );

% Compute nu1
nu1 = nu_fun(M1);

% Target nu2 = nu1 + theta
nu2_target = nu1 + theta;

% Solve for M2 numerically
M2 = fzero(@(M) nu_fun(M) - nu2_target, [M1 50]); % upper bound 50 for safety

%% ===== Property Ratios (Isentropic) =====
T2_T1 = (1 + 0.5*(gamma-1)*M1^2) / (1 + 0.5*(gamma-1)*M2^2);
p2_p1 = (T2_T1)^(gamma/(gamma-1));
rho2_rho1 = (T2_T1)^(1/(gamma-1));
p02_p01 = 1.0; % isentropic, total pressure preserved

%% ===== Display Results =====
fprintf('\n=== PRANDTL-MEYER EXPANSION RESULTS ===\n');
fprintf('Turn angle (theta)  = %.3f deg\n', rad2deg(theta));
fprintf('nu(M1)              = %.3f deg\n', rad2deg(nu1));
fprintf('nu(M2)              = %.3f deg\n', rad2deg(nu2_target));
fprintf('M2 (after expansion)= %.3f\n', M2);
fprintf('p2/p1               = %.3f\n', p2_p1);
fprintf('rho2/rho1           = %.3f\n', rho2_rho1);
fprintf('T2/T1               = %.3f\n', T2_T1);
fprintf('p02/p01             = %.3f\n', p02_p01);
