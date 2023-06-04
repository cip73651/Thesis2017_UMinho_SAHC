##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ Ek ] = EkUnload( X , Y)
% eps strain at which both target and new curves yield the same stress
% eps0T, sig0T initial strain stress for sibbling curve
E0 = 420000; %f0 = 0.000317;
% using equivalent skewed function
Ek = E0*(exp(-(-645/0.04*X + Y).^2/400000).*(sign( (-645/0.04*X + Y))/2 + 1/2) + exp(-(-645/0.04*X + Y).^ 2/ 70000).*(sign(-(-645/0.04*X + Y))/2 + 1/2)) * exp(-(645/0.04*X + Y).^2/2782000); % last version yields proper E4 only positive version



