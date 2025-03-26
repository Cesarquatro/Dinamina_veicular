close all; clc; clear
%% 

tsim = [0 200];
V0 = 80 /3.6;


% @ fala quais são as constantes, o testo ele considera como cte
[t, vms] = ode45(@(t, Vms)  longMov(t, Vms, 0), tsim, V0);


figure()
hold on

plot(t, vms*3.6, 'k', 'LineWidth', 4);

grid on;
xlabel("t [s]");
ylabel("v [Km / h]");

%legend('Ra + Rx', Location='best');