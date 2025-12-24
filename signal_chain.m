clc; clear; close all;

%% ===============================
% 1. SYSTEM PARAMETERS
%% ===============================

fc = 868e6;            % Carrier frequency (Hz)
d_km = 10;             % Distance (km)
Pt_dBm = 14;           % Transmit power = 25 mW = 14 dBm
Gt = 6;                % Tx antenna gain (dBi)
Gr = 6;                % Rx antenna gain (dBi)
B = 125e3;             % Bandwidth (Hz)
T = 290;               % Noise temperature (Kelvin)

Nbits = 1e5;           % Number of bits
M = 4;                 % QPSK (4 symbols)
k = log2(M);           % Bits per symbol

%% ===============================
% 2. BIT GENERATION
%% ===============================

bits_tx = randi([0 1], Nbits, 1);

% Explanation:
% These are the raw information bits (like text, sensor data, etc.)

%% ===============================
% 3. QPSK MODULATION
%% ===============================

symbols_tx = pskmod(bits_tx, M, pi/4, 'InputType','bit');

% Explanation:
% - Groups bits into pairs
% - Each pair maps to a complex symbol
% - Complex plane = I (real) + Q (imag)

%% ===============================
% 4. FREE-SPACE PATH LOSS
%% ===============================

FSPL_dB = 20*log10(d_km) + 20*log10(fc/1e6) + 32.44;

Pr_dBm = Pt_dBm + Gt + Gr - FSPL_dB;

% Convert received power to linear scale
Pr_linear = 10^((Pr_dBm - 30)/10);

symbols_rx = sqrt(Pr_linear) * symbols_tx;

% Explanation:
% - Signal power drops massively over distance
% - At 10 km, signal is VERY weak
% - We scale signal amplitude accordingly

%% ===============================
% 5. ADD THERMAL NOISE
%% ===============================

kB = 1.38e-23;             % Boltzmann constant
NoisePower = kB * T * B;

noise = sqrt(NoisePower/2) * ...
        (randn(size(symbols_rx)) + 1j*randn(size(symbols_rx)));

symbols_rx = symbols_rx + noise;

% Explanation:
% - Noise exists everywhere (thermal motion of electrons)
% - Modeled as complex Gaussian noise (AWGN)
% - Noise competes with signal → errors

%% ===============================
% 6. QPSK DEMODULATION
%% ===============================

bits_rx = pskdemod(symbols_rx, M, pi/4, 'OutputType','bit');

% Explanation:
% - Receiver looks at symbol phase
% - Decides which QPSK quadrant it belongs to
% - Converts back to bits

%% ===============================
% 7. BIT ERROR RATE (BER)
%% ===============================

BER = sum(bits_tx ~= bits_rx) / Nbits;

fprintf('BER at 10 km = %.3e\n', BER);

%% ===============================
% 8. VISUALIZATION
%% ===============================

figure;
scatter(real(symbols_rx(1:2000)), imag(symbols_rx(1:2000)), '.');
grid on;
title('Received QPSK Constellation (10 km)');
xlabel('In-phase (I)');
ylabel('Quadrature (Q)');
