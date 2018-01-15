function [T] = thrust(q, num_etage, Xl,Pa)
%ENTREES
% Xl vecteur de l'axe lanceur dans le Req
% Pa pression atmosphérique à l'altitude actuelle

%SORTIES
% T est le vecteur poussée en N composé de 3 composantes: Tx, Ty, Tz dans
% Req

%Données: 
global g0;
global Isp1
global Isp2
global Isp3
global Sn1
global Sn2
global Sn3

% ------------------- Calcul ---------------------------
if num_etage == 1
    T = (q*g0*Isp1-Sn1*Pa)*Xl;
elseif num_etage == 2
    T = (q*g0*Isp2-Sn2*Pa)*Xl;
elseif num_etage == 3
    T = (q*g0*Isp3-Sn3*Pa)*Xl;
end

if norm(T)<0
    disp('T lost')
end
%+++++++++++++++ TESTE & APPROUVE ++++++++++++++++
end