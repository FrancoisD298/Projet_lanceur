function [value, isterminal, direction] = event_etage_2(t,y)
global model_etage
value = [y(7,1)-(sum(model_etage(5,2:3))-model_etage(6,2))]; %Altitude qui doit s'annuler
isterminal = [1]; %Arrête l'ODE quand elle s'annule
direction = [0]; %Toutes mes "values" doivent s'annuler

end