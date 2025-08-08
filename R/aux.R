new_path_worker <- function(path_example) {
  structure <- list(directory = dirname(path_example), filename = .get_filename(path_example))
  class(structure) <- "path_worker"
  return(structure)
}

.get_filename <- function(path_example) {
  filename <- tools::file_path_sans_ext(basename(path_example))
  return(filename)
}
