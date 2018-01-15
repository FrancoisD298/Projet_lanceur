function [value, isterminal, direction] = event_etage_3(t,y)
global model_etage
value = [y(7,1)-(model_etage(5,3)-model_etage(6,3))]; %Altitude qui doit s'annuler
isterminal = [1]; %Arrête l'ODE quand elle s'annule
direction = [0]; %Toutes mes "values" doivent s'annuler

end