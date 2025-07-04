close all; clc; clear

%% Características do veículo
M = 1020;           % [kg]]
g = 9.81;           % [m / s²]
W = M * g;          % [N]

Af = 2.04;          % [m²] Área Frontal
rho = 1.2923;       % [kg / m³] Densidade do Ar
Cd = 0.33;          % [] Coeficiente de arrasto aerodinamico

%% Condições de operação
theta = deg2rad(2); % [rad] Inclinação da Via = 2º
Vkmh = 0:160;       % [km / h] (passo = 1 quando oculto)
Vms = Vkmh / 3.6;   % [m / s]

%% Eq. Resistencia ao movimento

% Coef. de Resistencia ao Rolamento:
fr = 0.01 * (1 + (2.24 / 100) * Vms);
% Resistencia ao rolamento:
Rx = fr * W * cos(theta);       % [N]

% Resistencia aerodinamica:
Ra = (1/2) * rho * Af * Cd * Vms.^2; % [N]

% Resistencia devido ao aclive:
Ri = W * sin(theta) * ones(size(Vms)); % [N]

%% Plot
figure()

hold on;
plot(Vkmh, Rx, 'b', 'LineWidth', 4);
plot(Vkmh, Ra, 'r', 'LineWidth', 4, 'LineStyle','--');
plot(Vkmh, Ri, 'k', 'LineWidth', 4, 'LineStyle','-.');

grid on;
xlabel("v [Km / h]");
ylabel("Res [N]");

legend('Rx', 'Ra', 'Ri', Location='best');
%

figure()
plot(Vkmh, Ra + Rx, 'k', 'LineWidth', 4);

grid on;
xlabel("v [Km / h]");
ylabel("Res [N]");

legend('Ra + Rx', Location='best');