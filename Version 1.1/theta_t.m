function [theta] = theta_t(t, num_etage)
%AUTEUR: Fran�ois
%ENTREES
% t  est le temps, en s
% num_etage est le num�ro d l'�tage en cours d'utilisation, valeur 1, 2 ou
%           3, important � ne pas modifier ces possibilit�s
% le reste des donn�es sont des constantes du lanceur 

%SORTIES
% theta est la valeur de tehta (angle assiette) � l'instant t correspondant
%       � l'utilsiation �tage pr�cis

%DONNEES
global model_etage;

%----------------- CALCUL --------------------
etage = model_etage(:,num_etage);   %on r�cup�re les donn�es de l'�tage

theta = etage(1) + (etage(2)-etage(1))/(etage(4)-etage(3))^2*(t-etage(3))^2; % formule du poly

%+++++++++++++ NON TESTE  ++++++++++++++++++++
%------------- QUESTIONS -------------
% Ici etage 1 et 2 sont les angles d'assiettes
% etage 3 et 4 sont les temps d'initiation et s�paration de l'�tage (Voir
%               Constantes). 
end
