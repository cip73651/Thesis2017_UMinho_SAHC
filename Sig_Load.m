##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved

function [ SigL ] = Sig_Load( eps, eps0, sig0 )
% Simplified function
% defines a general function using auxiliary functions

SigL = SigLoad( EkLoad(eps0, sig0) ,    F2Load( TepsLoad( eps0, sig0) , eps0, sig0)    , eps, eps0, sig0 );

end

