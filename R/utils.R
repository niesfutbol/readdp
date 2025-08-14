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

add_r_script_name_to_last_resource <- function(datapackage) {
  r_script_name <- Sys.getenv("R_SCRIPT_NAME")
  last_resource_index <- length(datapackage$resources)
  datapackage$resources[[last_resource_index]]$history <- r_script_name
  return(datapackage)
}

add_r_script_name_to_resource_from_name <- function(datapackage, resource_name) {
  r_script_name <- Sys.getenv("R_SCRIPT_NAME")
  resource_index <- .obtain_the_right_index(datapackage, resource_name)
  datapackage$resources[[resource_index]]$history <- r_script_name
  return(datapackage)
}

.obtain_the_right_index <- function(datapackage, resource_name) {
  resource_index <- which(purrr::map_chr(datapackage$resources, ~ .x$name) == resource_name)
  if (length(resource_index) == 0) {
    stop(glue::glue("Resource '{resource_name}' not found in the datapackage."))
  }
  return(resource_index)
}
