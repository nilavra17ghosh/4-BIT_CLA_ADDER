# 4-Bit Carry Lookahead Adder (CLA) – VLSI Design

## 🧠 Overview

This project presents the design and analysis of a high-speed, low-power **4-bit Carry Lookahead Adder (CLA)** using optimized static CMOS logic. It significantly improves propagation delay and power-delay product (PDP), making it suitable for modern digital systems.

> 🔬 Designed with a focus on VLSI optimization — delay, area, and PDP trade-offs.

---

## 📌 Project Goals

- Design a 4-bit CLA that computes sum and output carry for two 4-bit inputs and one carry-in.
- Implement using **static CMOS logic** for minimized power-delay product.
- Verify using pre-layout and post-layout simulations via **NGSpice**.
- Optimize transistor sizing and logic gates for speed and area.

---

## ⚙️ Tools & Technologies

- **Verilog HDL** – RTL modeling
- **Xilinx Vivado / GTKWave** – Simulation & waveform analysis
- **NGSpice** – Pre- and post-layout timing simulations
- **Magic VLSI** – Layout and stick diagrams
- **LTSpice (optional)** – Circuit-level analysis
- **LaTeX** – Documentation and diagrams

---

## 🧪 Key Technical Highlights

- **Critical Path Delay:** 214 ps (pre-layout), 590 ps (tpcq), resulting in a max clock frequency of ~1.15 GHz.
- **Logic Design:** Implemented optimized carry equations:
  - `C1 = G0 + P0·C0`
  - `C2 = G1 + P1·G0 + P1·P0·C0`
  - and so on for C3 and C4...
- **AO21 Gates**: Replaced complex AND/OR combinations with AO21 for delay reduction.
- **Flip-Flop Architecture:** True Single Phase Clocking (TSPC) used over CML for balance between delay and power.
- **Stick Diagrams**: For all key gates (AND, OR, XOR, Inverter, Flip-Flop).

---

## 📂 Folder Structure

```bash
.
├── src/                  # Verilog code
├── spice/                # NGSpice netlists and testbenches
├── layout/               # Magic VLSI layouts (.mag)
├── images/               # Diagrams, waveforms, stick drawings
├── results/              # Delay reports, waveform plots
├── report.pdf            # Final IEEE-style project report
└── README.md             # Project documentation
