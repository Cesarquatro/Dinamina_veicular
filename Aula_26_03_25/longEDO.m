close all; clc; clear
%% 

tsim = [0 500];
V0 = 110 /3.6;
Fxt = -300;


% @ fala quais são as constantes, o testo ele considera como cte
[t, vms] = ode45(@(t, Vms)  longMov(t, Vms, Fxt), tsim, V0);


figure()
hold on

plot(t, vms*3.6, 'k', 'LineWidth', 4);

grid on;
xlabel("t [s]");
ylabel("v [Km / h]");

%legend('Ra + Rx', Location='best');

dist = trapz(t, vms)