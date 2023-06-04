##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved

clear all; close all; clc
% define skewed function
x = -5.5:0.001:5.5;


alpha = 5.5; % alpha skewness
xi = 0;   % xi just location
omega = 2.4; % omega width,
Et1 = x;
for i = 1:length(x)
    Et1(i) = sqrt(0.2e1) * pi ^ (-0.1e1 / 0.2e1)*exp(-(x(i) - xi)^ 2 / omega ^ 2 / 0.2e1) * (0.1e1 / 0.2e1 + erf(sqrt(0.2e1) * alpha * (x(i) - xi)./ omega / 0.2e1) / 0.2e1);
end
[maxval, maxind]=max(Et1); x = x -  x(maxind); Et1 = Et1/maxval;  % correcting values




Et2 = (exp(-(-x).^2/  6.28  ).*(sign( (-x))/2 + 1/2) + exp(-(-x).^ 2/   1.1   ).*(sign(-(-x))/2 + 1/2));

figure
plot(-x,Et1, 'r--'); hold on
plot(x,Et2)
xlabel('strain & stress'); ylabel('normalized value'), title('Equivalent skewed function')
legend('Exact solution', 'Equivalent function')


