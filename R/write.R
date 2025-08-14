#' @export
write_csv <- function(datos, file, is_new = FALSE) {
  Path_Worker <- new_path_worker(file)
  select_writer_if_exists(datos, Path_Worker, is_new) |>
    add_r_script_name_to_resource_from_name(Path_Worker$filename) |>
    frictionless::write_package(Path_Worker$directory)
}

select_writer_if_exists <- function(datos, path_worker, is_new) {
  path_dp <- path_worker$datapackage_path
  if (file.exists(path_dp)) {
    return(datapackage_with_existed_dp(datos, path_worker, is_new))
  }
  return(datapackage_with_not_existed_dp(datos, path_worker))
}

datapackage_with_not_existed_dp <- function(datos, path_worker) {
  paquete <- frictionless::create_package() |>
    frictionless::add_resource(resource_name = path_worker$filename, data = datos)
  return(paquete)
}

datapackage_with_existed_dp <- function(datos, path_worker, is_new) {
  paquete <- frictionless::read_package(path_worker$datapackage_path) |>
    frictionless::add_resource(resource_name = path_worker$filename, data = datos, replace = is_new)
  return(paquete)
}
