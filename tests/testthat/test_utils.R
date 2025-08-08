describe("path_worker", {
  path_example <- "results/example.csv"
  Path_Worker <- new_path_worker(path_example)
  it("Check class type", {
    expect_s3_class(Path_Worker, "path_worker")
  })
  it("Check if the path is a directory", {
    expected_directory <- "results"
    obtained_directory <- Path_Worker$directory
    expect_equal(obtained_directory, expected_directory)
  })
  it("Check filename", {
    expected_filename <- "example"
    obtained_filename <- Path_Worker$filename
    expect_equal(obtained_filename, expected_filename)
  })
  it("Check data package path", {
    expected_data_package_path <- "results/datapackages.json"
    obtained_data_package_path <- Path_Worker$datapackage_path
    expect_equal(obtained_data_package_path, expected_data_package_path)
  })
  it("Check data package path: second example", {
    path_example <- "data/example.csv"
    Path_Worker <- new_path_worker(path_example)
    expected_data_package_path <- "data/datapackages.json"
    obtained_data_package_path <- Path_Worker$datapackage_path
    expect_equal(obtained_data_package_path, expected_data_package_path)
  })
})
