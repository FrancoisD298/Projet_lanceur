function [M] = mach(Vr,Vs)
%AUTEUR: Fran�ois
%ENTREES
% Vr est la vitesse relative du lanceur
% Vs est la vitesse du son de l'air � l'altitude de vol: Vs = atmos(2) 

%SORTIES
% M est le nombre de Mach

%----------------- CALCUL --------------------
M = norm(Vr)/norm(Vs);

%+++++++++++++ NON TESTE  ++++++++++++++++++++

%------------- QUESTIONS -------------
end
