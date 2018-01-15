function [rho, pa, Vson] = atmos(h)
%ENTREE
%Altitude géodésique

%SORTIE
%densité de l'air
%vitesse du son
%pression atmosphérique

%DONNEES
global HG
global RHO
global VSON

rho = spline(HG, RHO, [h]);
Vson = spline(HG, VSON, [h]);
pa = rho*Vson^2/1.4;

end