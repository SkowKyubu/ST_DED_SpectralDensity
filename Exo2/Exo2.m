clear clc
clear all

% Initialisation des variables
c = 0.8; % Coefficient de corrélation entre Yk et Vk
sigma = 0.5; % Ecart-type du bruit
d = -2.05; % Décalage du signal
pd = 0.9; % Probabilité de détection
N = 1; % Nombre d'échantillons par symbole
nombre_valeurs = 10000; % Nombre de valeurs pour générer le signal
seuil = 2; % Seuil de détection

% Générer le signal de base et le canal
[H,Signal] = Creation_signal_exo2(N, sigma, nombre_valeurs);

% Appliquer le bloc linéaire d'ordre 1 sur le signal de base pour obtenir le signal Yk
Signal_Yk = bloc_lineaire_ordre_1(Signal, 1, c, N);

% Calculer les probabilités de détection et de fausse alarme pour différentes valeurs de seuil
for i = -2000:1:4000
[pd_test(i+2001), pfa_test(i+2001)] = Detecteur_exo2(nombre_valeurs, i/1000, Signal_Yk, H, seuil);
end

% Afficher la courbe de caractéristique d'opération du récepteur (COR) en Yk
figure()
plot(pfa_test, pd_test);
title("Coube COR en Yk pour N=1")
xlabel("pfa")
ylabel("pd")

% Appliquer le bloc linéaire d'ordre 1 sur le signal Yk pour obtenir le signal Xk
Signal_Xk = bloc_lineaire_ordre_1(Signal_Yk, d, 1, N);

% Calculer les probabilités de détection et de fausse alarme pour différentes valeurs de seuil
for i = -8000:1:2000
[pd_test2(i+8001), pfa_test2(i+8001)] = Detecteur_exo2(nombre_valeurs, i/1000, Signal_Xk, H, -1*seuil);
end

% Afficher la courbe de COR en Xk
figure()
plot(pfa_test2, pd_test2);
title("Coube COR en Xk pour N=1 ")
xlabel("pfa")
ylabel("pd")