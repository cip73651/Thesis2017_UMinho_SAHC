##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


function [ f ] = F2Load( eps, eps0T , sig0T)
% eps strain at which both target and new curves yield the same stress
% eps0T, sig0T initial strain stress for sibbling curves
% Calibrating values at extreme pushover loading and unloading peaks
E0 = 420000; f0 = 0.000317;
E4 = 230955; f4 = 0.001368;
eps0 = 0.00; sig0 = 0.00;  % zero initial
eps04 = -0.04; sig04 = SigUnload( E0,f0,eps04,eps0,sig0);
% Iteration procedure for sibling curves calibration factor
n = 10;
f = 0.000100; % just initial guess
while n > 0.10   % strsss convergence value

   n = abs(SigLoad(E4,f4,eps, eps04,sig04) - SigLoad( EkLoad(eps0T, sig0T) ,f,eps,eps0T,sig0T));

%     if eps > 0
%     n = abs(SigLoad(E0,f0,eps, eps0,sig0) - SigLoad( EkLoad(eps0T, sig0T) ,f,eps,eps0T,sig0T));
%     else
%     n = abs(SigLoad(E4,f4,eps, eps04,sig04) - SigLoad( EkLoad(eps0T, sig0T) ,f,eps,eps0T,sig0T));
%     end
%
    f = f + 0.00000010;
end
end

