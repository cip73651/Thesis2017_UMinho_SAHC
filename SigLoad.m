##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ SigLoad ] = SigLoad( E0,f2,eps,eps0,sig0)
% eps strain at which both target and new curves yield the same stress
% eps0T, sig0T initial strain stress for sibbling curve

% do not share this code until approval

SigLoad   =   E0*tanh(f2)*   (-log(tanh( (eps-eps0) + f2)) + log(tanh(f2)))/(-1 + tanh(f2)^2) + sig0;

end

