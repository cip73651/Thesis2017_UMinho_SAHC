##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


clear all; close all; clc

[X,Y] = meshgrid(-0.04:0.002:0.04,-645:15:645);
% Et is the skewed function
% Et1 for loading, Et2 Unloading
Et1 = (exp(-(-645/0.04*X + Y).^2/70000).*(sign( (-645/0.04*X + Y))/2 + 1/2) + exp(-(-645/0.04*X + Y).^ 2/ 400000).*(sign(-(-645/0.04*X + Y))/2 + 1/2));
Et2 = (exp(-(-645/0.04*X + Y).^2/400000).*(sign( (-645/0.04*X + Y))/2 + 1/2) + exp(-(-645/0.04*X + Y).^ 2/ 70000).*(sign(-(-645/0.04*X + Y))/2 + 1/2));
kk =  exp(-(645/0.04*X + Y).^2/2782000); %

% figure
% surf(X,Y,Et1.*kk,'EdgeColor','None')
% xlabel('strain'); ylabel('stress'), title('normalized initial tangent modulus on Loading')
% view(2);
% %colormap(flipud(gray(256)));
% colorbar;
%
figure
surf(X,Y,Et2.*kk,'EdgeColor','None')
xlabel('strain'); ylabel('stress'), title('normalized initial tangent modulus on Unloading')
view(2);
%colormap(flipud(gray(256)));
colorbar;
