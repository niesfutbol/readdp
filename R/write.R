write_csv <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- Path_Worker$filename
  paquete <- frictionless::create_package() |>
    frictionless::add_resource(resource_name = name, data = datos)
  paquete |> frictionless::write_package(directory)
}
