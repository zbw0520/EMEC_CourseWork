xi=0.1:0.1:4.9;
x=0.1:0.1:5;
E_dif(49)=0;
E_diff_integral(49)=0;
E_diff_trapz(49)=0;
F_nonlinear_integral(49)=0;
F(49)=0;
%-------------using analytical expression without Aeff-------------
Rc=(70+47+27+20)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg2=0.5*10^(-3)/(4*pi*10^(-7)*20*20*10^(-6));
Rmover=(60-x)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg1=x*10^(-3)/(4*pi*10^(-7)*20*20*10^(-6));
R=Rc+Rg2+Rmover+Rg1;
N=100;
L=N*N./R;
i = 0:10;
for j = 1:49
    E_dif(j) = trapz(i, L(j)*i) - trapz(i, L(j+1)*i);
    F(j) = E_dif(j)/0.1*1000;
end
plot(xi,F,'Green');
hold on;
%-------------using analytical expression with Aeff-------------
Rc=(70+47+27+10+10)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg2=0.5*10^(-3)/(4*pi*10^(-7)*21*21*10^(-6));
Rmover=(60-x)*10^(-3)/(4*pi*10^(-7)*1000*20*20*10^(-6));
Rg1=x*10^(-3)./(4*pi*10^(-7).*(20+2*x).*(20+2*x)*10^(-6));
R=Rc+Rg2+Rmover+Rg1;
N=100;
L=N*N./R;
i = 0:10;
for j = 1:49
    E_dif(j) = trapz(i, L(j)*i) - trapz(i, L(j+1)*i);
    F(j) = E_dif(j)/0.1*1000;
end
plot(xi,F,'red');
hold on;
%----------nonlinear---------------
load('cp1_vector_nonlinear.mat');
load('cp1_vector_linear.mat');
I=cp1_vector_nonlinear(:,1,:);
Psi=cp1_vector_nonlinear(:,3,:);
E_diff(10)=0;
F_nonlinear(10)=0;
for j=1:49
    I=squeeze(I);
    Psi=squeeze(Psi);
    E_diff_trapz(j) = trapz(I(j,:),Psi(j,:))-trapz(I(j+1,:),Psi(j+1,:));
    F_nonlinear(j) = E_diff_trapz(j)./0.1*1000;
end
plot(xi,F_nonlinear,'black');
hold on;
%---------linear-------------
I=cp1_vector_linear(:,1,:);
Psi=cp1_vector_linear(:,3,:);
E_diff(10)=0;
F_linear(10)=0;
for j=1:49
    I=squeeze(I);
    Psi=squeeze(Psi);
    E_diff(j) = trapz(I(j,:),Psi(j,:))-trapz(I(j+1,:),Psi(j+1,:));
    F_linear(j) = E_diff(j)./0.1*1000;
end
plot(xi,F_linear,'blue');
hold on;
%----------nonlinear_integral---------------
load('Ec.mat')
for j=1:49
    E_diff_integral(j)=Ec(j)-Ec(j+1);
    F_nonlinear_integral(j)=E_diff_integral(j)/0.1*1000;
end
plot(xi,F_nonlinear_integral,'cyan');
legend('using analytical expression without Aeff','using analytical expression with Aeff','nonlinear core using trapz to calculate coenergy','linear core using trapz to calculate coenergy','nonlinear core using integral to calculate coenergy');
title("Force-Displacement Curve");
xlabel("Displacement i.e. Airgap Length"+newline+"(mm)");
ylabel("Force"+newline+"(N)");