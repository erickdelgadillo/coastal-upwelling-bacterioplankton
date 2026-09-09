# Coastal-upwelling-bacterioplankton

![R](https://img.shields.io/badge/R-analysis-276DC3?logo=r&logoColor=white)
![MATLAB](https://img.shields.io/badge/MATLAB-analysis-orange)
![Metatranscriptomics](https://img.shields.io/badge/Metatranscriptomics-microbial%20ecology-green)
![Status](https://img.shields.io/badge/status-curated%20publication%20workflow-blue)

> Reproducible analysis workflows for studying bacterioplankton functional dynamics across contrasting coastal upwelling conditions.

This repository contains the curated MATLAB and R workflows associated with the study **“Coastal upwelling systems as dynamic mosaics of bacterioplankton functional specialization.”**

The project investigates how environmental variability across a coastal upwelling system is associated with changes in microbial community structure and functional activity. The analyses integrate oceanographic conditions, nutrient distributions, microbial community data, metatranscriptomic information, and gene-abundance patterns across contrasting coastal and offshore environments.

The repository preserves and documents the computational workflows used to generate major and supplementary figures from the study, together with the analyses associated with the 2026 correction. Historical scripts have been curated to distinguish publication workflows from exploratory material and to improve transparency and reproducibility.

## Scientific scope

The analyses represented here include:

- Oceanographic and nutrient profiles across coastal and offshore stations
- Bacterioplankton community and functional patterns
- Environmental–community relationships
- Metatranscriptomic analyses
- Gene-abundance and expression ratios
- Redundancy analysis (RDA)
- Reproduction of published and corrected figures

The repository combines MATLAB workflows originally used for environmental profiles with R workflows used for community, functional, and multivariate analyses.

## Associated publications

- Original article: Delgadillo-Nuño et al. (2024), *Frontiers in Marine Science*, <https://doi.org/10.3389/fmars.2023.1259783>
- Correction: Delgadillo-Nuño et al. (2026), *Frontiers in Marine Science*, <https://doi.org/10.3389/fmars.2026.1886620>

The 2026 correction notice replaces Supplementary Figures 3 and 5. The MATLAB workflows documented here correspond to Supplementary Figures 1 and 2 and are not identified as affected by that correction.

## Published MATLAB workflow

The final article material was compared with the historical ENVISION working directory to identify the scripts that generated the published CTD and nutrient profile panels.

| Published figure | Content | Live scripts | Input workbooks |
| --- | --- | --- | --- |
| Supplementary Figure 1 | Temperature, PAR, chlorophyll-a, salinity, and turbidity profiles | `station3_ctd.mlx`, `station6_ctd.mlx` | `S3_CTD.xlsx`, `S6_CTD.xlsx` |
| Supplementary Figure 2 | Ammonium, nitrite, nitrate, silicate, and phosphate profiles | `station3_nutrients.mlx`, `station6_nutrients.mlx` | `S3_Metadata.xlsx`, `S6_Metadata.xlsx` |

Station 3 is the offshore station and Station 6 is the coastal station. The four input workbooks are kept next to the live scripts because the historical code reads them by relative filename. Checksums and a more detailed mapping are available in [`live_scripts/temporal/README.md`](live_scripts/temporal/README.md).

Files outside this table are retained as historical or exploratory material and are not claimed to reproduce figures from the article.

## Published R workflow

The final R materials were also traced through the historical ENVISION directory. Three notebooks are retained:

| Notebook | Scope |
| --- | --- |
| `publication_figures.Rmd` | Revised main workflow for environmental, community, transcriptomic, gene-abundance, ratio, and supplementary plots |
| `figure2_rda.Rmd` | Final RDA panels B–D for Figure 2 |
| `correction_2026.Rmd` | Corrected phosphorus and `pstS` ratio analysis from 2026 |

The notebooks and their 19 compact CSV inputs are under [`r_analysis/`](r_analysis/README.md).

Large processed objects remain excluded from Git and are documented there. A complete local copy of the recovered ENVISION workspace is kept under the ignored `local_archive/ENVISION/` directory.

## Running the published workflow

Start MATLAB in the repository root and prepare the historical dependency path:

```matlab
repoRoot = pwd;
addpath(fullfile(repoRoot, 'third_party'));
cd(fullfile(repoRoot, 'live_scripts', 'temporal'));
```

Open and run the four live scripts listed above. They read the included Excel workbooks and export the individual panels as 300 dpi PNG files. Generated PNG files are intentionally ignored by Git.

## Repository structure

```text
coastal-upwelling-bacterioplankton/
├── live_scripts/
│   ├── temporal/         # Published temporal profiles and exact inputs
│   └── longitudinal/     # Additional ENV1–ENV3 transect analyses
├── scripts/
│   ├── figures/          # Other historical figure scripts
│   └── exploratory/      # Exploratory analyses
├── r_analysis/           # Selected publication R notebooks and compact inputs
├── third_party/          # External MATLAB utilities and notices
├── data/                 # Data provenance documentation
└── README.md
```

## Data availability

The four compact oceanographic workbooks required by the published MATLAB workflow and the 19 compact CSV inputs used by the selected R notebooks are included.

Large processed objects, other raw tables, generated figures, and the full historical working directory remain excluded from Git.

The sequence data cited by the article are available from the European Nucleotide Archive under:

- `PRJEB36188` — 16S rRNA gene sequences
- `PRJEB36099` — 18S rRNA gene sequences
- `PRJEB36728` (`ERS5513557`–`ERS5513582`) — metatranscriptomes

See [`data/README.md`](data/README.md) for provenance and scope notes.

## Requirements and validation status

The published MATLAB live scripts use `xlsread`, `gridfit`, and `exportgraphics`. `gridfit` is retained under `third_party/` with its original attribution.

The R package requirements are listed in [`r_analysis/README.md`](r_analysis/README.md) and in the setup chunk of the main notebook.

The selected live scripts match the historical files byte for byte, their input schemas were inspected, and their output names and panel contents were matched to the final supplementary figures.

End-to-end MATLAB execution has not yet been repeated because MATLAB was not installed in the curation environment used for repository reconstruction.

The selected R notebooks have been syntax-checked, the 2026 correction notebook was rerun successfully, and the restored historical main workflow completed end to end with the recovered local inputs. The RDA workflow was also validated with a reduced permutation count; its production default remains 999.

## Reproducibility scope

This repository is a curated reconstruction of the computational workflows associated with the published study.

Its purpose is to:

- Preserve the analysis code used in the publication
- Document the relationship between scripts, inputs, and published figures
- Separate final publication workflows from exploratory analyses
- Make the available analyses easier to inspect and reproduce
- Preserve provenance for historical data and computational material

Not all historical intermediate files are included, and the repository does not claim complete end-to-end reproducibility for workflows that depend on unavailable or excluded data.

## Citation

If you use material from this repository, please cite the associated publication:

**Delgadillo-Nuño E. et al. (2024).** Coastal upwelling systems as dynamic mosaics of bacterioplankton functional specialization. *Frontiers in Marine Science*.

See the associated 2026 correction for the revised supplementary analyses.

## Author

**Erick Delgadillo-Nuño**

Marine microbial ecology · Metatranscriptomics · R · MATLAB · Reproducible scientific workflows
