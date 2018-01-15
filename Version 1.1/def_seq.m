function [num_sequence, num_etage] = def_seq(t)

global tv
global tb
global ta
global model_etage

tc1 = model_etage(4,1)-model_etage(3,1); %temps d'utilisation du premier étage
tc2 = model_etage(4,2)-model_etage(3,2); %temps d'utilisation du 2e étage
tc3 = model_etage(4,3)-model_etage(3,3); %temps d'utilisation du 3e étage


if t<tv && t>=0
    num_sequence = 1;
    num_etage = 1;
elseif t>=tv && t<tv+tb
    num_sequence = 2;
    num_etage = 1;
elseif t>=tv+tb && t<ta
    num_sequence = 3;
    num_etage = 1;
elseif t>=ta && t<tc1
    num_sequence = 4;
    num_etage = 1;
elseif t>=tc1 && t<tc2+tc1
    num_sequence = 5;
    num_etage = 2;
else %t>=tc1+tc2 && t<model_etage(4,3)
    num_sequence = 5;
    num_etage = 3;
end

end