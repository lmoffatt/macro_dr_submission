# MacroDR Submission Repository

This repository contains the exact code and analysis used for the submission of our manuscript on **Bayesian analysis reveals asymmetry in P2X2
receptor activation**. It provides all necessary scripts, models, and configurations to **replicate the MCMC runs** performed in the study.

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



## 🚀 Running MCMC Simulations

### Running on a Local Machine
For calculating the Evidence of scheme 10 using the recursive algorithm on a local machine:
```bash
./macro_dr ../models/scheme_10.txt   ../scripts/idealize_experiment_2.txt  ../scripts/simulation.txt  --runIdName=\"scheme_10_DR\"  --num_scouts_per_ensemble=get_number\(n=32\)  --max_iter_equilibrium=get_number\(n=1000000\)  ../scripts/likelihood_DR.txt ../scripts/beta_4.txt ../scripts/evidence_thermo_dts_data.txt
```

and for the non-recursive algorithm
```bash
./macro_dr ../models/scheme_10.txt   ../scripts/idealize_experiment_2.txt  ../scripts/simulation.txt  --runIdName=\"scheme_10_SNR\"  --num_scouts_per_ensemble=get_number\(n=32\)  --max_iter_equilibrium=get_number\(n=1000000\)  ../scripts/likelihood_SNR.txt ../scripts/beta_4.txt ../scripts/evidence_thermo_dts_data.txt
```

Replace scheme_10 by any other scheme (scheme_1 to scheme_11). 


### Running on a HPC Cluster (SLURM)
If using **SLURM**, batch job submission scripts are provided in `slurm/`. For example:
```bash
sbatch slurm/run_32_scheme_10_DR.sh
```
Modify the scripts to match your cluster configuration.

## 📊 Output

Simulation results—including posterior distributions and model evidence—are stored in the following files. In these filenames:
- **beta** refers to the thermodynamic integration temperature parameter used for the evidence calculation.
- **walker** denotes the index of each element in the ensemble of parameter samples.

- `*_iter_time.csv`: Computational time per iteration.
- `*__i_iter.csv`: LogPrior, logLikelihood, logEvidence, and other metrics indexed by MCMC iteration and beta.
- `*__i_beta__i_walker.csv`: LogPrior, logLikelihood, logEvidence, and other metrics indexed by MCMC iteration, beta, and walker.
- `*__i_beta__i_walker__i_x.csv`: Partial logLikelihood, predicted mean current, variance, and additional quantities indexed by MCMC iteration, beta, walker, and measurement sample.
- `*__i_beta__i_walker__i_par.csv`: Parameter values indexed by iteration, beta, walker, and parameter.
- `*__i_beta__i_walker__i_par_i_state.csv`: Kinetic rates indexed by iteration, beta, walker, and model state transition index.
- `*__i_beta__i_walker__i_x_i_state.csv`: State probabilities indexed by iteration, beta, walker, measurement sample, and model state index.


## 📊 Post-Processing


## ❓ FAQ

### 1. How do I modify the kinetic models priors?
All models priors are stored in the `models/` directory. You can edit or create new `.txt` files following the format used in the existing models. 

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
