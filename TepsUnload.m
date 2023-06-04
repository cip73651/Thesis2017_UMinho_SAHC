##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ TepsU ] = TepsUnload( X , Y)
% Function defining target strain
% based on multiyield function

TepsU = X - (0.025 + 0.025*tanh(-(645/0.04*X - Y )/500)) * (1.50 - 0.50*exp(-(645/0.04*X + Y ).^2/250000));

end
