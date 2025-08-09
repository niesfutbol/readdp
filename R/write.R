write_csv <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- Path_Worker$filename
  paquete <- frictionless::create_package() |>
    frictionless::add_resource(resource_name = name, data = datos)
  paquete |> frictionless::write_package(directory)
}

write_csv_with_existed_dp <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- Path_Worker$filename
  path_dp <- Path_Worker$datapackage_path
  paquete <- frictionless::read_package(path_dp) |>
    frictionless::add_resource(resource_name = name, data = datos)
  paquete |> frictionless::write_package(directory)
}
