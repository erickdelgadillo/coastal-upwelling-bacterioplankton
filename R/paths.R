# Resolve local data independently from the Git repository location.
coastal_project_dir <- function() {
  working_dir <- normalizePath(getwd(), winslash = "/", mustWork = TRUE)
  candidates <- unique(c(working_dir, dirname(working_dir)))
  matches <- candidates[
    dir.exists(file.path(candidates, "r_analysis")) &
      file.exists(file.path(candidates, "R", "paths.R"))
  ]

  if (!length(matches)) {
    stop("Cannot locate the Coastal Upwelling project root from: ", working_dir)
  }

  matches[[1]]
}

COASTAL_PROJECT_DIR <- coastal_project_dir()

# R only reads .Renviron automatically from its startup directory. Explicitly
# read the project-local file so command-line runs from r_analysis/ work too.
local_renviron <- file.path(COASTAL_PROJECT_DIR, ".Renviron")
if (!nzchar(Sys.getenv("COASTAL_UPWELLING_DATA_DIR", unset = "")) &&
    file.exists(local_renviron)) {
  readRenviron(local_renviron)
}

coastal_data_dir <- function(project_dir = COASTAL_PROJECT_DIR) {
  configured_dir <- Sys.getenv("COASTAL_UPWELLING_DATA_DIR", unset = "")
  data_dir <- if (nzchar(configured_dir)) {
    path.expand(configured_dir)
  } else {
    file.path(project_dir, "data")
  }

  if (!dir.exists(data_dir)) {
    stop(
      "Coastal Upwelling data directory does not exist: ", data_dir,
      "\nSet COASTAL_UPWELLING_DATA_DIR in the project-local .Renviron file."
    )
  }

  normalizePath(data_dir, winslash = "/", mustWork = TRUE)
}

COASTAL_DATA_DIR <- coastal_data_dir()
coastal_data_file <- function(...) file.path(COASTAL_DATA_DIR, ...)
