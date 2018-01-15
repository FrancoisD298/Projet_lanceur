function [theta] = theta_t(t, num_etage)
%AUTEUR: François
%ENTREES
% t  est le temps, en s
% num_etage est le numéro d l'étage en cours d'utilisation, valeur 1, 2 ou
%           3, important à ne pas modifier ces possibilités
% le reste des données sont des constantes du lanceur 

%SORTIES
% theta est la valeur de tehta (angle assiette) à l'instant t correspondant
%       à l'utilsiation étage précis

%DONNEES
global model_etage;

%----------------- CALCUL --------------------
etage = model_etage(:,num_etage);   %on récupère les données de l'étage

theta = etage(1) + (etage(2)-etage(1))/(etage(4)-etage(3))^2*(t-etage(3))^2; % formule du poly

%+++++++++++++ NON TESTE  ++++++++++++++++++++
%------------- QUESTIONS -------------
% Ici etage 1 et 2 sont les angles d'assiettes
% etage 3 et 4 sont les temps d'initiation et séparation de l'étage (Voir
%               Constantes). 
end
