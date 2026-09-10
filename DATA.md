# External data

Research inputs are stored outside the Git repository. On this workstation the
data root is:

```text
/home/erick/Data/ProjectsData/coastal-upwelling-bacterioplankton/data
```

The project-local `.Renviron` sets `COASTAL_UPWELLING_DATA_DIR` to that path and
is ignored by Git. On another computer, copy `.Renviron.example` to `.Renviron`
and set the absolute path. A Windows example is:

```text
COASTAL_UPWELLING_DATA_DIR=D:/ProjectsData/coastal-upwelling-bacterioplankton/data
```

## Layout

```text
data/
├── r/Calculations/       # 19 compact tables and three large R inputs
└── matlab/
    ├── temporal/         # Published and exploratory temporal workbooks
    ├── longitudinal/     # ENV1–ENV3 transect workbooks
    ├── exploratory/      # General temporal metadata
    └── figures/          # Inputs for the plain MATLAB figure scripts
```

R notebooks resolve files through `R/paths.R`. For MATLAB, start in the Git
repository and call `coastal_setup` with `temporal`, `longitudinal`,
`exploratory`, or `figures`. The historical Live Scripts read their workbooks
by relative filename, so the setup function changes MATLAB's working directory
to the selected external input folder.

The inspected tables contain oceanographic and molecular observations and no
personal contact information. Sequence datasets cited in the publication are
available from ENA under `PRJEB36188`, `PRJEB36099`, and `PRJEB36728`.
