// Maxwell Distribution 
clc
clear 
clf
//Defining Constant
pi=3.14
kb=1.38d-23 //Boltzmann Costant
N=6.022d23 //Avagadro Number
m = [12, 17,28,32,44,64] // masses in g/mol
M=[12,17,28,32,44,64]/(N*1d3) // masses in kg
T=300:300:900 // range of temperature 
V=0:100:6000 // range of velocity
A = [1.41,1.59,1.73] 
N1=length(M); 
N2=length(T); 
N3=length(V); 
N4=length(A)
for i=1:N1 
 for j=1:N2 
 for k=1:N3 
 for l=1:N4 
 Y1=M(i)/(2*pi*kb*T(j))
 Y2=exp(-M(i)*(V(k))^2/(2*kb*T(j)))
 Pv(j,k,i)=4*pi*(V(k)^2)*(Y1^(3/2))*Y2 
 Vs(j,l,i) = A(l)*(kb*T(j)/M(i))^(1/2)
 Ys2 =exp(-M(i)*(Vs(j,l,i))^2/(2*kb*T(j)))
 Pvs(j,l,i)=4*pi*(Vs(j,l,i)^2)*(Y1^(3/2))*Ys2 
 end
 end
 end
end
// Graph
color_code1=[1 0 0;.0 1 0 ;0 0 1]
color_code=[.5 .5 .5;.1 .1 .1;0 0 0] 
for i=1:N1 
 for j=1:N2 
 for l=1:N4 
 D = Pv(:,:,i)
 subplot(2,3,i)
 title("Mass of gas molecule = "+string(m(i)))
 plot(V,(D(j,:)),'color',color_code1(j,:)) 
 plot(Vs(j,l,i), Pvs(j,l,i) ,'*',' color',color_code(l,:))
 xlabel("Velocity(m/s)")
 ylabel("Probabilty of velocity")
 a = gca()
 a.data_bounds = [0,0;3000,0.003] 
 end
 end
 end
