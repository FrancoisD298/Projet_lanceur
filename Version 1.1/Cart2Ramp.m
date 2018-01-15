function [X_ramp, Y_ramp, Z_ramp] = Cart2Ramp(t, lambda, phi)
%ENTREE
%Longitude inertielle des coordonn�es g�od�siques
%Latitude des coordonn�es g�od�siques

%SORTIE
%Rep�re de la Rampe (RD0)

%DONNEES
% NaN
global Omegat
%CALCUL
lambda = lambda+Omegat*t;
X_ramp = [-sin(lambda), cos(lambda), 0];
Y_ramp = [-cos(lambda)*sin(phi), -sin(lambda)*sin(phi), cos(phi)];
Z_ramp = [cos(lambda)*cos(phi), sin(lambda)*cos(phi), sin(phi)];
% Version originale du code :
% Y_ramp = [-cos(lambda).*sin(phi), sin(lambda)*sin(phi), cos(phi)];
% Z_ramp = [cos(lambda).*cos(phi), sin(lambda)*cos(phi), sin(phi)];

end