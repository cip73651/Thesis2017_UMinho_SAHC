##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved

function [ SigHeat ] = SigHeat( E0, c2, Temp, b, T0 )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

SigHeat   =   (tanh(c2)*(b - E0)*log(-tanh(-Temp + T0 - c2)) - tanh(c2)*(b - E0)*log(tanh(c2)) - b*(tanh(c2) - 1)*(tanh(c2) + 1)*(-Temp + T0))/(-1 + tanh(c2)^2);

end

