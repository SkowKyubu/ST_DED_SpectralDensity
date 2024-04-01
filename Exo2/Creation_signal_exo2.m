function  [H1,Signal]=Creation_signal_exo2(N,sigma,nombre_valeur)
    Signal = randn(N,nombre_valeur)*sigma;
    H = zeros(N,nombre_valeur);
    i=0:1:nombre_valeur/10-1;
    H(:,1+i*10) =  1;
    Signal = Signal + H;
    H1=H(1,:);
end