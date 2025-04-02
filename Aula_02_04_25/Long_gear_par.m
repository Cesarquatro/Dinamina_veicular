% Universidade Estadual Paulista - UNESP
% Instituto de Ciência e Tecnologia  - Câmpus de Sorocaba
% Departamento de Engenharia de Controle e Automação
% Disciplina: DV - Dinâmcica Veicular 2025s1
% Professor: Fabrício Leonardo Silva
% fabricio.leonardo@unesp.br

close all
clear
clc

%% ---------------------- Caracteristicas do veículo ----------------------
M = 1400;                   % Massa do veículo [kg]
W = M*9.81;                 % Peso do veículo, com um passageiro [N]
Af = 2.15;                  % Area frontal do veículo [m²]
Cd = 0.34;                  % Coeficiente arrasto
rho = 1.2923;               % Densidade do ar [kg/m³]

% ------- Cruva de torque por rotação do motor de combustão interna -------
load('MCI.mat')
Ie = 0.125;         % Inercia do motor/volante

% ------------------------ Sistema de Transmissão -------------------------
nt = [3.750 2.235 1.518 1.132 0.820]; % Relações de transmissão da caixa de engrenagens
it = [0.128 0.100 0.062 0.028 0.010]; % Inercia da transmissão [kg/m^2]
Nd = 2.950;         % Relação de transmissão do diferencial
Id = 0.065;         % Inercia do diferencial [kgm2]
ntd = 0.91;         % Eficiência total da transmisão

% ----------------------------- Raio do pneu ------------------------------
Rp = 0.307;         % Raio dinâmico\efetivo do pneu [m]
Iw = 0.860;         % Inercia de cada roda [kgm2]

% -------------------------------------------------------------------------
% marcha 1;
% ax = 0;               % aceleração do veículo [m/s^2]
% Te = 10;              % Torque do motor [N]
% Ntd = nt(marcha)*Nd;  % Redução total da transmissão
% It = it(marcha);      % Inercia da transmissão para a marcha atual
% 
% Fx = (Te*Ntd*ntd)/Rp - ( (Ie+It)*Ntd^2 +Id*Nd^2 +2*Iw ) * (ax/(Rp^2));



