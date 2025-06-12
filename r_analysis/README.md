# 📈 R Analysis Scripts for MacroDR

This folder contains **R Markdown scripts** for all figures, tables, and statistical analyses generated from the MCMC dataset for the manuscript:

> *Bayesian inference of functional asymmetry in a ligand-gated ion channel*
> Luciano Moffatt & Gustavo Pierdominici-Sottile

The scripts reproduce all **model selection and inference figures/tables** from the paper—**except for those based on molecular dynamics simulations**. All necessary image assets are included in the repository.

---

## ⚡ Quick Start

1. **Download and extract the MCMC data**

   Download the MCMC dataset from Zenodo:
   [https://doi.org/10.5281/zenodo.15085037](https://doi.org/10.5281/zenodo.15085037)

   Place the relevant `.csv` files in the repository root or as indicated in each script header.

2. **Install required R packages**

   Most scripts require the following (install from CRAN if needed):

   ```r
   install.packages(c("tidyverse", "patchwork", "envalysis", "HDInterval"))
   # Optionally: "ggimage", "ggsvg" if used by specific scripts
   ```

3. **Install the `ConformationalModel` package**

   > **Important:** Some scripts will try to install this automatically, but **we recommend installing it beforehand** for reproducibility:

   ```r
   if (!requireNamespace("devtools", quietly = TRUE)) {
     install.packages("devtools")
   }
   devtools::install_github("lmoffatt/ConformationalModel")
   ```

   This package is not on CRAN; it is needed for several model-specific figure scripts.

4. **Render figures/tables**

   Each `.Rmd` file corresponds to a manuscript or supplementary figure/table (excluding MD-based figures).
   Run from RStudio or the command line, for example:

   ```r
   rmarkdown::render("Figure_1.Rmd")
   ```

   Make sure all required CSVs and image files are in the right places.

---

## 📁 Folder Contents

* `Figure_*.Rmd` — Scripts for each main or supplementary figure (except MD figures).
* `Supplementary Tables.Rmd` — Generates supplementary tables.
* `Pre_processing.Rmd` — Data cleanup, archival utilities.
* `drawings/` — All required image assets for figure generation.
* `README.md` — This document.

---

## 💡 Notes & Troubleshooting

* **ConformationalModel:**
  If you see errors about a missing package, please (re)install as above.
* **Data & images:**
  All necessary image assets are included; make sure the CSV files are downloaded and placed as described.
* **Reproducibility:**
  Only figures based on MCMC/kinetic modeling are covered here; MD results require separate pipelines.

---

## 📚 Citation

If you use these scripts, please cite the **manuscript** and **Zenodo dataset** (see the main repo README).

---

## 👥 Contact

Questions or issues?
Contact Luciano Moffatt: [lmoffatt@qi.fcen.uba.ar](mailto:lmoffatt@qi.fcen.uba.ar)
or open an [issue on GitHub](https://github.com/lmoffatt/macro_dr_submission/issues).


