function [X_Lcr, Y_Lcr, Z_Lcr]=Att2Lcr(theta, X_att, Y_att, Z_att)
%ENTREE
%Angle de tangage
%Corrdonn�es dans Req des vecteurs du rep�res Attitude

%SORTIE
%Coordonn�es dans Req des vecteurs du rep�res Lanceur

%DONNEES
%NaN

X_Lcr = cos(theta)*X_att + sin(theta)*Y_att;
Y_Lcr = -sin(theta)*X_att + cos(theta)*Y_att;
Z_Lcr = Z_att;
end