# External data

The R analysis inputs are stored outside the Git repository. On this
workstation, the shared data root is:

```text
/mnt/data/ProjectsData/coastal-upwelling-bacterioplankton/data
```

The project-local `.Renviron` sets `COASTAL_UPWELLING_DATA_DIR` to that path
and is ignored by Git. On another computer, copy `.Renviron.example` to
`.Renviron` and set the absolute path.

## Required layout

```text
data/
└── r/
    └── Calculations/    # Publication-ready tables and processed R objects
```

`R/paths.R` resolves the external root. The selected notebooks read 19 compact
CSV inputs from `data/r/Calculations/`, including environmental metadata,
sample labels, ASV summaries, taxonomic labels, protein-profile annotations,
plotting helpers, and the corrected 2026 phosphorus table.

Three large inputs required by the full main workflow remain external:

- `ENV_field_generalmetabolism_tax.rds` (approximately 132 MB)
- `envision_general_metabolism_june2022.feather` (approximately 998 MB)
- `uc099_debris.archaea_bacteria.count_tpm_clr_(2022).tsv` (approximately 9.19 GB)

These files are too large for normal Git history and should be deposited in a
research-data archive if they are distributed publicly.

The MATLAB input workbooks formerly stored below this shared data root were
moved, without modification, to the dedicated
[`coastal-upwelling-oceanography`](https://github.com/erickdelgadillo/coastal-upwelling-oceanography)
repository. That repository records their SHA-256 checksums and provenance.

The inspected inputs contain environmental and molecular observations and no
personal contact information.
