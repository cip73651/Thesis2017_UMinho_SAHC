##  A Probabilistic Thermo Mechanical Uniaxial Constitutive Model
##  for Iron Based Shape Memory Alloys
##  Master’s Thesis SAHC, September 2017 University of Minho
##  © Copyright 2017 by Fernando Maximo Valdivia-Vilca All Rights Reserved


clear all; close all; clc


eps_p201 =  0.000: 0.0001: 0.02;
eps_p202 = 0.02:-0.0001:0.0145;  % prestrain to 0.02 and 0.04 STRAIN
eps_p401 =  0.000: 0.0001: 0.04;
eps_p402 = 0.04:-0.0001:0.0314;
% Sig_Load( eps, eps0, sig0 ) function definition  % Sig_Unload( eps, eps0, sig0 )
sig_p201 = Sig_Load(   eps_p201, 0, 0); % loading to 0.02 eps
sig_p202 = Sig_Unload(   eps_p202, eps_p201(length(eps_p201)) , sig_p201(length(eps_p201))  ); % unloading to 0.02 eps
sig_p401 = Sig_Load( eps_p401, 0, 0);  % loading to 0.04 eps
sig_p402 = Sig_Unload( eps_p402, eps_p401(length(eps_p401)) , sig_p401(length(eps_p401))  ); % unloading from 0.04
% storing last stress strain
sig_last_p2 = sig_p202( length(sig_p202));  eps_last_p2 = eps_p202( length(eps_p202));
sig_last_p4 = sig_p402( length(sig_p402));  eps_last_p4 = eps_p402( length(eps_p402));

% Heating Sig_Heat( epsMec, sigMec,Peak, T0, T )
T_heat =  20:  0.1: 140;  T_cool = 140: -0.1:  0;  % heating and cooling ranges.

sig_p203 = Sig_Heat( eps_last_p2, sig_last_p2, 0.02, 20, T_heat );
sig_p403 = Sig_Heat( eps_last_p4, sig_last_p4, 0.04, 20, T_heat );

% Cooling  Sig_Cool( epsMec, sigMec,Peak, T0, T  )
% updating last eps sig
sig_last_p2 = sig_p203( length(sig_p203));
sig_last_p4 = sig_p403( length(sig_p403));

sig_p204 = Sig_Cool( eps_last_p2, sig_last_p2, 0.02, 140, T_cool  );
sig_p404 = Sig_Cool( eps_last_p4, sig_last_p4, 0.04, 140, T_cool  );

load eps_pre_4_140C.txt; load eps_pre_2_140C.txt;
% all together now, all together now...

T_p201 = 20*ones(1,length(eps_p201));
T_p401 = 20*ones(1,length(eps_p401));

T_p202 = 20*ones(1,length(eps_p202));
T_p402 = 20*ones(1,length(eps_p402));

eps_p203 = eps_last_p2* ones(1,length(T_heat));
eps_p204 = eps_last_p2* ones(1,length(T_cool));

eps_p403 = eps_last_p4* ones(1,length(T_heat));
eps_p404 = eps_last_p4* ones(1,length(T_cool));

T_p2 = [ T_p201  T_p202  T_heat  T_cool ];
T_p4 = [ T_p401  T_p402  T_heat  T_cool ];

eps_p2 = [ eps_p201  eps_p202  eps_p203  eps_p204];
eps_p4 = [ eps_p401  eps_p402  eps_p403  eps_p404];

sig_p2 = [ sig_p201  sig_p202  sig_p203  sig_p204];
sig_p4 = [ sig_p401  sig_p402  sig_p403  sig_p404];



figure
plot( [eps_p401 eps_p402] , [sig_p401 sig_p402] ); hold on; grid on
%plot( eps_p402 , sig_p402 )
plot( [eps_p201 eps_p202] , [sig_p201 sig_p202], 'r--' , 'linewidth', 1.5)
%plot( eps_p202 , sig_p202, 'r', 'linewidth', 1.5)
xlabel('Strain'); ylabel('Stress (MPa)');
legend('0.04 pre-strain' , '0.02 pre-strain','location', 'northwest')

figure
plot( eps_pre_2_140C(:,1), eps_pre_2_140C(:,2),'r:', 'linewidth', 1.5) ; hold on; grid on
plot( eps_pre_4_140C(:,1), eps_pre_4_140C(:,2),'b:', 'linewidth', 1.5)
plot(T_heat, sig_p203,'r--','linewidth', 2.5)
plot(T_heat, sig_p403,'b--','linewidth', 2.5)
plot(T_cool, sig_p204,'r--','linewidth', 2.5)
plot(T_cool, sig_p404,'b--','linewidth', 2.5)
xlabel('Temperature C'); ylabel('Stress (MPa)');
legend('Experimental 0.02 pre-strain', 'Experimental 0.04 pre-strain','Proposed model 0.02','Proposed model 0.04','location', 'northeast')
title('FeSMA Thermal model')

figure
plot3(eps_p2, T_p2, sig_p2,'r','linewidth', 1.5), hold on; grid on
plot3(eps_p4, T_p4, sig_p4,'b','linewidth', 1.5)
legend('0.02 pre-strain','0.04 pre-strain','location', 'northeast')
xlabel('Strain') % x-axis label
ylabel('Temperature C'); zlabel('Stress (MPa)');
%title('FeSMA Thermomechanical model')






