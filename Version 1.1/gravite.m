function [grav] = gravite(position)

%Entrée : position, vecteur position en x, y ,z (depuis la surface de la
%Terre)
%Sortie : grav, vecteur gravité en 3 dimensions

%constantes
global mu;
global Cj;

%Initialisation
grav = [0,0,0];
x = position(1);
y = position(2);
z = position(3);

r = sqrt(x^2+y^2+z^2);
A = mu + 3*Cj*(1-5*z^2/r^2)/r^2;
A_r3 = A/(r^3);                     %A/r^3 

%Calcul de la gravité
grav(1) = -x*A_r3;
grav(2) = -y*A_r3;
grav(3) = -z*A_r3-6*Cj*z/(r^5);

%Testé et validé en [Req,0,0]; [0, Rpo, 0]; [Req*cos(pi/4), Rpo*sin(pi/4),0]

end
