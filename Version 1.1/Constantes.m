%Constantes globales
global mu;          %en m^3.s-2, constante gravitation terrestre
global Req;          %en m, rayon équatorial
global Rpo;          %en m, rayon polaire
global J2;           %sans unités, applatissement terrestre
global Cj;           %en m^5.s-2
global Omegat;       %en rad.s-1
global e_apTer;            %sans unités, aplastissement terrestre 2
global g0;  %Constante de la poussée (considérée 9.81, à vérifier)!
global HG;
global VSON;
global RHO;
global Sref;
global Az

mu = 3.986005e14;
Req = 6378137;
Rpo = 6356752;
J2 = 1.08263e-3;
Cj = 0.5*mu*J2*Req^2;
Omegat = 7.292155e-5;
e_apTer = sqrt(1-(Rpo/Req)^2);
g0 = 9.81;
Sref = 2;
Az = cos(7*pi/180)/cos(5.16*pi/180); %cos(inclinaison)/cos(phi_Kourou)

ATM = table2array(ATMOS);
HG = ATM(:,1);
RHO = ATM(:,2);
VSON = ATM(:,3);

%--------- AJOUT DE CONSTANTES POUR LES FONCTIONS -----------------
global tv;          %en s, Constante de temps de la montée verticale
global tb;          %en s, Constante de temps qui correpond au basculement du lanceur (séqeunce 2)
global gamma_b;     % en rad, angle de basculement du lanceur (séquence 2)
global model_etage; % vecteur contenant l'angle d'assiette à chaque séparation et le temps d'étage
global ta;          %en s, temps de fin de séquence 3, moment d'incidence nulle

tv =15;
tb =35;
ta = 84.54;
gamma_b = 10*pi/180;

global Isp1
global Isp2
global Isp3
Isp1 = 332.11;
Isp2 = 347.91;
Isp3 = 441.71;

global Sn1
global Sn2
global Sn3
Sn1 = 11.63;
Sn2 = 5.93;
Sn3 = 1.23;

global q1
global q2
global q3
global tt3
global tt1
q1 = (Sn1*1013e2+(290568.48+62852.20+15518.76)*g0)/(Isp1*g0)*1.8;%2265.59;% On prend une poussée qui nous permet tout juste de décoller %;
q2 = (62852.20+15518.76)/Isp2*1.3; %344.55;
q3 = 232.78;
tt3 = 30;
tt1 = tv+tb;
tc3 = 9131.85/q3;
tc1 = 204917.33/q1;
tc3bis = (tc3-tt3)*5+tt3;
tc1bis = (tc1-tt1)*3+tt1;
global q3bis
global q1bis
q3bis = q3/5;
q1bis = q1/3;

%Pour l'étage 1: 
theta_11 = 40*pi/180;   %angle d'initiation d'ulitilsiation de l'étage 1
t_sep_11 = 0;    %temps d'initiation d'utilisation de l'étage 1 
theta_12 = (90-74.39)*pi/180;   %angle de fin d'ulitilsiation de l'étage 1 obtenu par lecture graphique
mi_1 = 290568.48; %masse initiale etage 1
me_1 = 204917.33; %masse ergol etage 1
t_sep_12 = tc1bis+t_sep_11;   %temps de fin d'utilisation de l'étage 1

etage_1 = [theta_11;theta_12; t_sep_11; t_sep_12; mi_1; me_1]; %vecteur contenant chacune des constantes de sépation de l'étage 1

%Pour l'étage 2: 
theta_21 = theta_12;   %angle d'initiation d'ulitilsiation de l'étage 2
t_sep_21 = t_sep_12;    %temps d'initiation d'utilisation de l'étage 2
theta_22 = 60*pi/180;   %angle de fin d'ulitilsiation de l'étage 2
mi_2 = 62852.20; %masse initiale etage 2
me_2 = 41346.85; %masse ergol etage 2
t_sep_22 = me_2/q2+t_sep_21;   %temps de fin d'utilisation de l'étage 2

etage_2 = [theta_21;theta_22; t_sep_21; t_sep_22; mi_2; me_2]; %vecteur contenant chacune des constantes de sépation de l'étage 2

%Pour l'étage 3: 
theta_31 = theta_22;   %angle d'initiation d'ulitilsiation de l'étage 3
t_sep_31 = t_sep_22;    %temps d'initiation d'utilisation de l'étage 3 
theta_32 = 80*pi/180;   %angle de fin d'ulitilsiation de l'étage 3
mi_3 = 15518.76; %masse initiale etage 3
me_3 = 9131.85; %masse ergol etage 3
t_sep_32 = t_sep_31 + tc3bis;   %temps de fin d'utilisation de l'étage 3

etage_3 = [theta_31;theta_32; t_sep_31; t_sep_32; mi_3; me_3]; %vecteur contenant chacune des constantes de sépation de l'étage 3

model_etage = [etage_1, etage_2, etage_3];

%%Valeurs test


