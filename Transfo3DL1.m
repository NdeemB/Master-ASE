%%%%%%%%%%%%%%%% Développé par NB %%%%%%%%%%%%%%%%
% Dessine le noyau du transformateur en 3D
function nb = Transfo3DL1 (Sfer, Wa, rSn)

% Calcul des paramètres
b = sqrt(rSn * Sfer);
h = b / rSn;
hf = Wa /(b/2);

% Définir les sommets pour la première forme
vertices = [0 0 0;
            3*b 0 0;
            3*b h 0;
            0 h 0;
            0 0 b+hf;
            3*b 0 b+hf;
            3*b h b+hf;
            0 h b+hf];

% Définir les faces pour la première forme
faces = [1 2 3 4;
         5 6 7 8;
         1 2 6 5;
         2 3 7 6;
         3 4 8 7;
         4 1 5 8];

% Définir les sommets pour la deuxième forme
vertices1 = [b/2 0 b/2;
             b 0 b/2;
             b h b/2;
             b/2 h b/2;
             b/2 0 b/2+hf;
             b 0 b/2+hf;
             b h b/2+hf;
             b/2 h b/2+hf];

% Définir les faces pour la deuxième forme
faces1 = [1 2 3 4;
          5 6 7 8;
          1 2 6 5;
          2 3 7 6;
          3 4 8 7;
          4 1 5 8];

% Définir les sommets pour la troisième forme
vertices2 = [2*b 0 b/2;
             2*b+b/2 0 b/2;
             2*b+b/2 h b/2;
             2*b h b/2;
             2*b 0 b/2+hf;
             2*b+b/2 0 b/2+hf;
             2*b+b/2 h b/2+hf;
             2*b h b/2+hf];

% Définir les faces pour la troisième forme
faces2 = [1 2 3 4;
          5 6 7 8;
          1 2 6 5;
          2 3 7 6;
          3 4 8 7;
          4 1 5 8];

% Définir les sommets du rectangle
vertices3 = [0 0 hf+b/2;
            3*b 0 hf+b/2;
            3*b h hf+b/2;
            0 h hf+b/2];

% Définir les faces du rectangle
faces3 = [1 2 3 4];

% Tracer la première forme
figure;
patch('Vertices', vertices, 'Faces', faces, 'FaceColor', 'blue', 'FaceAlpha', 0.5);
hold on;

% Tracer la deuxième forme
patch('Vertices', vertices1, 'Faces', faces1, 'FaceColor', 'red', 'FaceAlpha', 0.5);

patch('Vertices', vertices2, 'Faces', faces2, 'FaceColor', 'red', 'FaceAlpha', 0.5);

patch('Vertices', vertices3, 'Faces', faces3, 'FaceColor', 'blue', 'FaceAlpha', 0.5);

% Définir les propriétés du tracé
xlabel('Axe X');
ylabel('Axe Y');
zlabel('Axe Z');
title('Visualisation des formes 3D');
grid on;
axis equal;
view(3);
%fin
end
