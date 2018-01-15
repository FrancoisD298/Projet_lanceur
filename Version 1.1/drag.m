function [D] = drag(rho, h, Vr, Cd)
%Auteur: François
%ENTREES
% rho est la densité de l'air à l'altitude actuelle 
% h est l'altitude du lanceur
% Vr est la vitese relative du lanceur
% Cd est le coefficient de trainée en fonction du nombre de Mach

%SORTIES
% D est le vecteur trainée dans Req

%Données: 
global Sref;

% ------------------- Calcul ---------------------------
if h <= 102426
    D = -1/2*rho*norm(Vr)^2*Sref*Cd/norm(Vr)*Vr; 
else 
    D =0;
end
%+++++++++++++++ TESTE & APPROUVE ++++++++++++++++
end