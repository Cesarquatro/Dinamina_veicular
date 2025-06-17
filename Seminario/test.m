close all; clear; clc;
%% 
g = 9.81;
veh.massa_chassi_sem_piloto_kg    = 718.0;   % Massa do carro sem piloto (kg)
veh.massa_piloto_kg               = 82.0;    % Massa do piloto (kg)
veh.massa_total_kg                = 800.0;   % Massa total (sem combustível) (kg)

% Geometria longitudinal
veh.entre_eixos_m                 = 3.60;    % Distância entre eixos (m)
veh.dist_cg_eixo_dianteiro_m      = 1.88;    % Distância do CG ao eixo dianteiro (m)
veh.dist_cg_eixo_traseiro_m       = 1.52;    % Distância do CG ao eixo traseiro (m)
veh.altura_cg_m                   = 0.25;    % Altura do CG em relação ao solo (m)

% Pneus
veh.raio_dinamico_pneu_m          = 0.335;   % Raio dinâmico (m)
veh.raio_estatico_pneu_m          = 0.33;    % Raio estático (m)
veh.raio_real_pneu_m              = 0.34;    % Raio médio (m)

% Aerodinâmica
veh.area_frontal_m2              = 1.40;    % Área frontal (m²)
veh.coef_arrasto_cd              = 0.90;    % Coeficiente de arrasto aerodinâmico
veh.coef_sutentacao_cl           = -2.34;   % Coeficiente de sustentação aerodinâmico

% Aderência
veh.coef_atrito_seco             = 1.60;    % Coeficiente de atrito seco (slick)
veh.coef_atrito_molhado          = 1.05;    % Coeficiente de atrito molhado

% Transmissão - Relações de marcha
veh.rel_marcha_1                 = 3.00;
veh.rel_marcha_2                 = 2.00;
veh.rel_marcha_3                 = 1.50;
veh.rel_marcha_4                 = 1.20;
veh.rel_marcha_5                 = 1.00;
veh.rel_marcha_6                 = 0.85;
veh.rel_marcha_7                 = 0.70;
veh.rel_marcha_8                 = 0.60;

% Inércias das marchas (kg·m²)
veh.inercia_marcha_1             = 0.62;
veh.inercia_marcha_2             = 0.40;
veh.inercia_marcha_3             = 0.25;
veh.inercia_marcha_4             = 0.10;
veh.inercia_marcha_5             = 0.05;
veh.inercia_marcha_6             = 0.03;
veh.inercia_marcha_7             = 0.02;
veh.inercia_marcha_8             = 0.01;

% Diferencial
veh.rel_diferencial              = 3.00;    % Relação do diferencial
veh.inercia_diferencial          = 0.07;    % Inércia do diferencial (kg·m²)

% Eficiência
veh.eficiencia_transmissao       = 0.91;    % Eficiência da transmissão
veh.inercia_roda_kgm2            = 0.85;    % Inércia de cada roda completa (kg·m²)

% Inércia motor
veh.inercia_motor_volante        = 0.15;    % Inércia do conjunto motor/volante (kg·m²)


experiment.degree  = deg2rad(10);

experiment.v_ms    = 20;

experiment.Rc      = (83.9  - 1.6) / 2

Ks = (experiment.degree - (veh.entre_eixos_m ./ experiment.Rc)) ./ ((experiment.v_ms.^2) ./ (experiment.Rc * g));

disp(Ks)
if Ks == 0
    disp("Neutro")

elseif  Ks > 0
    disp("Subesterçante")

elseif  Ks < 0
    disp("Sobresterçante")

end