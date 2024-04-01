function  Signal=bloc_lineaire_ordre_1(Signal,a,b,N)
Signal = Signal .*a + [zeros(N,1) Signal(:,1:end-1)].*b;
end