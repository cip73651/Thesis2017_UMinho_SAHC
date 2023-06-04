##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


clear all; close all; clc

[X,Y] = meshgrid(-0.04:0.002:0.04,-645:15:645);
% Et1 for loading, Et2 Unloading
Et1 = 0.025 + 0.025*tanh(-(-645/0.04*X + Y )/500);
Et2 = 0.025 + 0.025*tanh(-(645/0.04*X - Y )/500);
kk =   1.50 - 0.50*exp(-(645/0.04*X + Y ).^2/250000); %
%


% figure
% surf(X,Y,Et1.*kk,'EdgeColor','None')
% colorbar
% xlabel('strain'); ylabel('stress'), title('Target strain to prescribed curve - Loading')
% view([0 0 90])



figure
surf(X,Y,Et2.*kk,'EdgeColor','None')
colorbar
xlabel('strain'); ylabel('stress'), title('Target strain to prescribed curve - Unloading')
view([0 0 90])


%
% figure
% surf(X,Y,kk)
%
% figure
% surf(X,Y,Et1)
