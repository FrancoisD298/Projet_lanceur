function [AltGeod, Longi, LatGeod] = CoordGeodClement(position, t)

%Importation des constantes
global Req;
global Rpo;
global Omegat

%Définition des paramètres
x = position(1);
y = position(2);
z = position(3);
p = sqrt(x^2+y^2);
r = sqrt(x^2+y^2+z^2);
e = sqrt(1-(Rpo/Req)^2);
T = t;

%Longi
lambdai1 = acos(x/p);
lambdai2 = asin(y/p);
Longi = 1;
if and(lambdai1>=0, lambdai2>=0)
    Longi = lambdai1-Omegat*T;
end
if lambdai1<=0 && lambdai2>=0
    Longi = lambdai1-Omegat*T;
end
if lambdai1>=0 && lambdai2<=0
    Longi = lambdai2-Omegat*T;
end
if lambdai1<0 && lambdai2<0
    Longi = (-pi-lambdai2)-Omegat*T;
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

while abs(DAltGeod)>0.001 && abs(DLatGeod)>0.001
    N = Req/sqrt(1-e^2*(sin(LatGeod))^2);
    AltGeodnew = p/cos(LatGeod)-N;
    LatGeodnew = atan((z/p)*(N+AltGeodnew)/(N*(1-e^2)+AltGeodnew));
    
    DAltGeod = AltGeodnew-AltGeod;
    DLatGeod = LatGeodnew-LatGeod;
    
    LatGeod = LatGeodnew;
    AltGeod = AltGeodnew;
end
% 
% texte=['La longitude est: ',num2str(Longi*360/2/pi), ' en degrés.'];
% disp(texte);
% texte=['La lattitude est: ',num2str(LatGeod*360/2/pi), ' en degrés.'];
% disp(texte);
% texte=['L altitude est: ',num2str(AltGeod)];
% disp(texte);
end