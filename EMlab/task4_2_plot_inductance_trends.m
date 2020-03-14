 load('cp1_vector_nonlinear.mat');
load('cp1_vector_linear.mat');


figure(1);  %绘制非线性核Psi-I曲线
for displacement = 1:50
    I = cp1_vector_nonlinear(displacement, 1, :);
    Psi = cp1_vector_nonlinear(displacement, 3, :);
    I=squeeze(I);
    Psi=squeeze(Psi);
    plot(I,Psi);
    hold on;
end
title('The Psi-I Curve of Nonlinear Core Using Numerical Method');
xlabel("Current"+newline+"(A)");
ylabel("Psi"+newline+"(Wb)");


figure(2);  %绘制线性核Psi-I曲线
for displacement = 1:50
    I = cp1_vector_linear(displacement, 1, :);
    Psi = cp1_vector_linear(displacement, 3, :);
    I=squeeze(I);
    Psi=squeeze(Psi);
    plot(I,Psi);
    hold on;
end
title('The Psi-I Curve of Linear Core Using Numerical Method');
xlabel("Current"+newline+"(A)");
ylabel("Psi"+newline+"(Wb)");


figure(3);
%----not considering the effective area using analytical method------
x=0.1:0.1:5;
Rc=(70+47+27+20)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg2=0.5*10^(-3)/(4*pi*10^(-7)*20*20*10^(-6));
Rmover=(60-x).*10^(-3)./(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg1=x.*10^(-3)./(4*pi*10^(-7)*20*20*10^(-6));
R=Rc+Rg2+Rmover+Rg1;
N=100;
L=N^2./R;
plot(x,L*1000,"Red");
hold on
%---considering the effective area using analytical method---
x=0.1:0.1:5;
Rc=(70+47+27+10+10)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg2=0.5*10^(-3)/(4*pi*10^(-7)*21*21*10^(-6));
Rmover=(60-x)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg1=x*10^(-3)./(4*pi*10^(-7).*(20+2*x).*(20+2*x)*10^(-6));
R=Rc+Rg2+Rmover+Rg1;
N=100;
L=N^2./R;
plot(x,L*1000,"Green");
hold on;
%---using numerical method and nonlinear core---
L=cp1_vector_nonlinear(:,3,11)./cp1_vector_nonlinear(:,1,11);
L=squeeze(L);
x = 0.1:0.1:5;
plot(x,L*1000,"Blue");
hold on;
%---using numerical method and linear core---
L=cp1_vector_linear(:,3,11)./cp1_vector_linear(:,1,11);
L=squeeze(L);
x = 0.1:0.1:5;
plot(x,L*1000,"cyan");
hold on;
legend('using analytical method and not considering Aeff','using analytical method and considering Aeff','using numerical method and nonlinear core','using numerical method and linear core');
xlabel("Displacement i.e. Airgap Length"+newline+"(mm)");
ylabel("Winding Inductance"+newline+"(mH)");
title('The Inductance Trends');


figure(4);
for displacement = 1:50
    x=displacement/10;
    Rc=(70+47+27+20)*10^(-3)/(4*pi*10*(-7)*1000*20*20*10^(-6));
    Rg2=0.5*10^(-3)/(4*pi*10^(-7)*20*20*10^(-6));
    Rmover=(60-x)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
    Rg1=x*10^(-3)/(4*pi*10^(-7)*20*20*10^(-6));
    R=Rc+Rg2+Rmover+Rg1;
    N=100;
    L=N^2./R;
    I = 0:10;
    Psi = I.*L;
    plot(I,Psi);
    hold on;
end
title('The Psi-I Curve Using Analytical Method Not Considering Aeff');
xlabel("Current"+newline+"(A)");
ylabel("Psi"+newline+"(Wb)");

figure(5);
for displacement = 1:50
    x=displacement/10;
    Rc=(70+47+27+10+10)*10^(-3)/(4*pi*10*(-7)*1000*20*20*10^(-6));
    Rg2=0.5*10^(-3)/(4*pi*10^(-7)*21*21*10^(-6));
    Rmover=(60-x)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
    Rg1=x*10^(-3)./(4*pi*10^(-7).*(20+2*x).*(20+2*x)*10^(-6));
    R=Rc+Rg2+Rmover+Rg1;
    N=100;
    L=N^2./R;
    I = 0:10;
    Psi = I.*L;
    plot(I,Psi);
    hold on;
end
title('The Psi-I Curve Using Analytical Method Considering Aeff');
xlabel("Current"+newline+"(A)");
ylabel("Psi"+newline+"(Wb)");