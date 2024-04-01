function [H, Signal_correle] = Creation_signal_correle(N, sigma, moyenne, X, nombre_valeur)
% Calcul des coefficients de corrélation
a = 1/(2^0.5);
b = a;
% Génération d'un signal aléatoire non corrélé
Signal = randn(N + 1, nombre_valeur) * sigma + moyenne;

% Génération d'un signal corrélé en combinant le signal aléatoire avec son voisin
Signal_correle = zeros(N, nombre_valeur);
for j = 1:N
    Signal_correle(j, :) = a * Signal(j, :) + b * Signal(j + 1, :);
    Signal_correle(j, nombre_valeur/2 + 1:end) = Signal_correle(j, nombre_valeur/2 + 1:end) + X(j);
end

% Création du vecteur de réponse impulsionnelle H
H = [zeros(1, nombre_valeur/2), ones(1, nombre_valeur/2)];
end