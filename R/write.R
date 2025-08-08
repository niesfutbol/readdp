write_csv <- function(datos, file) {
  Path_Worker <- new_path_worker(file)
  directory <- Path_Worker$directory
  name <- basename(file) |>
    stringr::str_split("\\.")
  paquete <-
    frictionless::create_package() |>
    frictionless::add_resource(resource_name = name[[1]][1], data = datos)
  paquete |> frictionless::write_package(directory)
}
