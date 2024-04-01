clear clc
clear all

% Définition des variables avec des valeurs par défaut
nombre_valeur = 10000;
N = 1;
sigma = 2;
X = 2;
moyenne = 0;
L0 = 2;

% Création du signal de test
[H, signal] = Creation_signal(N, sigma, moyenne, X, nombre_valeur);

% Test sur les valeurs
seuil = sigma^2*log(L0) + 0.5*X^2;
[pd, pfa, Risque] = Detecteur_equivalent(nombre_valeur, seuil, signal, H, X);

% Test sur la fonction de vraisemblance
signal2 = exp((signal.*X-(X.^2)/2)/(sigma^2));
[pd2, pfa2, Risque2] = Detecteur(nombre_valeur, 2, signal2, H);

% Courbes COR et risque en fonction du seuil
seuil_test = linspace(-50, 50, 10001); % utilise linspace pour générer la plage de seuils testés
for i = 1:length(seuil_test)
    [pd_test(i), pfa_test(i), Risque_test(i)] = Detecteur_equivalent(nombre_valeur, seuil_test(i), signal, H, X);
end

% Affichage des courbes COR et risque en fonction du seuil
figure()
plot(pfa_test, pd_test);
title("Courbe COR")
xlabel("pfa")
ylabel("pd")

figure()
plot(seuil_test, Risque_test);
title("Risque en fonction du seuil")
xlabel("seuil")
ylabel("Risque")
