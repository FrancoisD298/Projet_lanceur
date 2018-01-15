%Ensembles des paramètres du lanceur

%variables globales
global q; 
global Isp;
global Sn;
global g0;
global Sref; 

global tv;
global tb;
global t_etage;
global theta_etage;
global num_etage;
global assiette;
assiette = zeros(num_etage*2,1);

%Valeur des variables: 
q = 1;
Isp = 1;
Sn = 1;
g0 = 1;
Sref = 1;
for i = 1:2:num_etage*2
    assiette(i) = t_etage;
    assiette(i+1) = theta_etage;
end    