// Planck's law of black body wrt wavelength, energy at diff temp. compare rayleigh and wein law.
clc
clear
clf
h = 6.254d-34 // Planks const.
Kb = 1.38d-23 // Boltzman Const.
c = 2.99d8 // speed of light 
T = [300,3000,6000]
Lm = 1d-7:1d-8:10d-5
N1 = length(T)
N2 = 3
N3 = length(Lm)
for i = 1:N1 
 for k = 1:N3 
 Ew(k,i) = (8*%pi*h*c/(Lm(k)^5))*exp(-h*c/(Lm(k)*Kb*T(i)))
 Er(k,i) = 8*%pi*Kb*T(i)/(Lm(k)^4)
 Ep(k,i) =8*%pi*h*c/((Lm(k)^5)*(exp(h*c/(Lm(k)*Kb*T(i))) - 1))
 E (:,k,i) = [Ew(k,i) , Er(k,i) , Ep(k,i)]
 end
end
ybound = [0.7,5.5d4,2d6]
xbound = [6d-5,0.7d-5,3.5d-6]
LT = ['-','--',':']
C = ['r','g','b']
for i = 1:i // error 
 for j = 1:3
 D(:,:) = E(:,:,i)
subplot(1,3,i)
 title("Tempreture = "+string(T(i)))
 xlabel("Wavelength lambda (m/s)")
 ylabel("Energy distribution")
 plot(Lm,D(j,:),LT(j),'color',C(j))
 legend("Weins law","Reyliegh","Plancks law",4)
 a = gca()
 a.data_bounds = [0,0;xbound(i),ybound(i)]
 end
 end
