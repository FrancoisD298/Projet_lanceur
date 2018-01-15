function [Req, MomCin,pOrbite,eOrbite, a_dga,exc,pos_prg,pos_apg,incl] = trajectoire_final(position, vitesse)
%Entr�es
%position: vecteur position en 3D : x, y ,z
%vitesse: vecteur vitesse en 3D: Vx, Vy, Vz

%Sorties
%Req vecteur param�tres orbitaux en 6D : x, y ,z, Vx, Vy, Vz
%MomCin est le moment cin�tique en 3D: hx, hy, hz
%pOrbite est le param�tre de l'orbite
%eObrite est l'�nergie de l'orbite
%a_dga est le demi grand axe de l'orbite
%exc est l'excentricit� de l'obrite
%pos_prg est la distance entre la terre et le p�rig�e de l'orbite.
%pos_apg est la distance entre la terre et l'apog�e de l'orbite.
%incl est l'inclinaison de la fus�e par rapport � la surface terrestre. 
%anm_vr est l'anomalie vraie de la trajectoire 

%Donn�es
global mu;
norm_pos = sqrt(position*transpose(position));
norm_vit = sqrt(vitesse*transpose(vitesse));

%Calcul moment cin�tique
MomCin = cross(position, vitesse);
norm_MC = sqrt(MomCin*transpose(MomCin));

%Param�tre de l'orbite
pOrbite = nomr_MC^2/mu;

%Energie de l'orbite
eOrbite = norm_vit^2/2-mu/norm_pos;

%Demi grand axe a
a_dga = mu*norm_pos/(2*mu-nomr_vit^2*nomr_pos);

%Excentricit�
exc = sqrt(1-pOrbite/a_dga);

%P�rig�e
pos_prg = a_dga*(1-exc);

%Apog�e
pos_apg = a_dga*(1+exc);

%Inclinaison 
incl = acos(MomCin(3)/norm_MC);% arevoir en fonction des valeurs de la division car 0<i<180�

%Anomalie vraie
anm_vr = acos(1/exc*(pOrbite/norm_pos));%A revoir en fonction des valeurs positives ou non de 

%longitude noeud ascendant

%argument du p�rig�e

%------------- INCOMPLET ------------------------

end
