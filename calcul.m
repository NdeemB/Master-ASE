%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calcul du volume de fer et de cuivre %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [Vfer, Vcu]=calcul(Sn, Wa, Ku, rSn)
% Sn : section du noyau
% Wa : section de la fenetre
% Ku : facteur de remplissage de la fenetre
% rSn : rapport longueur b / profondeur H du noyau

% Vfer : Volume de fer
% Vcu : Volume de cuivre
% PointCM : points du CM

% Sn = b * H et rSn = b/H -> Sn = b * b / rSn  -> b = sqrt(rSn * Sn)

b = sqrt(rSn * Sn); % Distance entre les fenêtres

h = b / rSn; % Largeur du noyau

disp(' Longueur b du transformateur ');
disp(b)

disp(' Profondeur H du transformateur ');
disp(h)

% Calcul de la hauteur de la fenetre de bobinage
hf = Wa /(b/2);
disp(' Hauteur hf de la fenetre de bobinage ');
disp(hf)

% Calcul du volume de fer
Vfer = (3*b*b + 2*b*hf) * h;
disp(' Volume de fer ');
disp(Vfer)

% Calcul "rapide" du volume de cuivre
Vcu = (Wa * Ku) * (2*h + 2*b + 4*pi/2*b/4); 
disp(' Volume de cuivre associé aux bobinages ');
disp(Vcu)



