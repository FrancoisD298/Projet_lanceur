function [Req, MomCin,pOrbite,eOrbite, a_dga,exc,pos_prg,pos_apg,incl] = trajectoire_final(position, vitesse)
%Entrées
%position: vecteur position en 3D : x, y ,z
%vitesse: vecteur vitesse en 3D: Vx, Vy, Vz

%Sorties
%Req vecteur paramètres orbitaux en 6D : x, y ,z, Vx, Vy, Vz
%MomCin est le moment cinétique en 3D: hx, hy, hz
%pOrbite est le paramètre de l'orbite
%eObrite est l'énergie de l'orbite
%a_dga est le demi grand axe de l'orbite
%exc est l'excentricité de l'obrite
%pos_prg est la distance entre la terre et le périgée de l'orbite.
%pos_apg est la distance entre la terre et l'apogée de l'orbite.
%incl est l'inclinaison de la fusée par rapport à la surface terrestre. 
%anm_vr est l'anomalie vraie de la trajectoire 

%Données
global mu;
norm_pos = sqrt(position*transpose(position));
norm_vit = sqrt(vitesse*transpose(vitesse));

%Calcul moment cinétique
MomCin = cross(position, vitesse);
norm_MC = sqrt(MomCin*transpose(MomCin));

%Paramètre de l'orbite
pOrbite = nomr_MC^2/mu;

%Energie de l'orbite
eOrbite = norm_vit^2/2-mu/norm_pos;

%Demi grand axe a
a_dga = mu*norm_pos/(2*mu-nomr_vit^2*nomr_pos);

%Excentricité
exc = sqrt(1-pOrbite/a_dga);

%Périgée
pos_prg = a_dga*(1-exc);

%Apogée
pos_apg = a_dga*(1+exc);

%Inclinaison 
incl = acos(MomCin(3)/norm_MC);% arevoir en fonction des valeurs de la division car 0<i<180°

%Anomalie vraie
anm_vr = acos(1/exc*(pOrbite/norm_pos));%A revoir en fonction des valeurs positives ou non de 

%longitude noeud ascendant

%argument du périgée

%------------- INCOMPLET ------------------------

end
