%% Normal Shock Wave Calculator
% Calculates downstream Mach number and property ratios across a normal shock

clear; clc;

%% ===== USER INPUTS =====
M1 = input('Enter upstream Mach number M1: ');
gamma = input('Enter specific heat ratio (γ): ');

%% ===== CALCULATIONS =====
% Normal component
Mn1 = M1;

% Downstream Mach number
M2 = sqrt( (1 + (gamma-1)/2*Mn1^2) / (gamma*Mn1^2 - (gamma-1)/2) );

% Static property ratios
p2p1 = 1 + (2*gamma/(gamma+1))*(Mn1^2 - 1);
rho2rho1 = ((gamma+1)*Mn1^2) / (2 + (gamma-1)*Mn1^2);
T2T1 = p2p1 / rho2rho1;

% Total (stagnation) pressure ratio
p02p01 = (( (gamma+1)*Mn1^2 )/( (gamma-1)*Mn1^2 + 2 ))^(gamma/(gamma-1)) ...
          * ( (gamma+1)/(2*gamma*Mn1^2 - (gamma-1)) )^(1/(gamma-1));

% Useful ratio p1/p02
p1p02 = 1 / ( (1 + (gamma-1)/2*M1^2)^(gamma/(gamma-1)) * (p02p01) );

%% ===== RESULTS =====
fprintf('\n--- NORMAL SHOCK RESULTS ---\n');
fprintf('Upstream Mach number (M1) = %.3f\n', M1);
fprintf('Downstream Mach number (M2) = %.3f\n', M2);
fprintf('Static pressure ratio (p2/p1) = %.3f\n', p2p1);
fprintf('Density ratio (rho2/rho1) = %.3f\n', rho2rho1);
fprintf('Temperature ratio (T2/T1) = %.3f\n', T2T1);
fprintf('Stagnation pressure ratio (p02/p01) = %.5f\n', p02p01);
fprintf('p1/p02 = %.5f\n', p1p02);
