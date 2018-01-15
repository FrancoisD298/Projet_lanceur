function [MCin, ParamOrb, NrjOrb, dga, excent, perig, apog, inclin, anomvr, LongiNA, perigArg]=ParamOrbitaux(position, vitesse)

global mu;

%Paramètres
V = norm(vitesse);
r = norm(position);
x = position(1);
y = position(2);

%Moment Cinétique
MCin = cross(position,vitesse);
hx = MCin(1);
hy = MCin(2);
hz = MCin(3);

%Parmètre de l'orbite
ParamOrb = norm(MCin)^2/mu;

%Energie de l'orbite
NrjOrb = V^2/2-mu/r;

%Demi-grand axe
dga = 1/(2/r-V^2/mu);

%excentricité
excent = sqrt(1-ParamOrb/dga);

%Apogée et périgée
perig = dga*(1-excent);
apog = dga*(1+excent);

%Inclinaison
inclin = acos(hz/norm(MCin));

%Anomalie Vraie
anomvr = acos((ParamOrb/r-1)/excent);

%Longitude du noeud Ascendant
LongiNA1 = asin(hx/sqrt(hx^2+hy^2));
LongiNA2 = acos(-hy/sqrt(hx^2+hy^2));

if LongiNA2>=0 && LongiNA1>=0
    LongiNA = LongiNA2-OmegaT*t;
end
if LongiNA2<=0 && LongiNA1>=0
    LongiNA = LongiNA2-OmegaT*t;
end
if LongiNA2>=0 && LongiNA1<=0
    LongiNA = LongiNA1-OmegaT*t;
end
if LongiNA2<0 && LongiNA1<0
    LongiNA = (-pi-LongiNA1)-OmegaT*t;
end

%Argument du Périgée
perigArg1 = asin((y*cos(LongiNA)-x*sin(LongiNA))/(r*cos(inclin)))-anomvr;
perigArg2 = acos((x*cos(LongiNA)+y*sin(LongiNA))/r)-anomvr;

if perigArg2>=0 && perigArg1>=0
    perigArg = perigArg2-OmegaT*t;
end
if perigArg2<=0 && perigArg1>=0
    perigArg = perigArg2-OmegaT*t;
end
if perigArg2>=0 && perigArg1<=0
    perigArg = perigArg1-OmegaT*t;
end
if perigArg2<0 && perigArg1<0
    perigArg = (-pi-perigArg1)-OmegaT*t;
end

end