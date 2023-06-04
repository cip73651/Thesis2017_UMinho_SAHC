clear all; close all; clc   
E0 = 420000; f0 = 0.000317; % Main calibration parameters
E4 = 230955; f4 = 0.001368; % Range for calibration

Factor = 0.5;
eps01L = Factor*[0.00: 0.0001: 0.010];
eps01U = Factor*[0.01: -0.0001: -0.010];
eps02L = Factor*[-0.01: 0.0001: 0.020];
eps02U = Factor*[0.02: -0.0001: -0.02];
eps03L = Factor*[-0.02: 0.0001: 0.030];
eps03U = Factor*[0.03: -0.0001: -0.03];
eps04L = Factor*[-0.03: 0.0001: 0.040];
eps04U = Factor*[0.04: -0.0001: -0.04];
eps05L = Factor*[-0.04: 0.0001: 0.050];
eps05U = Factor*[0.05: -0.0001: -0.05];


% initial eps sig
eps0 = 0; sig0 = 0;
sig01L = Sig_Load( eps01L, eps0, sig0 );      eps0 = eps01L( length(eps01L));    sig0 = sig01L( length(sig01L));
sig01U = Sig_Unload( eps01U, eps0, sig0 );    eps0 = eps01U( length(eps01U));    sig0 = sig01U( length(sig01U));
sig02L = Sig_Load( eps02L, eps0, sig0 );      eps0 = eps02L( length(eps02L));    sig0 = sig02L( length(sig02L));
sig02U = Sig_Unload( eps02U, eps0, sig0 );    eps0 = eps02U( length(eps02U));    sig0 = sig02U( length(sig02U));
sig03L = Sig_Load( eps03L, eps0, sig0 );      eps0 = eps03L( length(eps03L));    sig0 = sig03L( length(sig03L));
sig03U = Sig_Unload( eps03U, eps0, sig0 );    eps0 = eps03U( length(eps03U));    sig0 = sig03U( length(sig03U));
sig04L = Sig_Load( eps04L, eps0, sig0 );      eps0 = eps04L( length(eps04L));    sig0 = sig04L( length(sig04L));
sig04U = Sig_Unload( eps04U, eps0, sig0 );    eps0 = eps04U( length(eps04U));    sig0 = sig04U( length(sig04U));
sig05L = Sig_Load( eps05L, eps0, sig0 );      eps0 = eps05L( length(eps05L));    sig0 = sig05L( length(sig05L));
sig05U = Sig_Unload( eps05U, eps0, sig0 );    eps0 = eps05U( length(eps05U));    sig0 = sig05U( length(sig05U));

eps = [eps01L eps01U eps02L eps02U eps03L eps03U eps04L eps04U  eps05L eps05U ];
sig = [sig01L sig01U sig02L sig02U sig03L sig03U sig04L sig04U  sig05L sig05U];

plot(eps, sig, 'linewidth', 1.5)
xlabel('Strain'); ylabel('Stress (MPa)'); grid on
title('FeSMA model')


xlim([-0.05  0.05]); %grid on
