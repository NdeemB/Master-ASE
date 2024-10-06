% Matlab code pour calculater le volume de fer et de cuivre d'un transformateur monophasé 
%%%%%%%%%%%%%%%% Modifié par NB %%%%%%%%%%%%%%%%

clear 
clc

V1= 230;  % Tension d'alimentation primaire [V]
V2= 50;   % Tension d'alimentaion secondaire [V]
f= 50;   % Frequence EDF [HZ]
S= 1.5e3; % Puissance apparente du transformateur [VA]
Bmax= 1;  % Induction magnetique [Tesla]
Jmax= 5e6; % Flux de courant [A/m2]
Kv= 2*pi/sqrt(2); % Facteur de forme de la tension
Ku= 0.8; % Facteur de remplisage
Wa= 30e-4; % Surface utile de la fenêtre [mm2]
rSn = 1; % Rapport longueur b / profondeur H du noyau

Wa(1:11) = 0; % initialisation 


for i=1:11 % Nombre d'itérations pour proposer nombreux designs

    Wa(i)=11e-4+(i-1)*2e-4; % Calcul de 10 cm2 à 30 cm2


    Sfer(i)= (2*S/(Ku*Wa(i)*f*Bmax*Jmax*Kv)); % Section du noyau [m2]


    [Vfer(i),Vcu(i)]=calcul(Sfer(i),Wa(i),Ku,rSn); % Applle la fonction "calcul" pour calculer le volume de fer et cuivre m3


    Vtot(i)= Vfer(i)+Vcu(i); % Calcul le volume total 

    

end

%Tdt = 0.4572; % épaisseur de tôle

nt =  10; % nombre de tôles 

for k = 1:11

    Transfo3DL1(Sfer(k),Wa(k),rSn) % Applle la fonction "Transfo3DL1" pour dessiner les designs proposés en 3D


    lamelles3d1 (Sfer(k),Wa(k),rSn,nt) %  Applle la fonction "lamelles3d1" pour dessiner les lamelles du noyau selon leur numéro

end

Wa1 = Wa*1e4;
n = 1:11;
% Créer une figure avec une grille de sous-graphes de 2x2 et sélectionner le premier sous-graphe
subplot (2,2,1)
% Tracer les données Vtot en fonction de n avec des cercles rouges et une ligne continue
plot (Wa1,Vtot,'r-o',"LineWidth",2)
% Ajouter une étiquette à l'axe des abscisses
xlabel('surface de la fenêtre cm2');
% Ajouter une étiquette à l'axe des ordonnées
ylabel('m3');
% Ajouter un titre au graphique
title('Volume total');
% sélectionner le deuxiem sous-graphe
subplot (2,2,2)
% Tracer les données Sfer en fonction de n avec des cercles blues et une ligne continue
plot (Wa1,Sfer*1e4,'b-o',"LineWidth",2)
% Ajouter une étiquette à l'axe des ordonnées
ylabel('cm2');
% Ajouter un titre au graphique
title('Surface du noyau');
xlabel('surface de la fenêtre cm2');
% sélectionner le 3em sous-graphe
subplot (2,2,3)
% Tracer les données Vfer en fonction de n avec des cercles blackes et une ligne continue
plot (Wa1,Vfer,'k-o',"LineWidth",2)
% Ajouter une étiquette à l'axe des ordonnées
xlabel('surface de la fenêtre cm2');
% Ajouter une étiquette à l'axe des ordonnées
ylabel('m3');
% Ajouter un titre au graphique
title('Volume de fer');
% sélectionner le 4em sous-graphe
subplot (2,2,4)
% Tracer les données Vcu en fonction de n avec des cercles verts et une ligne continue
plot (Wa1,Vcu,'g-o',"LineWidth",2)
% Ajouter une étiquette à l'axe des ordonnées
xlabel('surface de la fenêtre cm2');
% Ajouter une étiquette à l'axe des ordonnées
ylabel('m3');
% Ajouter un titre au graphique
title('Volume de cuivre');

%couleur = [0.8500 0.3250 0.0980];	
%subplot (2,2,2)
%plot (n,Vcu,'Color', couleur)
%xlabel('numero de figure');
%ylabel('m3');
%title('Volume de cuivre');
