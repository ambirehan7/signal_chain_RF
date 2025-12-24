# signal_chain_RF
simulated an 10km communication system 
# 📡 Long-Range Sub-GHz Wireless Link Simulation (MATLAB)

## Overview
This project simulates a **long-range wireless communication link** operating in the **868 MHz ISM band** using MATLAB.  
The objective is to understand how **free-space path loss, noise, bandwidth, and distance** affect **signal-to-noise ratio (SNR)** and **bit error rate (BER)** in long-distance RF links.

The system is modeled at a **system level**, following real-world microwave communication principles.

---

## System Specifications

| Parameter | Value |
|--------|------|
| Carrier Frequency | 868 MHz |
| Distance | 10 km (configurable) |
| Transmit Power | 14 dBm |
| Antenna Gain (Tx/Rx) | 6 dBi / 6 dBi |
| Bandwidth | 125 kHz |
| Modulation | QPSK |
| Channel Model | Free-space + AWGN |
| Noise Model | Thermal noise (kTB) |

---

## What This Simulation Models

### Transmitter
- Random bit generation
- QPSK modulation using complex baseband representation

### Channel
- **Free-Space Path Loss (FSPL)** derived from the Friis transmission equation  
- Distance-dependent signal attenuation  
- Additive White Gaussian Noise (AWGN) based on physical thermal noise

### Receiver
- QPSK demodulation
- Bit Error Rate (BER) computation
- Constellation visualization

---

## Key Equations Used

### Free-Space Path Loss (FSPL)

Derived from the Friis transmission equation, accounting for:
- Geometric spreading of electromagnetic waves
- Frequency dependence
- Unit conversion constants

---

### Thermal Noise Power
Where:
- `k` = Boltzmann constant  
- `T` = Noise temperature  
- `B` = Bandwidth  

---

## Results

- BER is evaluated for a long-range line-of-sight link
- At high SNR, the observed BER may be zero due to finite simulation length
- Constellation plots visualize the impact of noise on received symbols

---

## Example Outputs
- Bit Error Rate (BER) at a given distance
- Received QPSK constellation plot

---

## Tools Used
- MATLAB Online
- Communications Toolbox

---

## Why This Project Matters

This project demonstrates:
- Practical understanding of RF propagation and path loss
- Link budget analysis for long-range communication
- Noise modeling using physical principles
- System-level design skills relevant to microwave engineering

The simulation approach directly maps to real-world systems such as:
- Long-range IoT links
- Telemetry systems
- Microwave point-to-point communication

---

## Future Improvements
- BER vs distance analysis
- Rayleigh and Rician fading models
- Comparison with BPSK and LoRa modulation
- Hardware validation using SDR platforms

---

## Author
Rihan Ambi
Aspiring RF / Microwave Engineer
