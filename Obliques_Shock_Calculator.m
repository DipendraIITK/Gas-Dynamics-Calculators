%% Oblique Shock Wave Calculator
% Author: Dipendra Kumar Dewangan
% Department of Aerospace Engineering, IIT Kanpur

clear; clc;

%% ===== USER INPUTS =====
M1 = input('Enter upstream Mach number M1: ');
gamma = input('Enter specific heat ratio gamma: ');
theta = input('Enter flow deflection angle (deg): '); % turn angle

%% ===== Convert to radians =====
theta = deg2rad(theta);

%% ===== Function to solve wave angle (beta) =====
beta_fun = @(beta) ...
    tan(theta) - 2*cot(beta) * (M1^2*sin(beta).^2 - 1) ./ ...
    (M1^2*(gamma+cos(2*beta)) + 2);

% Initial guess for weak shock solution
beta_guess = asin(1/M1) + theta;  
beta = fzero(beta_fun, beta_guess);

%% ===== Normal Mach number before shock =====
M1n = M1 * sin(beta);

%% ===== Normal shock relations =====
M2n = sqrt( (1 + 0.5*(gamma-1)*M1n^2) / (gamma*M1n^2 - 0.5*(gamma-1)) );

% Downstream Mach number
M2 = M2n / sin(beta - theta);

% Pressure ratio
p2_p1 = 1 + 2*gamma/(gamma+1) * (M1n^2 - 1);

% Density ratio
rho2_rho1 = ((gamma+1)*M1n^2) / ((gamma-1)*M1n^2 + 2);

% Temperature ratio
T2_T1 = p2_p1 / rho2_rho1;

% Total pressure ratio
p02_p01 = (( (gamma+1)*M1n^2 ) / ( (gamma-1)*M1n^2 + 2 ))^(gamma/(gamma-1)) * ...
          ( ( (gamma+1)/(2*gamma*M1n^2 - (gamma-1)) )^(1/(gamma-1)) );

%% ===== Display Results =====
fprintf('\n=== OBLIQUE SHOCK RESULTS ===\n');
fprintf('Wave angle (beta)   = %.3f deg\n', rad2deg(beta));
fprintf('Turn angle (theta)  = %.3f deg\n', rad2deg(theta));
fprintf('M1n (before shock)  = %.3f\n', M1n);
fprintf('M2n (after shock)   = %.3f\n', M2n);
fprintf('M2 (after shock)    = %.3f\n', M2);
fprintf('p2/p1               = %.3f\n', p2_p1);
fprintf('rho2/rho1           = %.3f\n', rho2_rho1);
fprintf('T2/T1               = %.3f\n', T2_T1);
fprintf('p02/p01             = %.3f\n', p02_p01);
