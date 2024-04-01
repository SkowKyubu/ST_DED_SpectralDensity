function [H, Signal] = Creation_signal(N, sigma, moyenne, X, nombre_valeur)
% Génération d'un premier signal aléatoire
signal1 = randn(N, nombre_valeur/2) * sigma + moyenne;
% Génération d'un second signal en ajoutant une valeur X(i) à chaque colonne du premier signal
signal2 = zeros(N, nombre_valeur/2);
for i = 1:N
    signal2(i, :) = randn(1, nombre_valeur/2) * sigma + moyenne + X(i);
end

% Concaténation des deux signaux en un seul signal
Signal = [signal1, signal2];

% Création du vecteur de réponse impulsionnelle H
H = [zeros(1, nombre_valeur/2), ones(1, nombre_valeur/2)];
end