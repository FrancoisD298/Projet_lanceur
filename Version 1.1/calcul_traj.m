%test de calcul de trajectoire
close all;

global Req;
global Rpo;
global model_etage
global ALT
global VR
global RHOO
global POUSSEE
global THETA
global MACH
global Omegat
global TEMPS
global ACC
global PA
global INCI
global QQ
global SNPA
global BETA
global tt1
global tt3
global DR
global PDYN
global FLUX

%Modifiaction François 15/12/17
global Enquete

QQ = [];
ALT =[];
DR = [];
PA = [];
VR = [];
MACH = [];
THETA = [];
POUSSEE = [];
TEMPS = [];
ACC = [];
INCI = [];
SNPA = [];
BETA = [];
PDYN = [];
FLUX = [];
RHOO = [];

Enquete = [];

%% Calcul ODE 45
tc1 = model_etage(4,1)-model_etage(3,1);
tc2 = model_etage(4,2)-model_etage(3,2);
tc3 = model_etage(4,3)-model_etage(3,3);

mo = sum(model_etage(5,:));
Eo = [Req/1.5; Req/1.5; Rpo/3; -Omegat*Req/1.5; +Omegat*Req/1.5 ;0; mo];%3.8455e6;   -5.0555e6;    0.5771e6
 
[t1,y1] = ode45(@equation_ode, [0 tt1-0.01], Eo);
% options = odeset('Events', @event_etage_1);

Eo = y1(end,:);
[t11,y11] = ode45(@equation_ode, [tt1+0.01 model_etage(4,1)-0.01], Eo);
% options = odeset('Events', @event_etage_1);

m1 = sum(model_etage(5,2:3));
E1 = [y11(end,1); y11(end,2); y11(end,3); y11(end,4); y11(end,5); y11(end,6); m1];
[t2,y2] = ode45(@equation_ode, [model_etage(4,1)+0.01 tc1+tc2], E1);
% options = odeset('Events', @event_etage_2);

m2 = model_etage(5,3);
E2 = [y2(end,1); y2(end,2); y2(end,3); y2(end,4); y2(end,5); y2(end,6); m2];
[t3,y3] = ode45(@equation_ode, [tc1+tc2 tc1+tc2+tt3-0.05], E2);
% options = odeset('Events', @event_etage_3);

E2 = [y3(end,1); y3(end,2); y3(end,3); y3(end,4); y3(end,5); y3(end,6); y3(end,7)];
[t33,y33] = ode45(@equation_ode, [tc1+tc2+tt3+0.05 model_etage(4,3)], E2);

t = vertcat(t1,t11,t2,t3,t33);
y = vertcat(y1,y11,y2,y3,y33);

%% Plot des variables 
figure
plot(t,y(:,7));
title('Masse en fonction du temps');
xlabel('Temps (s)')
ylabel('Masse (kg)')

figure;
plot(ALT, VR);
title('Vitesse relative en fonction de l altitude')
xlabel('Altitude (km)')
ylabel('V_R (m/s)')

normV = sqrt(y(:,4).*y(:,4)+y(:,5).*y(:,5)+y(:,6).*y(:,6));
figure
hold on
plot(t, normV)
plot(TEMPS, VR)
title('Evolution des vitesses');
ylabel('Vitesse (m/s) ')
xlabel('Temps (s)')
legend('VA','VR');

figure
[x_s,y_s,z_s] = sphere;
x_req = x_s*Req;
y_req = y_s*Req;
z_req = z_s*Req;
surf(x_req,y_req,z_req,'FaceColor','b');
% earth_sphere('nm');
hold on
plot3(y(:,1),y(:,2),y(:,3),'b','LineWidth',5);
grid on;
hold off

figure;
subplot(1,3,1);
plot(TEMPS, rad2deg(real(acos(INCI))))
title('Incidence en fonction du temps');
xlabel('Temps (s)');
ylabel('Incidence (deg)');
%figure;
subplot(1,3,2);
plot(TEMPS, rad2deg(real(acos(BETA))))
title('Pente locale de la vitesse relative en fonction du temps');
xlabel('Temps (s)');
ylabel('Gamma (deg)');
%figure
subplot(1,3,3);
plot(TEMPS, 90-THETA);
title('Assiette galiléenne en fonction du temps');
xlabel('Temps (s)')
ylabel('Assiette galliléenne (deg)');

figure;
plot(TEMPS, QQ);
title('débit');

figure
% subplot(3,1,1);
plot(TEMPS, DR);
title('Traînée en fonction du temps')
ylabel('Traînée (N)');
xlabel('Temps (s)');

figure
subplot(2,1,1)
plot(TEMPS, FLUX);
title('Flux thermique en fonction du temps')
ylabel('Flux thermique (W/m2)');
xlabel('Temps (s)');
%figure
subplot(2,1,2)
plot(TEMPS, PDYN);
title('Pression dynamique en fonction du temps')
ylabel('P_d_y_n (Pa)');
xlabel('Temps (s)');
% figure
% plot3(y(:,1),y(:,2),y(:,3));
% grid on;

figure
plot(TEMPS, ALT);
xlabel('Temps (s)');
ylabel('Altitude Géodésique (km)')
title('Altitude en fonction du temps')

figure
plot(TEMPS, POUSSEE);
title('Poussée en fonction du temps');
xlabel('Temps (s)');
ylabel('Poussée (N)');

% plot(TEMPS, Enquete);
% title('norme d un vecteur en fonction du temps');

% 
% figure
% subplot(1,2,1)
% plot(ALT, PA);
% title('Pa en fonction de l altitude');
% subplot(1,2,2)
% plot(TEMPS, PA);
% title('Pa en fonction du temps');

% figure;
% plot(TEMPS, MACH);
% title('Mach en focntion du temps');
% xlabel('Temps (s)');
% ylabel('Nombre de Mach');
% figure
% plot(ALT, PA);
% title('Pa');

% figure;
% plot(TEMPS, ACC);
% ylabel('Accélération (m/s2)');
% xlabel('Temps (s)')
% title('Accélération en fonction du temps');

% figure
% subplot(2,3,1)
% plot(t,y(:,1)/1000);
% title('Position x en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position x en km');
% subplot(2,3,2)
% plot(t,y(:,2)/1000);
% title('Position y en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position y en km');
% subplot(2,3,3)
% plot(t,y(:,3)/1000);
% title('Position z en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position z en km');
% subplot(2,3,4)
% plot(t,y(:,4));
% title('Position Vx en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position Vx en m.s-1');
% subplot(2,3,5)
% plot(t,y(:,5));
% title('Position Vy en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position Vy en m.s-1');
% subplot(2,3,6)
% plot(t,y(:,6));
% title('Position Vz en fonction du temps');
% xlabel('Temps en secondes');
% ylabel('Position Vz en m.s-1');

% subplot(3,1,2)
% plot(TEMPS, DR2);%verif Drag
% title('Rho * Vr*norm(Vr) en fonction du temps')
% subplot(3,1,3);
% plot(TEMPS, DR3);
% title('Rapport entre les deux termes de trainée au dessus en fonction du temps')
% % subplot(,1,4)
% plot(TEMPS, VR);
% title('VR en fonction du temps')
% subplot(5,1,5)
% plot(TEMPS, RHOO);
% title('RHOO en fonction du temps')