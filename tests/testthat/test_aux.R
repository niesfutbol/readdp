describe("path_worker", {
  it("Return directory", {
    path_example <- "results/example.csv"
    Path_Worker <- new_path_worker(path_example)
    expect_s3_class(Path_Worker, "path_worker")
  })
  it("Check if the path is a directory", {
    path_example <- "results/example.csv"
    Path_Worker <- new_path_worker(path_example)
    expected_directory <- "results"
    obtained_directory <- Path_Worker$directory
    expect_equal(obtained_directory, expected_directory)
  })
})
