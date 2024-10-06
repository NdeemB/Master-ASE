%%%%%%%%%%%%%%%% Développé par NB %%%%%%%%%%%%%%%%
% Dessine les lamelles du transformateur en 3d
function n = lamelles3d1(Sfer, Wa, rSn, num_lamellas)

% Calcul des paramètres
b = sqrt(rSn * Sfer);
h = b / rSn;
hf = Wa / (b / 2);

lamella_positions = 0: h/num_lamellas: h; % déterminer la position de lammelle

% Initialiser une variable pour suivre si le code a déjà été exécuté
code_executed = false;

% Boucle à travers chaque position de lamelle et tracer la lamelle
for i = 1:length(lamella_positions)
    % Vérifier si le code a déjà été exécuté
    if code_executed
        break;
    end
    
    pos = lamella_positions(i);
    y_offset = pos;

    % Définir les sommets pour la lamelle  
    vertices_lamella = [0 y_offset 0;
                        3*b y_offset 0;
                        3*b y_offset b+hf;
                        0 y_offset b+hf;
                        0 y_offset 0;
                        3*b y_offset 0;
                        3*b y_offset b+hf;
                        0 y_offset b+hf];

    % Définir les faces pour la lamelle
    faces_lamella = [1 2 3 4;
                     5 6 7 8;
                     1 2 6 5;
                     2 3 7 6;
                     3 4 8 7;
                     4 1 5 8];

    % Tracer la lamelle
    patch('Vertices', vertices_lamella, 'Faces', faces_lamella, 'FaceColor', 'b', 'FaceAlpha', 0.2);

    % Marquer le code comme exécuté
    code_executed = false;
end
