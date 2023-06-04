##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ sig_H ] = Sig_Heat( epsMec, sigMec,Peak, T0, T )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

b_Heat = @(Peak)  -7.5000*Peak +  1.0500  ;  % eps and slope polynomial
c2_Heat = @(Peak)  0.0002250*Peak  -0.00000250055; %  first polynomial   eps and add sig

sig_H = SigHeat(EkLoad(epsMec, sigMec) ,  c2_Heat( Peak ) , T, b_Heat(Peak), T0) + sigMec;   % red

end

