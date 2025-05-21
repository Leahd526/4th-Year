% ***WEC model -  find opt Kp and Ki - use in Simulink
% Simulation Parameters
omega_pk = 0.7;                    % Optimal frequency [rad/s]
jw = 1i * omega_pk;

% WEC Physical Parameters
m = WEC.hydroData.m;              % Mass
k = WEC.hydroData.res.Sh;         % Restoring coefficient (spring constant)

% Radiation Damping State-Space Model
Arad = rad.Arad;
Brad = rad.Brad;
Crad = rad.Crad;
Drad = rad.Drad;

% Frequency response of radiation damping impedance
Z_rad = Crad * ((jw * eye(size(Arad)) - Arad) \ Brad) + Drad;

% Find total intrinsic impedance
Z_mass = m * jw; 
Z_rest = k / jw;
Z_total = Z_mass + Z_rest + Z_rad;

% complex conjugate
Z_conj = conj(Z_total);

Kp = real(Z_conj); % Kp used in gain in Simulink
Ki = -imag(Z_conj) * omega_pk; % Ki used in gain in Simulink
