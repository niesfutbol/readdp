tear_down <- function(folder) {
  unlink(folder, recursive = TRUE, force = TRUE)
}

describe("write_csv", {
  example_data <- tibble::tibble(
    a = 1:5,
    b = letters[1:5]
  )
  path_example <- "/workdir/borrame/example.csv"
  dir.create("/workdir/borrame")
  it("writes a csv and datapackage when the folder is empty", {
    write_csv(example_data, path_example)
    expect_true(file.exists(path_example))
    expect_true(file.exists("/workdir/borrame/datapackage.json"))
  })
  it("writes a csv and datapackage when the folder is not empty", {
    expected_r_script_name <- "/workdir/src/another_script.R"
    Sys.setenv(R_SCRIPT_NAME = expected_r_script_name)
    path_example <- "/workdir/borrame/example_2.csv"
    write_csv(example_data, path_example)
    expect_true(file.exists(path_example))
    resource <- jsonlite::fromJSON("/workdir/borrame/datapackage.json")$resources
    expected_nrows <- 2
    obtained_nrows <- nrow(resource)
    expect_equal(obtained_nrows, expected_nrows)
    obtained_r_script_name <- resource[2, ]$history
    expect_equal(obtained_r_script_name, expected_r_script_name)
    tear_down("/workdir/borrame")
  })
  it("re writes a csv and datapackage", {
    expected_r_script_name <- "/workdir/src/another_script.R"
    Sys.setenv(R_SCRIPT_NAME = expected_r_script_name)
    path_example <- "/workdir/tests/data/example.csv"
    write_csv(example_data, path_example, TRUE)
  })
})
