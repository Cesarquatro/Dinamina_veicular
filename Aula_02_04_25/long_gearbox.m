% Universidade Estadual Paulista - UNESP
% Instituto de Ciência e Tecnologia  - Câmpus de Sorocaba
% Departamento de Engenharia de Controle e Automação
% Disciplina: DV - Dinâmcica Veicular 2025s1
% Professor: Fabrício Leonardo Silva
% fabricio.leonardo@unesp.br

close all
clear
clc


% ------- Cruva de torque por rotação do motor de combustão interna -------
load('MCI.mat')

% ------------------------ Sistema de Transmissão -------------------------

nt = [3.750 2.235 1.518 1.132 0.820]; % Relações de transmissão da caixa de engrenagens
Nd = 2.950;         % Relação de transmissão do diferencial
ntd = 0.91;         % Eficiência total da transmisão

% ----------------------------- Raio do pneu ------------------------------
Rp = 0.307;         % Raio dinâmico\efetivo do pneu [m]

% ------------- Curvas do sistema de transmissão de potência --------------

figure();
axes();
hold on

for i = 1:length(nt)
    Nt = nt(i);                             % Relação de transmissão da marcha i
    Ntd = Nt*Nd;                            % Relação total da transmissão
    vel = (rpm_e*(2*pi/60))*(Rp/Ntd)*3.6;   % Velocidade em [km/h];
    Fx = Torque_e*(Ntd/Rp)*ntd;             % Força de tração [N]
    plot(vel,Fx,'LineWidth',2)
end
grid on
xlabel('Velocidade [km/h]')
ylabel('Força de tração [N]')







