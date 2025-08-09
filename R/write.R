write_csv <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- Path_Worker$filename
  path_dp <- Path_Worker$datapackage_path
  if (file.exists(path_dp)) {
    write_csv_with_existed_dp(datos, file, )
    return()
  }
  write_csv_with_not_existed_dp(datos, Path_Worker)
}

write_csv_with_not_existed_dp <- function(datos, path_worker) {
  paquete <- frictionless::create_package() |>
    frictionless::add_resource(resource_name = path_worker$filename, data = datos)
  paquete |> frictionless::write_package(path_worker$directory)
}

write_csv_with_existed_dp <- function(datos, file, directory) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- Path_Worker$filename
  path_dp <- Path_Worker$datapackage_path
  paquete <- frictionless::read_package(path_dp) |>
    frictionless::add_resource(resource_name = name, data = datos)
  paquete |> frictionless::write_package(directory)
}
