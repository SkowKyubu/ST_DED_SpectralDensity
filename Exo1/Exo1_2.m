clear clc
clear all

% Définition des variables avec des valeurs par défaut
nombre_valeur = 10000;
N = 2;
sigma = 2;
X = [2, 4];
moyenne = 0;
L0 = 2;

% Création du signal de test
[H, signal] = Creation_signal(N, sigma, moyenne, X, nombre_valeur);

% Test sur les valeurs
seuil = sigma^2*log(L0) + 0.5*norm(X)^2; % utilise norme Euclidienne pour calculer le seuil
[pd, pfa, Risque] = Detecteur_equivalent(nombre_valeur, seuil, signal, H, X);
disp(['Le taux de détection est : ', num2str(pd)]);
disp(['Le taux de fausse alarme est : ', num2str(pfa)]);
disp(['Le risque est : ', num2str(Risque)]);

% Test sur la fonction de vraisemblance
signal2 = ones(size(signal, 2), 1); % initialise signal2 avec des 1
for i = 1:N
    signal2 = signal2 .* exp(-1/2*((signal(i,:)-X(i)).^2-signal(i,:).^2)/(sigma^2)); % utilise les dimensions de signal pour signal2
end
[pd2, pfa2, Risque2] = Detecteur(nombre_valeur, 2, signal2, H);
disp(['Le taux de détection (fonction de vraisemblance) est : ', num2str(pd2)]);
disp(['Le taux de fausse alarme (fonction de vraisemblance) est : ', num2str(pfa2)]);
disp(['Le risque (fonction de vraisemblance) est : ', num2str(Risque2)]);

% Courbes COR et risque en fonction du seuil
seuil_test = linspace(-50, 50, 10001); % utilise linspace pour générer la plage de seuils testés
pd_test = zeros(size(seuil_test));
pfa_test = zeros(size(seuil_test));
Risque_test = zeros(size(seuil_test));
for i = 1:length(seuil_test)
    [pd_test(i), pfa_test(i), Risque_test(i)] = Detecteur_equivalent(nombre_valeur, seuil_test(i), signal, H, X);
end

% Affichage des courbes COR et risque en fonction du seuil
figure()
plot(pfa_test, pd_test);
title("Courbe COR");
xlabel("Taux de fausse alarme");
ylabel("Taux de détection");

figure()
plot(seuil_test, Risque_test);
title("Risque en fonction du seuil");
xlabel("Seuil");
ylabel("Risque");




