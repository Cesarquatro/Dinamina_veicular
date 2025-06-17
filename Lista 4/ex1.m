close all; clear; clc;
%% Parâmetros do veículo
veh.M_sprung            = 1000;    % massa suspensa total (kg)
veh.M_unsprung_front    = 60;      % massa não suspensa dianteira (kg) [Mns]
veh.M_unsprung_rear     = 50;      % massa não suspensa traseira (kg)  [Mns]
veh.mass_frac_front     = 0.60;    % 60% da massa suspensa no eixo dianteiro
veh.mass_frac_rear      = 0.40;    % 40% da massa suspensa no eixo traseiro
veh.M_sprung_front      = veh.mass_frac_front * veh.M_sprung / 2;  % = 300 kg [Ms]
veh.M_sprung_rear       = veh.mass_frac_rear  * veh.M_sprung / 2;  % = 200 kg [Ms]

veh.K_tire_front        = 160e3;   % rigidez do pneu dianteiro (N/m) [Kt]
veh.K_tire_rear         = 160e3;   % rigidez do pneu traseiro  (N/m) [Kt]
veh.K_spring_front      =  17e3;   % rigidez da mola dianteira (N/m) [Ks]
veh.K_spring_rear       =  25e3;   % rigidez da mola traseira (N/m)  [Ks]

veh.C_damper_front      =   850;   % coeficiente de amortecimento dianteiro (N·s/m) [Cs]
veh.C_damper_rear       =  1500;   % coeficiente de amortecimento traseiro (N·s/m)  [Cs]

%% 
% Questão 1
% Desenvolva um modelo matemático de um quarto de veículo para a suspensão
% dianteira e outro para traseira. Implemente esse modelo computacionalmente.
%% Front
Ks_f  = veh.K_spring_front;
Kt_f  = veh.K_tire_front;
Ms_f  = veh.M_sprung_front;
Mns_f = veh.M_unsprung_front;
Cs_f  = veh.C_damper_front ;

A_f = [[0           , 1           , 0                 , 0            ];
       [(-Ks_f/Ms_f), (-Cs_f/Ms_f), (Ks_f/Ms_f)       , (Cs_f/Ms_f)  ];
       [0           , 0           , 0                 , 1            ];
       [(Ks_f/Mns_f), (Cs_f/Mns_f), (-Ks_f-Kt_f/Mns_f), (-Cs_f/Mns_f)]];
B_f =  [0; 0; 0; (Kt_f/Mns_f)];

C = [[1, 0, 0, 0];
     [0, 0, 1, 0]];

D = 0;

%% Rear
Ks_r  = veh.K_spring_front;
Kt_r  = veh.K_tire_front;
Ms_r  = veh.M_sprung_front;
Mns_r = veh.M_unsprung_front;
Cs_r  = veh.C_damper_front ;

A_r = [[0           , 1           , 0                 , 0            ];
       [(-Ks_r/Ms_r), (-Cs_r/Ms_r), (Ks_r/Ms_r)       , (Cs_r/Ms_r)  ];
       [0           , 0           , 0                 , 1            ];
       [(Ks_r/Mns_r), (Cs_r/Mns_r), (-Ks_r-Kt_r/Mns_r), (-Cs_r/Mns_r)]];

B_r =  [0; 0; 0; (Kt_r/Mns_r)];

SS_r = ss(A_r, B_r, C, D);
TF_r = tf(SS_r);

SS_f = ss(A_f, B_f, C, D);
TF_f = tf(SS_f);

%% Questão 2
% Simule o comportamento da suspensão dianteira e traseira do veículo passando
% por um degrau de amplitude de -0,1 metros.
t      = 0:0.01:10;                % vetor linha 1×N
u_step = -0.1 * ones(length(t), 1); % vetor coluna N×1
y_f      = lsim(TF_f, u_step, t);    % agora funciona sem erro
y_r      = lsim(TF_r, u_step, t);    % agora funciona sem erro

figure();
plot(y_f);
xlabel('Tempo (s)');
ylabel('Saída_f');
title('Resposta ao Degrau de 0.1 unit');

figure();
plot(y_r);
xlabel('Tempo (s)');
ylabel('Saída_r');
title('Resposta ao Degrau de 0.1 unit');