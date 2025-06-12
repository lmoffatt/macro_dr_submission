# MacroDR: Bayesian Kinetic Modeling of P2X2 Activation

This repository accompanies the manuscript:

> **"Bayesian inference of functional asymmetry in a ligand-gated ion channel"**  
> *Luciano Moffatt* and *Gustavo Pierdominici-Sottile*

It provides:
- The C++ source code for the **MacroIR (Macroscopic Interval Recursive)** algorithm for Bayesian inference and MCMC sampling of kinetic models.
- R scripts for post-processing, statistical analysis, and figure/table generation as used in the manuscript.
- Complete reproducibility: all primary MCMC data is available via Zenodo (see below), so you can generate all the figures/tables directly.

---

## 📦 Data and Reproducibility

Most users can reproduce all main results and figures **without running any C++ code** by using the provided dataset:

- **MCMC output data** is archived on Zenodo:  
  [https://doi.org/10.5281/zenodo.15085037](https://doi.org/10.5281/zenodo.15085037)

This dataset includes all the raw outputs (CSV files) required for the R analysis scripts.  
For data organization and script usage, see [`r_analysis/README.md`](r_analysis/README.md).

---

## 📁 Repository Structure

```

macro\_dr\_submission/
├── models/          # Kinetic model definitions (text files)
├── experiments/     # Experimental protocols and data
├── scripts/         # Scripts to run C++ simulations and MCMC
├── slurm/           # Batch scripts for HPC/cluster runs
├── r\_analysis/      # R scripts for post-processing, analysis, and figures/tables
├── CMakeLists.txt   # Build configuration for C++ code
├── README.md        # This document

````

---

## 🚀 Quick Start: Reproduce Manuscript Figures from MCMC Data

1. **Download the MCMC dataset from Zenodo:**  
   [https://doi.org/10.5281/zenodo.15085037](https://doi.org/10.5281/zenodo.15085037)

2. **Unpack the files** in the project root, or as described in [`r_analysis/README.md`](r_analysis/README.md).

3. **Install R dependencies:**

    ```r
    install.packages(c("tidyverse", "patchwork", "envalysis", "HDInterval", "extrafont"))
    # Optionally: "ggimage", "ggsvg" if figure scripts require them
    ```

4. **Render figures/tables:**  
    Each Rmd in `r_analysis/` corresponds to a manuscript or supplementary figure/table.

    ```r
    # Example: From the repo root in R or RStudio
    rmarkdown::render("r_analysis/Figure_1.Rmd")
    ```

    Ensure the required `.csv` data files (from Zenodo) are present in the expected locations.

---

## 🛠️ Advanced: Run Your Own MCMC Simulations

If you wish to perform new simulations or extend the analysis:

- **Compile the C++ code** (requires C++20, OpenMP, GSL, BLAS/LAPACK; see install instructions below).
- **Edit and use scripts** in `scripts/` and `slurm/` to launch custom MCMC runs.
- Output files will be generated in the formats expected by the R scripts.

---

## ℹ️ About MacroIR

This repository implements the **MacroIR (Macroscopic Interval Recursive)** algorithm for Bayesian kinetic inference.  
If you use or adapt MacroIR in your work, please reference this repository and the associated manuscript. 

MacroDR mean Macroscopic Double Recursive, a former name for MacroIR (double because it uses two points for each interval)

---

## 🗃️ Data Organization and Output Files

**Key MCMC output file types:**

- `*_i_walker.csv`: log-evidence samples
- `*_i_par.csv`: parameter samples
- `*_i_x.csv`: predicted current
- `*_i_state.csv`: predicted state probabilities

For detailed usage, see `r_analysis/README.md` and the figure/table scripts.

**Experimental data used for model fitting:**

> Moffatt & Hume (2007)  
> *Responses of Rat P2X2 Receptors to Ultrashort Pulses of ATP Provide Insights into ATP Binding and Channel Gating*  
> J Gen Physiol 130(2):183–201  
> [https://doi.org/10.1085/jgp.20070977](https://doi.org/10.1085/jgp.20070977)

---

## 📝 Citation

If you use this repository, code, or dataset, **please cite**:

- **The manuscript:**  
    Moffatt L\*, Pierdominici-Sottile G.  
    *Bayesian inference of functional asymmetry in a ligand-gated ion channel* (submitted; cite preprint or published DOI once available)

- **Zenodo dataset:**  
    Moffatt, Luciano (2025).  
    *MCMC Output Data for Bayesian Inference of P2X2 Receptor Kinetics – Data used in the manuscript 'Bayesian inference of functional asymmetry in a ligand-gated ion channel'*.  
    Zenodo. [https://doi.org/10.5281/zenodo.15085037](https://doi.org/10.5281/zenodo.15085037)

- **Experimental data:**  
    Moffatt & Hume (2007), J Gen Physiol 130(2):183–201  
    [https://doi.org/10.1085/jgp.20070977](https://doi.org/10.1085/jgp.20070977)

If you use or adapt the **MacroIR** algorithm, please also reference this repository and algorithm name.

---

## 📬 Contact

Questions, suggestions, or bug reports?  
Contact **Luciano Moffatt** at [lmoffatt@qi.fcen.uba.ar](mailto:lmoffatt@qi.fcen.uba.ar)  
or open an issue at [GitHub Issues](https://github.com/lmoffatt/macro_dr_submission/issues).

---


