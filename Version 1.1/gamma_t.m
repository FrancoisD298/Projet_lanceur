function [gamma] = gamma_t(t)
%Auteur : François
%ENTREES
% t est le temps
% tv est la durée de la séquence 1 (connue)
% tb est la durée de la séquence 2 (connue)
% gamma_b est une constante, ça correspond au basculement du lanceur avant de converger vers l'incidence nulle (pas tout à fait déterminer pour l'instant)

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
