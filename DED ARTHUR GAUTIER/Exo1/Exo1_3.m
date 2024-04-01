clear clc
clear all

nombre_valeur=10000;
N=2;
sigma=2;
X=[2,4];
moyenne=0;
L0=2;
[H,signal] = Creation_signal_correle(N,sigma,moyenne,X,nombre_valeur);


%Detecteur de BAYES--------------------------------------------------------

[pd_correle,pfa_correle,Risque_correle]=Detection_signaux_correles(nombre_valeur,L0,signal,H,X,sigma);



for i=-1000:3000
    [pd_test_correle(i+1001),pfa_test_correle(i+1001),Risque_test_correle(i+1001)]=Detection_signaux_correles(nombre_valeur,i/100,signal,H,X,sigma);
end
seuil_test_correle=-10:0.01:30;
figure()
plot(pfa_test_correle,pd_test_correle);
title("Courbe de test BAYES bruit correlé")
xlabel("pfa")
ylabel("pd")


figure()
plot(seuil_test_correle,Risque_test_correle);
title("Risque en fonction du seuil de test BAYES bruit correlé")
xlabel("seuil")
ylabel("Risque")





%Meme test qu'a la question 1.2--------------------------------------------
L0=2;
seuil= sigma^2*log(L0)+0.5*sum(X.^2);


[pd,pfa,Risque]=Detecteur_equivalent(nombre_valeur,seuil,signal,H,X);
pd
pfa
Risque


for i=-3000:3000
    [pd_test(i+3001),pfa_test(i+3001),Risque_test(i+3001)]=Detecteur_equivalent(nombre_valeur,i/100,signal,H,X);
end
seuil_test=-30:0.01:30;
figure()
plot(pfa_test,pd_test);
title("Courbe de test Question 1.2 bruit correlé")
xlabel("pfa")
ylabel("pd")


figure()
plot(seuil_test,Risque_test);
title("Risque en fonction du seuil de test Question 1.2 bruit correlé")
xlabel("seuil")
ylabel("Risque")
