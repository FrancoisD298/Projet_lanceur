function [pos_cart] = coordCart(pos_geod,temps)
%Entr�es
%pos_geod est un vecteur 3 qui comprend : 
%  - latgeod est la longitude g�od�sique en rad
%  - longgeod est l'altitude g�od�sique en rad
%  - altgeod est la latitude g�od�sique en m

%Sorties
%x coordonn�es en abscisses
%y coordonn�es en ordonn�es
%z est l'altitude

%Donn�es
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

text = ['La position cart�sienne du point est: ', num2str(pos_cart(1)), ', ', num2str(pos_cart(2)), ',', num2str(pos_cart(3))];
disp(text);

end
