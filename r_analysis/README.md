# ENVISION R analysis

This directory contains the final R notebooks identified in the historical
ENVISION working directory for the figures and analyses associated with the
original article and its 2026 correction.

## Selected notebooks

| Notebook | Historical source | Scope |
| --- | --- | --- |
| `publication_figures.Rmd` | `ENVISION_minor_revisions.Rmd` | Revised main workflow for environmental, taxonomic, transcriptomic, gene-abundance, ratio, and supplementary plots |
| `figure2_rda.Rmd` | `Datasets/Los RDAs_correctos.Rmd` | Final RDA panels B–D used in Figure 2 |
| `correction_2026.Rmd` | `Ultim GRAFICA ENVISION.Rmd` | Corrected phosphorus and `pstS` ratio analyses prepared for the 2026 correction |

The notebooks were selected by comparing names, modification dates, input
paths, output names, and the final article figures. Older copies, exploratory
plots, and unrelated INTERES analyses were deliberately excluded. The
scientific calculations are preserved; only output paths and minimal setup
code were made portable.

## External inputs

The external `data/r/Calculations/` directory contains the 19 compact CSV
inputs referenced by the selected notebooks. These include CTD and
environmental metadata, sample labels, ASV summaries, taxonomic labels,
protein-profile annotations, plotting helpers, and the corrected 2026
phosphorus table.

Three large inputs required by the full main workflow are not committed:

- `ENV_field_generalmetabolism_tax.rds` (about 132 MB)
- `envision_general_metabolism_june2022.feather` (about 998 MB)
- `uc099_debris.archaea_bacteria.count_tpm_clr_(2022).tsv` (about 9.19 GB)

All three are available under the same external `data/r/Calculations/`
directory. They exceed the sensible scope of a normal Git repository and
should eventually be deposited in a research-data archive rather than
committed to Git history. A fresh GitHub clone does not include any inputs.

## Running the notebooks

Copy `.Renviron.example` to `.Renviron` and configure
`COASTAL_UPWELLING_DATA_DIR`. Then start R from the repository root and switch
to this directory:

```r
setwd("r_analysis")
```

Use this order:

1. Run `publication_figures.Rmd`.
2. In the same R session, run `figure2_rda.Rmd`; it reuses objects created by
   the main notebook.
3. Run `correction_2026.Rmd` independently for the corrected phosphorus plots.

Input paths are resolved by `R/paths.R`. Generated files are written under
`Results/Figures/`; a few historical chunks write PNG files directly under
`r_analysis/`. Both locations are ignored by Git.
The main notebook lists its package dependencies in the opening setup chunk;
they include tidyverse components, `vegan`, `CoDaSeq`, `ggord`, `ggh4x`,
`ComplexHeatmap`, Bioconductor packages, and several plotting extensions.

## Validation status

The three selected notebooks have valid R syntax after extracting their code
chunks, all external inputs are readable, and active paths no longer point to
a personal Windows directory. The correction notebook was executed
successfully with R 4.3.3 and generated both expected PNG files; it emitted
only non-fatal warnings from newer plotting-package versions. The restored
historical main workflow completed end to end using the local archive, and its
RDA workflow completed a functional validation with nine permutations. The
production RDA default remains 999 and is substantially more expensive.
