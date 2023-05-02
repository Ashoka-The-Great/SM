clc;
clear;
clf;
N=input('Enter the number of indivisual experiments :')
for i=1:N
    v=input('Enter the no. of coins :')
    disp('Heads  Probability')
    m=2^v; //Total no. of microstates 
    for j=0:1:v
        I=factorial(v)/(factorial(j)*factorial(v-j));
        P(j+1)=I/m; //Probability of a microstates
        h(j+1)=j; //No. of heads
        disp([h(j+1) P(j+1)])
    end
    subplot(2,2,i)
    xgrid(5)
    plot(h,P,'o-','linewidth',5)
    title('The no. of coins ='+string(v),'fountsize',6)
    xlabel('No. of heads ','fountsize ',6)
    ylabel('Probability of Macrostates','fountsize',6)
end
