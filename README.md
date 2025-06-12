# MacroDR: Bayesian Kinetic Modeling of P2X2 Activation

This repository accompanies the manuscript  
**"Bayesian inference of functional asymmetry in a ligand-gated ion channel"**  
**Luciano Moffatt\*** and **Gustavo Pierdominici-Sottile**

It provides the exact code and analysis scripts used to generate the results in the paper, including (1) the **C++ implementation of the MacroIR (Macroscopic Interval Recursive) algorithm** for MCMC sampling of kinetic models, and (2) **R scripts** for post-processing, statistical analysis, and figure/table generation.

## 🗂️ Repository Structure

```

macro\_dr\_submission/
│── models/                 # Kinetic model definitions (text files)
│── experiments/            # Experimental protocols and data
│── scripts/                # Scripts to run C++ simulations and MCMC
│── slurm/                  # Batch scripts for HPC/cluster runs
│── r\_analysis/             # R scripts for post-processing, analysis & figures
│── CMakeLists.txt          # Build instructions for C++ code
│── README.md               # This document

````

## 🚀 Getting Started

### Typical Use Case: Reproducing Figures from Published MCMC Data

1. **Download the MCMC data from Zenodo**  
   - Go to [Zenodo link/DOI here] and download the compressed dataset(s) listed in the paper/README.
   - Unpack the files in the project root or as described in `r_analysis/README.md`.

2. **Install R dependencies**  
   The analysis scripts in `r_analysis/` require `tidyverse`, `patchwork`, `envalysis`, `HDInterval`, `extrafont`, and possibly `ggimage` or `ggsvg`.  
   You can install these in R with:
   ```r
   install.packages(c("tidyverse", "patchwork", "envalysis", "HDInterval", "extrafont", "ggimage"))
````

3. **Run the R scripts for figures/tables**
   Each Rmd file in `r_analysis/` corresponds to a figure or supplementary analysis.
   For example, to generate Figure 1:

   ```r
   # From R or RStudio in the repo root:
   rmarkdown::render("r_analysis/Figure_1.Rmd")
   ```

   Make sure the expected `.csv` data files (as referenced in the scripts) are present and that image paths are updated if needed.

---

### Advanced: Reproducing MCMC Sampling (Optional/Expert Use)

To fully regenerate the MCMC datasets:

* Compile the C++ code (requires C++20, GSL, OpenMP, BLAS/LAPACK; see install instructions below)
* Edit/run the batch scripts in `slurm/` or execute `macro_dr` directly with the desired parameters, model, and experiment definition.
* Output files will be created with the naming conventions explained below.

---

## 🔧 Installation and Setup

### 1. Clone the Repository

```bash
git clone https://github.com/lmoffatt/macro_dr_submission.git
cd macro_dr_submission
```

### 2. Install C++ Dependencies (if building/running samplers)

* C++20 compiler (GCC ≥10 or Clang ≥11)
* CMake ≥3.5
* libgsl-dev, liblapack-dev, libopenblas-dev, OpenMP

On Debian/Ubuntu:

```bash
sudo apt update && sudo apt install cmake libgsl-dev liblapack-dev libopenblas-dev g++
```

### 3. Build C++ Code (Optional)

```bash
mkdir build && cd build
cmake ..
make -j$(nproc)
```

---

## 📦 Data Organization and Output Files

**MCMC outputs** are large and are provided as precomputed `.csv` files via Zenodo.
Key file types:

* `*_i_walker.csv`: log-evidence samples
* `*_i_par.csv`: parameter samples
* `*_i_x.csv`: predicted currents
* `*_i_state.csv`: predicted state probabilities
* Other files as described in `r_analysis/README.md` or the figure scripts

Experimental data used for model fitting is from:

> Moffatt & Hume (2007) J Gen Physiol 130(2):183–201
> [https://doi.org/10.1085/jgp.20070977](https://doi.org/10.1085/jgp.20070977)

---

## 📊 Reproducing Manuscript Figures & Tables

All figure/table scripts are found in `r_analysis/` and are named according to the manuscript’s figures.

* Place the required `.csv` files (see each Rmd script header/comments for filenames) in the expected locations.
* Some figures may require image files in `r_analysis/drawings/`.
* Render each `.Rmd` as needed. See `r_analysis/README.md` for tips and troubleshooting.

---

## 🧠 About MacroIR

This repository implements the **MacroIR (Macroscopic Interval Recursive)** algorithm, a Bayesian inference and model selection method for kinetic schemes and Markov models.
If you use or adapt MacroIR in your work, please reference this repository and the relevant manuscript.

For technical questions, consult the code documentation or contact Luciano Moffatt.

---

## 📜 Citation

If you use this repository, code, or dataset, **please cite**:

- **The manuscript:**  
  > Moffatt L\*, Pierdominici-Sottile G.  
  > "Bayesian inference of functional asymmetry in a ligand-gated ion channel" (submitted; citation to be updated)
- **Zenodo dataset:**  
  > Moffatt, Luciano (2025).  
  > *MCMC Output Data for Bayesian Inference of P2X2 Receptor Kinetics – Data used in the manuscript "Bayesian inference of functional asymmetry in a ligand-gated ion channel"* (Version v1).  
  > Zenodo. https://doi.org/10.5281/zenodo.15085037
- **Experimental data:**  
  > Moffatt & Hume (2007), J Gen Physiol 130(2):183–201, [https://doi.org/10.1085/jgp.20070977](https://doi.org/10.1085/jgp.20070977)

If you use or adapt the **MacroIR** algorithm, please also mention this repository and MacroIR explicitly.

---

## 📬 Contact

Questions, suggestions, or bug reports?
Contact **Luciano Moffatt** at [lmoffatt@qi.fcen.uba.ar](mailto:lmoffatt@qi.fcen.uba.ar)
or open an issue on [GitHub](https://github.com/lmoffatt/macro_dr_submission/issues).


