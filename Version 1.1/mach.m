function [M] = mach(Vr,Vs)
%AUTEUR: François
%ENTREES
% Vr est la vitesse relative du lanceur
% Vs est la vitesse du son de l'air à l'altitude de vol: Vs = atmos(2) 

%SORTIES
% M est le nombre de Mach

%----------------- CALCUL --------------------
M = norm(Vr)/norm(Vs);

%+++++++++++++ NON TESTE  ++++++++++++++++++++

%------------- QUESTIONS -------------
end
