new_path_worker <- function(path_example) {
  structure <- list(directory = dirname(path_example))
  class(structure) <- "path_worker"
  return(structure)
}
