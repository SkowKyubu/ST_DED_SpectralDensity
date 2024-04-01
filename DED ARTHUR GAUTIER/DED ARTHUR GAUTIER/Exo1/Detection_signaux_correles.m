function [pd,pfa,Risque]=Detection_signaux_correles(N,seuil,signal,H,X,sigma)



H2=zeros(N);
pd=0;
pfa=0;

c10 = 2;
c01=1;
c00=0;
c11=0;
pi0 = 1/2;
pi1 = 1/2;

invMatCov = inv([sigma^2 sigma^2/4;
            sigma^2/4 sigma^2]);
for i=1:N
    px0 = exp(-1/2*(signal(:,i)'*invMatCov * signal(:,i)));
    px1 = exp(-1/2*((signal(:,i)-X')'*invMatCov * (signal(:,i)-X')));
    if(px1/px0) >(seuil)
        H2(i)=1;
    else
        H2(i)=0;
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
Risque = c10*pi0*pfa+c01*pi1*(1-pd);
end