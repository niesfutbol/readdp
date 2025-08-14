#' @export
write_csv <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  select_writer_if_exists(datos, Path_Worker) |>
    add_r_script_name_to_resource_from_name(Path_Worker$filename) |>
    frictionless::write_package(Path_Worker$directory)
}

select_writer_if_exists <- function(datos, path_worker) {
  path_dp <- path_worker$datapackage_path
  if (file.exists(path_dp)) {
    return(datapackage_with_existed_dp(datos, path_worker))
  }
  return(datapackage_with_not_existed_dp(datos, path_worker))
}

datapackage_with_not_existed_dp <- function(datos, path_worker) {
  paquete <- frictionless::create_package() |>
    frictionless::add_resource(resource_name = path_worker$filename, data = datos)
  return(paquete)
}

datapackage_with_existed_dp <- function(datos, path_worker) {
  paquete <- frictionless::read_package(path_worker$datapackage_path) |>
    frictionless::add_resource(resource_name = path_worker$filename, data = datos)
  return(paquete)
}

replace_resource_in_datapackage <- function(datos, path_worker) {
  Path_Worker <- new_path_worker(path_worker)
  paquete <- frictionless::read_package(Path_Worker$datapackage_path) |>
    frictionless::add_resource(resource_name = Path_Worker$filename, data = datos, replace = TRUE)
  return(paquete)
}
