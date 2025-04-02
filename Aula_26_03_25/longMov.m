function [ax] = longMov(t, Vms, Fxt)
% Características do veículo
M = 1400;           % [kg]]
g = 9.81;           % [m / s²]
W = M * g;          % [N]

Af = 2.15;          % [m²] Área Frontal
rho = 1.3;       % [kg / m³] Densidade do Ar
Cd = 0.34;          % [] Coeficiente de arrasto aerodinamico

% if t < 10
%     
% else
%     % Condições de operação
%     theta = 0; % [rad] Inclinação da Via = 2º
% end

% theta = 0; % [rad] Inclinação da Via = 2º

theta = deg2rad(5);

% Eq. Resistencia ao movimento

% Coef. de Resistencia ao Rolamento:
fr = 0.01 * (1 + (2.24 / 100) * Vms);
% Resistencia ao rolamento:
Rx = fr * W * cos(theta) * sign(Vms);       % [N]
Rx = 0;
%                          sinal de Vms ()


% Resistencia aerodinamica:
Ra = (1/2) * rho * Af * Cd * Vms.^2; % [N]

% Resistencia devido ao aclive:
Ri = W * sin(theta) * sign(Vms); % * ones(size(Vms)); % [N]
% Ri = 0;

% Calculo do movimento longitudinal
ax = (Fxt * sign(Vms) - Ra - Rx - Ri) / M;

end