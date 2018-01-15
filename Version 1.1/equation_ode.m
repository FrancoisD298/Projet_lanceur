function [E_der] = equation_ode(t,E)
%ENTREE
%Vecteur d'état (une colonne)
%Temps

%SORTIE
%Dérivée des variables d'état par rapport au temps
disp(t);
disp(E(7,1));
%DONNEES
global Az
global q1
global q2
global DR
global RHOO
global q3
global ALT
global THETA
global QQ
global VR
global MACH
global POUSSEE
global TEMPS
global INCI
global ACC
global FLUX
global PDYN
global g0
global gamma_b
global tb
global tv
global PA
global model_etage
global tt3
global q3bis
global Sn1
global Sn2
global Sn3
global tt1
global q1bis
global BETA

global Enquete
global Isp1
global Isp3
global Isp2
%% Données
[num_sequence, num_etage] = def_seq(t);
if num_etage == 1
    if t < tt1
        q = q1;
    else
        q = q1bis;
    end
    Sn = Sn1;
elseif num_etage == 2
    q = q2;
    Sn = Sn2;
elseif num_etage == 3
    Sn = Sn3;
    if t < model_etage(3,3)+ tt3
        q = q3;
    else
        q = q3bis;
    end
end


E_der = zeros(7, 1);

E_der(1,1) = E(4,1);
E_der(2,1) = E(5,1);
E_der(3,1) = E(6,1);

E_der(7,1) = -q;

%%----------------------------------------------------------

%Calcul de l'accélération
position = E(1:3,1)';
[h, lambda, phi] = CoordGeodClement(position, t);
%%
%Poids
g = gravite(position);
P = poids(E(7,1),g);

%%
%Poussée

%Calcul de X_lanceur
[X_ramp, Y_ramp, Z_ramp]    = Cart2Ramp(t, lambda, phi);
[X_att, Y_att, Z_att]       = Ramp2Att(Az, X_ramp, Y_ramp, Z_ramp);
Vr                          = v_rel(E);
Xl                          = X_Lcr(t, num_sequence,num_etage, X_att, Y_att, Vr);

%Calcul de Pa
[rho, Pa, Vs] = atmos(h);

T = thrust(q, num_etage, Xl, Pa);

if num_etage == 1
    enquete = q*g0*Isp1*Xl;
elseif num_etage == 2
    enquete = q*g0*Isp2*Xl;
elseif num_etage == 3
    enquete = q*g0*Isp3*Xl;
end

%Trainée

%Calcul de Cd
M = mach(Vr,Vs);
Cd = coeffD(M);

D = drag(rho, h, Vr, Cd);

%%
gamma = (D+T+P)/E(7,1);

E_der(4,1) = gamma(1);
E_der(5,1) = gamma(2);
E_der(6,1) = gamma(3);

% Angle d'assiette
if num_sequence == 1
    theta = 0;
elseif num_sequence == 2
    theta = gamma_b*(t-tv)/tb;
elseif num_sequence == 3
    theta = gamma_b;
elseif num_sequence == 4
    theta = acos(dot(Xl, X_att)/(norm(Xl)*norm(X_att)));
elseif num_sequence == 5
    theta = acos(dot(Xl, X_att)/(norm(Xl)*norm(X_att)));%theta_t(t, num_etage);
end

MACH = horzcat(MACH, [M]);
ALT = horzcat(ALT, [h/1000]);
VR = horzcat(VR, [norm(Vr)]);
ACC = horzcat(ACC, norm(gamma)/g0);
TEMPS = horzcat(TEMPS, [t]);
POUSSEE = horzcat(POUSSEE, [norm(T)]);
PA = horzcat(PA, [Pa]);
INCI = horzcat(INCI, [dot(Vr, Xl)/(norm(Xl)*norm(Vr))]);
QQ = horzcat(QQ, [q]);
RHOO = horzcat(RHOO, [rho]);
BETA = horzcat(BETA, [dot(Vr, X_att)/(norm(Vr)*norm(X_att))]);
DR = horzcat(DR, [norm(D)]);
Enquete = horzcat(Enquete, [norm(Xl)]);

if h > 102426
     pdyn = 0;
     flux_thermique = 0;
else
    pdyn = 0.5*rho*norm(Vr)^2,
    flux_thermique = 0.5*rho*norm(Vr)^3;
end
PDYN = horzcat(PDYN, [pdyn]);
FLUX = horzcat(FLUX, [flux_thermique]);
THETA = horzcat(THETA, [rad2deg(theta)]);
end