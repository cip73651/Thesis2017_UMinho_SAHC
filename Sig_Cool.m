##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ Sig_Cool ] = Sig_Cool( epsMec, sigMec,Peak, T0, T  )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here

E0 = EkLoad( epsMec , sigMec);  % degraded tangent E for 0.02 prestrai

esc_Cool = @(Peak) 0.0865000*Peak  -0.0013100;
b_Cool   = @(Peak)   -77.500000000000014*Peak + 3.100000000000001;
Amp_Cool = @(Peak)   -54.000000000000014*Peak + 2.590000000000001;


Sig_Cool =  Amp_Cool(Peak)*(-SigLoad( -E0, F2Load(TepsLoad( epsMec, 0) , epsMec, 0) , (T - T0)*esc_Cool(Peak), epsMec, 0) + SigLoad( -E0, F2Load(TepsLoad( epsMec, 0), epsMec, 0), (0)*esc_Cool(Peak), epsMec, 0 )) + sigMec + b_Cool(Peak)*(T - T0);


end

