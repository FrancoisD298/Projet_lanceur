function [X_att, Y_att, Z_att] = Ramp2Att(Az, X_ramp, Y_ramp, Z_ramp)
%ENTREE
%Angle d'azimut
%Corrdonnées dans Req des vecteurs du repères Rampe

%SORTIE
%Coordonnées dans Req des vecteurs du repères Attitude

%DONNEES
%NaN

X_att = Z_ramp;
Y_att = sin(Az)*X_ramp + cos(Az)*Y_ramp;
Z_att = -cos(Az)*X_ramp + sin(Az)*Y_ramp;
end