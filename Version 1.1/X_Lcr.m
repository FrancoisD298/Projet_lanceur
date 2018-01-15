function [Xl] = X_Lcr(t, num_seq, num_etage, X_att, Y_att, Vr)
%AUTEUR: François
%ENTREES
% E est le vecteur d'état 
% X_att est l'axe x du repère attitude (3 coordonnées)
% Y_att est l'axe y du repère attitude (3 coordonnées)
% Vr est la vitesse relative du lanceur (3 coordonnées)

%SORTIES
% Xl est l'axe roulis du lanceur (3 coordonneés)

%DONNEES
global gamma_b;


%----------------- CALCUL --------------------
if num_seq == 1 %Montée verticale
    Xl = X_att;
elseif num_seq == 2 % Basculement
    gamma = gamma_t(t);
    Xl = cos(gamma)*X_att+sin(gamma)*Y_att;
elseif num_seq == 3 % Convergence vers l'incidence nulle
    Xl = cos(gamma_b)*X_att + sin(gamma_b)*Y_att;
elseif num_seq == 4 %incidence nulle
    Xl = Vr/norm(Vr);
elseif num_seq == 5 % Commande assiette
    theta = theta_t(t, num_etage);%non complet
    Xl = cos(theta)*X_att+sin(theta)*Y_att;
end
    

%+++++++++++++ NON TESTE  ++++++++++++++++++++
%------------- QUESTION NON ELUCIDEE -------------
%doit-on sommer en coordonnées pour la séquence 2, 3 et 5 où c'est correct tel quel*? 

end
