function [ax] = longMov(t, Vms, Fxt)
% Características do veículo
M = 1020;           % [kg]]
g = 9.81;           % [m / s²]
W = M * g;          % [N]

Af = 2.04;          % [m²] Área Frontal
rho = 1.2923;       % [kg / m³] Densidade do Ar
Cd = 0.33;          % [] Coeficiente de arrasto aerodinamico

if t < 10
    theta = deg2rad(3);
else
    % Condições de operação
    theta = 0; % [rad] Inclinação da Via = 2º
end

% Eq. Resistencia ao movimento

% Coef. de Resistencia ao Rolamento:
fr = 0.01 * (1 + (2.24 / 100) * Vms);
% Resistencia ao rolamento:
Rx = fr * W * cos(theta) * sign(Vms);       % [N]
%                          sinal de Vms ()


% Resistencia aerodinamica:
Ra = (1/2) * rho * Af * Cd * Vms.^2; % [N]

% Resistencia devido ao aclive:
Ri = W * sin(theta) * ones(size(Vms)); % [N]

% Calculo do movimento longitudinal
ax = (Fxt - Ra - Rx - Ri) / M;

end