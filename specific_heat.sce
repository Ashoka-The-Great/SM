// specific heat
clc;

clf;
R=8.314
TE=248;
TD=343;
T=1:1000; //range of temperture
for i=1:length(T)
    Cvdp(i)=3*R
    if T(i)==0 then
        Cve(i)=0
        Cvd(i)=0
    else
        x=(TE/T(i))
        Cve(i)=(3*R*(x^2)*exp(x))/((exp(x)-1)^2);
        I=integrate('((y^4)*exp(y))/((exp(y)-1)^2)','y',0,TD/T(i));
        Cvd(i)=9*R*I*(T(i)/TD)^3
    end
    
end
plot(T',[Cvdp Cve Cvd],'linewidth',2)
legend('Dulong petit law','Einstein model','Debye model',4)
title('Plot between temperature and specific heat')
xlabel('Temperature')
ylabel('Specific heat')
