function [position] = XGeod2Cart(Geod, t)
%ENTREE
%Coordonnées géodésiques
%Temps

%SORTIE
%Position cartésienne

position = zeros(3,1);
%DONNEES
global Req;
global Rpo;
global OmegaT;

%Données du problème
lambdai = Geod(1,2)+OmegaT*t;
phi = Geod(1,3);
hg = Geod(1,1);
e = sqrt(1-Rpo^2/Req^2);
N = Req/sqrt(1-e^2*sin(phi)^2);

%Calcul
position(1,1) = (N+hg)*cos(phi)*cos(lambdai);
position(1,2) = (N+hg)*cos(phi)*sin(lambdai);
position(1,3) = (N*(1-e^2)+hg)*sin(phi);

end