clear
clc
clf
kb=1.38d-23 //boltzmann constant
Na=6.023d26 //avagadro no. 
ef= 1.6d-19 //fermi energy
mu=0   //chemical potential
T1=[80 100 120];    T2=[10 50 100];     T3=[0 200 600];
N=1000; n=size(T1,2)
E1=linspace(0,1.4d-20,N);
E2=linspace(1d-20,1.6d-20,N);
E3=linspace(0,2d-19,N)
//Maxwell boltzmann distribution 
subplot(2,2,1)
style=['g-','b--','r:']
for j=1:n
    t=T1(j)
    for i=1:N
        e=E1(i);
        n_b(j,i)=2*Na/(%pi)^(1/2)*(1/(kb*t))^(3/2)*e^(1/2)*exp(-e/(kb*t))
    end
    plot(E1,n_b(j,:),style(j)) 
end
title("Maxwell Boltzmann distribution");legend("T=80K","T=100K","T=120K")
xlabel("Energy");ylabel("No. of particles")
a=gca()
a.data_bounds=[0,0;1.3d-20,2.9d47]
//fermi dirac distribution
subplot(2,2,3)
for j=1:n
    t=T3(j)
    for i=1:N
        e=E3(i)
        if t==0 then
            if e<=ef then
                f(i)=1.0
            else
                f(i)=0;
            end
        else
            c=(e-ef)/(kb*t)
            f(i)=1/(exp(c) + 1 );
        end
    end
    plot(E3,f,style(j))
end
f_N=0:0.1:1
e_N=repmat(ef,size(f_N))
plot(e_N,f_N,'g')
a=gca()
title("Fermi Dirac Distribution")
xlabel("Energy (J)")
ylabel("Fbe");legend("T=0K","T=200K","T=600K")
a.data_bounds=[0,0;3d-19,1.2]
//Bose-einstein distribution
legend_=["10K","50K","100K"]
for j=1:3
    t=T2(j)
    alpha=mu/(kb*t)
    for i=1:N
        e=E2(i);
        f(j,i)=1/(exp(alpha)*exp(e/(kb*t))-1)
    end
    subplot(3,2,2*j)
    plot(E2,f(j,:),style(j))
    title("Bose Einstein distribution for "+string(T2(j))+" K")
    legend(legend_(j))
    xlabel("Energy");ylabel("No. of particles")  
end
