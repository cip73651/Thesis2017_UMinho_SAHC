##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved

function [ SigCool ] = SigCool(  E0, c2, c3, Temp, b, T0 )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

SigCool   =   tanh(((c2 - 1) * T0 + c3)) * (b - E0) * log(-tanh((-c2 * Temp + T0 - c3))) / (-c2+c2*tanh(((c2-1)*T0+c3))^2)+b*Temp+tanh(((c2-1)*T0+c3))*(-b+E0)/c2/(-1+tanh(((c2-1)*T0+c3))^2) * log(tanh(((c2-1)*T0+c3))) - b*T0;


end

