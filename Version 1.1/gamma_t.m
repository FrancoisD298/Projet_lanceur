function [gamma] = gamma_t(t)
%Auteur : Fran�ois
%ENTREES
% t est le temps
% tv est la dur�e de la s�quence 1 (connue)
% tb est la dur�e de la s�quence 2 (connue)
% gamma_b est une constante, �a correspond au basculement du lanceur avant de converger vers l'incidence nulle (pas tout � fait d�terminer pour l'instant)

%SORTIES
% gammma est l'angle 

%DONNEES
global tv;
global tb;
global gamma_b;

%Calcul
gamma = gamma_b*(t-tv)/tb;

%+++++++++++++ NON TESTE  ++++++++++++++++++++
end
