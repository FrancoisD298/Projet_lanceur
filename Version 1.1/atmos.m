function [rho, pa, Vson] = atmos(h)
%ENTREE
%Altitude g�od�sique

%SORTIE
%densit� de l'air
%vitesse du son
%pression atmosph�rique

%DONNEES
global HG
global RHO
global VSON

rho = spline(HG, RHO, [h]);
Vson = spline(HG, VSON, [h]);
pa = rho*Vson^2/1.4;

end