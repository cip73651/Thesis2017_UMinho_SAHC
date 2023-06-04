##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved

function [ SigU ] = Sig_Unload( eps, eps0, sig0 )
% Simplified function
% defines a general function using auxiliary functions

SigU = SigUnload( EkUnload( eps0, sig0 ) , F2Unload(TepsUnload( eps0, sig0 ), eps0, sig0) , eps, eps0, sig0 );

end

