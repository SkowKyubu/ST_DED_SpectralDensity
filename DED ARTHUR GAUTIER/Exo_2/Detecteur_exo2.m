function [pd,pfa,Risque]=Detecteur_exo2(N,seuil,signal,H,signe)

H2=zeros(N);
pd=0;
pfa=0;

for i=1:N
    if(signe>0)
        if(sum(signal(:,i)) >(seuil))
            H2(i)=1;
        else
            H2(i)=0;
        end
    else
        if(sum(signal(:,i)) <(seuil))
            H2(i)=1;
        else
            H2(i)=0;
        end
    end
   if H2(i)==1
       if H(i)==1
           pd=pd+1;
       else
           pfa=pfa+1;
       end
   end
           
end
pfa = pfa/(N-sum(H));
pd = pd/sum(H);
end