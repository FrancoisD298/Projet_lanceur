function [pos_cart] = coordCart(pos_geod,temps)
%Entrées
%pos_geod est un vecteur 3 qui comprend : 
%  - latgeod est la longitude géodésique en rad
%  - longgeod est l'altitude géodésique en rad
%  - altgeod est la latitude géodésique en m

%Sorties
%x coordonnées en abscisses
%y coordonnées en ordonnées
%z est l'altitude

%Données
global Req;
global e_apTer;
global Omegat;       %en rad.s-1

latgeod = pos_geod(1);
longgeod = pos_geod(2);
altgeod = abs(pos_geod(3));

N = Req/sqrt(1-e_apTer^2*sin(latgeod)^2);

pos_cart(1) = (N+altgeod)*cos(latgeod)*cos(longgeod+Omegat*temps);
pos_cart(2)= (N+altgeod)*cos(latgeod)*sin(longgeod+Omegat*temps);
pos_cart(3) = (N*(1-e_apTer^2)+altgeod)*sin(latgeod);

text = ['La position cartésienne du point est: ', num2str(pos_cart(1)), ', ', num2str(pos_cart(2)), ',', num2str(pos_cart(3))];
disp(text);

end
