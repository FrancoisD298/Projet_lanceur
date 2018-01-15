function [v_rel] = v_rel(E)
%ENTREES
% E est le vecteur d'état 

%SORTIES
% v_rel est le vecteur vitesse relative qui contient 3 variables: Vrx, Vry, Vrz

%DONNEES
global Omegat
x=E(1,1); y=E(2,1); z=E(3,1);
v_x = E(4,1); v_y=E(5,1);v_z=E(6,1);

%-----------------  CALCUL --------------------
v_rel(1) = v_x + Omegat*y;
v_rel(2) = v_y - Omegat*x;
v_rel(3) = v_z;

%+++++++++++++ NON TESTE  ++++++++++++++++++++
end
