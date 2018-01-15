function [Xl] = X_Lcr(t, num_seq, num_etage, X_att, Y_att, Vr)
%AUTEUR: Fran�ois
%ENTREES
% E est le vecteur d'�tat 
% X_att est l'axe x du rep�re attitude (3 coordonn�es)
% Y_att est l'axe y du rep�re attitude (3 coordonn�es)
% Vr est la vitesse relative du lanceur (3 coordonn�es)

%SORTIES
% Xl est l'axe roulis du lanceur (3 coordonne�s)

%DONNEES
global gamma_b;


%----------------- CALCUL --------------------
if num_seq == 1 %Mont�e verticale
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
%doit-on sommer en coordonn�es pour la s�quence 2, 3 et 5 o� c'est correct tel quel*? 

end
