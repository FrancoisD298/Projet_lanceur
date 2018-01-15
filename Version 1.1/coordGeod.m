function [pos_geod] = coordGeod(pos_cart)
%Entrées
%pos_cart est un vecteur 3 qui comprend:
% - x coordonnées en abscisses
% - y coordonnées en ordonnées
% - z coordonnées en hauteur

%Sorties
%pos_geod: position géodésique du point qui comprend : 
% - latgeod est la latitude géodésique en rad
% - longgeod est la longitude géodésique en rad 
% - altgeod est l'altitude géodésique en m 

%Données 
temps = 0;
global Req;
global Omegat;
global Rpo;
global e_apTer    % aplatissement terrestre

x = pos_cart(1);
y = pos_cart(2);
z = pos_cart(3);

%--------------------- Calcul de la longitude ------------------------
p = sqrt(x^2+y^2);

lc = acos(x/p);
ls = asin(y/p);

%La longitude est données en radian et va de -pi à pi
if p == 0 %nous sommes au pôle
    longgeod = 0 - Omegat*temps;
else if lc >=0 && ls >=0
    longgeod = lc +Omegat*temps;
    else if lc <=0 && ls >=0
            longgeod = lc +Omegat*temps;
        else if lc >=0 && ls<=0
                longgeod = ls + Omegat*temps;
            else if lc<0 && ls <0 
                    longgeod = -lc + Omegat*temps; %Bien prendre la valeur négative de acos
                    end
                end
            end
end
end


%---------------------- Calcul altitude et lattitude -------------------
%Initialisation: 
r = sqrt(x^2+y^2+z^2);
N(1) = Req;
h(1) = r - sqrt(Req*Rpo);
phi(1) = atan(z*(N(1)+h(1))/(p*(N(1)*(1-e_apTer^2)+h(1)))); 

%Iterations
i= 2;
A = [1,1];
ecart = 1;
%Cas au pôle à vérifier. 
while ecart > 0.01
    N(i) = Req/sqrt(1-(e_apTer*sin(phi(i-1)))^2);
    h(i) = p/cos(phi(i-1))-N(i);
    phi(i) = atan(z*(N(i)+h(i))/(p*(N(i)*(1-e_apTer^2)+h(i))));
    
    A(1) = abs((phi(i)-phi(i-1))/phi(i-1)); 
    A(2) = abs((h(i)-h(i-1))/h(i));
    
    ecart = max(A);
    i = i+1;
end

altgeod = h(i-1);
latgeod = phi(i-1);


texte=['La lattitude est: ',num2str(latgeod*360/2/pi), ' en degrés.'];
disp(texte);
texte=['La longitude est: ',num2str(longgeod*360/2/pi), ' en degrés.'];
disp(texte);
texte=['L altitude est: ',num2str(altgeod)];
disp(texte);

pos_geod(1) = latgeod;
pos_geod(2) = longgeod;
pos_geod(3) = altgeod;

end



