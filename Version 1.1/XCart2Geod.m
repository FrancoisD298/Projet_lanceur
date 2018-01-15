function [Xg] = XCart2Geod(position,t)
%ENTREE
%Position en cartésien
%Temps

%SORTIE
%Coordonnées Géodésique du point

%DONNEES
global Req;
global Rpo;
global OmegaT;

%Définition des paramètres
x = position(1);
y = position(2);
z = position(3);
p = sqrt(x^2+y^2);
r = sqrt(x^2+y^2+z^2);
e = sqrt(1-(Rpo/Req)^2);

if p==0
    if z>0
        AltGeod = z-Rpo;
    else
        AltGeod = z+Rpo;
    end
    Longi = 0;
    LatGeod = -OmegaT*t;
    
else
%Longi
lambdai1 = acos(x/p);
lambdai2 = asin(y/p);
if lambdai1>=0 && lambdai2>=0
    Longi = lambdai1-OmegaT*t;
end
if lambdai1<=0 && lambdai2>=0
    Longi = lambdai1-OmegaT*t;
end
if lambdai1>=0 && lambdai2<=0
    Longi = lambdai2-OmegaT*t;
end
if lambdai1<0 && lambdai2<0
    Longi = (-pi-lambdai2)-OmegaT*t;
end

%AltGeod et LatGeod

%Initialisation
No = Req;
AltGeodo = r-sqrt(Req*Rpo);
LatGeodo = atan((z/p)*(No+AltGeodo)/(No*(1-e^2)+AltGeodo));

%Recurrence
%Premiers termes
N = Req/sqrt(1-e^2*(sin(LatGeodo))^2);
AltGeod = p/cos(LatGeodo)-N;
LatGeod = atan((z/p)*(N+AltGeod)/(N*(1-e^2)+AltGeod));

DAltGeod = 1;%Initialistation des critères de convergence
DLatGeod = 1;

while DAltGeod>0.001 && DLatGeod>0.001
    N = Req/sqrt(1-e^2*(sin(LatGeod))^2);
    AltGeodnew = p/cos(LatGeod)-N;
    LatGeodnew = atan((z/p)*(N+AltGeodnew)/(N*(1-e^2)+AltGeodnew));
    
    DAltGeod = AltGeodnew-AltGeod;
    DLatGeod = LatGeodnew-LatGeod;
    
    LatGeod = LatGeodnew;
    AltGeod = AltGeodnew;
end

end %fin du if p==0

Xg = [AltGeod, Longi, LatGeod];
end