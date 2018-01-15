function [D] = drag(rho, h, Vr, Cd)
%Auteur: Fran�ois
%ENTREES
% rho est la densit� de l'air � l'altitude actuelle 
% h est l'altitude du lanceur
% Vr est la vitese relative du lanceur
% Cd est le coefficient de train�e en fonction du nombre de Mach

%SORTIES
% D est le vecteur train�e dans Req

%Donn�es: 
global Sref;

% ------------------- Calcul ---------------------------
if h <= 102426
    D = -1/2*rho*norm(Vr)^2*Sref*Cd/norm(Vr)*Vr; 
else 
    D =0;
end
%+++++++++++++++ TESTE & APPROUVE ++++++++++++++++
end