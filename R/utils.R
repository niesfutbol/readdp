new_path_worker <- function(path_example) {
  structure <- list(
    directory = dirname(path_example), filename = .get_filename(path_example),
    datapackage_path = .get_data_package_path(path_example)
  )
  class(structure) <- "path_worker"
  return(structure)
}

.get_filename <- function(path_example) {
  filename <- tools::file_path_sans_ext(basename(path_example))
  return(filename)
}

.get_data_package_path <- function(path_example) {
  data_package_path <- glue::glue("{dirname(path_example)}/datapackage.json")
  return(data_package_path)
}
