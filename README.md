# MacroDR Submission Repository

This repository contains the exact code and analysis used for the submission of our manuscript on **Bayesian inference for ion channel kinetics using MacroIR**. It provides all necessary scripts, models, and configurations to **replicate the MCMC runs** performed in the study.

## 📌 Repository Structure

```
macro_dr_submission/
│── models/                    # Kinetic models used in the study
│── experiments/               # Experimental datasets analyzed
│── scripts/                   # Scripts for running simulations and analysis
│── slurm/                     # Slurm batch job scripts for cluster execution
│── CMakeLists.txt             # Build configuration for the project
│── README.md                  # This document
```

## 🔧 Installation and Setup

### 1. Clone the Repository
```bash
git clone https://github.com/lmoffatt/macro_dr_submission.git
cd macro_dr_submission
```

### 2. Install Dependencies
Ensure you have the required libraries:
- C++ compiler with **C++20** support (e.g., GCC 10+ or Clang 11+)
- **CMake** (≥3.5)
- **OpenMP**
- **GSL (GNU Scientific Library)**
- **BLAS & LAPACK**

On Debian-based systems, install them with:
```bash
sudo apt update && sudo apt install cmake libgsl-dev liblapack-dev libopenblas-dev g++
```

### 3. Compile the Code
```bash
mkdir build && cd build
cmake ..
make -j$(nproc)
```

### 4. Run an Example Simulation
To test a single kinetic scheme locally:
```bash
./macro_dr models/scheme_1.txt
```

## 🚀 Running MCMC Simulations

### Running on a Local Machine
For testing on a local machine, use:
```bash
./macro_dr scripts/run_evidence.txt
```

### Running on a HPC Cluster (SLURM)
If using **SLURM**, batch job submission scripts are provided in `slurm/`. For example:
```bash
sbatch slurm/run_32_scheme_10_DR.sh
```
Modify the scripts to match your cluster configuration.

## 📊 Output and Post-Processing
Simulation results, including posterior distributions and model evidence, are stored in:
- `results/`: Processed outputs and log files
- `chains/`: MCMC sampled parameter chains
- `plots/`: Visualization scripts for posterior analysis

## ❓ FAQ

### 1. How do I modify the kinetic models?
All models are stored in the `models/` directory. You can edit or create new `.txt` files following the format used in the existing models.

### 2. How can I resume an interrupted MCMC run?
Use the continuation scripts in `slurm/`, such as:
```bash
sbatch slurm/run_64_CPU_32_schemes_9_DR_SNR_continuation.sh
```

### 3. Where can I find previous versions of this analysis?
The full development history, including prior iterations of models and priors, is available in the commit history of this repository and the main `macro_dr` repository.

## 📜 Citation
If you use this repository for your research, please cite our manuscript (reference will be updated upon acceptance).

## 📬 Contact
For any questions or issues, please contact **[Luciano Moffatt]** at **lmoffatt@qi.fcen.uba.ar** or open an issue on GitHub.
```
