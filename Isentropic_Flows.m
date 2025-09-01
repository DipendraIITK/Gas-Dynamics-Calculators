%% Isentropic Flow Relations Calculator
% Author: Dipendra Kumar Dewangan
% Department of Aerospace Engineering, IIT Kanpur

clear; clc;

%% ===== USER INPUTS =====
M = input('Enter Mach number M: ');
gamma = input('Enter specific heat ratio gamma: ');

%% ===== Stagnation Relations =====
T_T0 = 1 / (1 + 0.5*(gamma-1)*M^2);
p_p0 = (T_T0)^(gamma/(gamma-1));
rho_rho0 = (T_T0)^(1/(gamma-1));

%% ===== Sonic (critical) conditions at M=1 =====
T_T0_star = 1 / (1 + 0.5*(gamma-1)*1^2);
p_p0_star = (T_T0_star)^(gamma/(gamma-1));
rho_rho0_star = (T_T0_star)^(1/(gamma-1));

%% ===== Ratios with respect to critical state =====
T_Tstar = T_T0 / T_T0_star;
p_pstar = p_p0 / p_p0_star;
rho_rhostar = rho_rho0 / rho_rho0_star;

%% ===== Area Ratio =====
A_Astar = (1/M) * ( (2/(gamma+1))*(1+0.5*(gamma-1)*M^2) )^((gamma+1)/(2*(gamma-1)));

%% ===== Mach Angle and PM Angle =====
if M > 1
    mu = asind(1/M); % in degrees
    nu = sqrt((gamma+1)/(gamma-1)) * atand( sqrt((gamma-1)/(gamma+1)*(M^2-1)) ) ...
         - atand( sqrt(M^2-1) );
else
    mu = NaN; % Not defined for subsonic
    nu = NaN; 
end

%% ===== Display Results =====
fprintf('\n=== ISENTROPIC FLOW RELATIONS ===\n');
fprintf('Mach number (M)     = %.3f\n', M);
fprintf('Mach angle (mu)     = %.3f deg\n', mu);
fprintf('P-M angle (nu)      = %.3f deg\n', nu);
fprintf('p/p0                = %.5f\n', p_p0);
fprintf('rho/rho0            = %.5f\n', rho_rho0);
fprintf('T/T0                = %.5f\n', T_T0);
fprintf('p/p*                = %.5f\n', p_pstar);
fprintf('rho/rho*            = %.5f\n', rho_rhostar);
fprintf('T/T*                = %.5f\n', T_Tstar);
fprintf('A/A*                = %.5f\n', A_Astar);
