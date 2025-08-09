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
    path_example <- "/workdir/borrame/example_2.csv"
    write_csv_with_existed_dp(example_data, path_example)
    expect_true(file.exists(path_example))
    resource <- jsonlite::fromJSON("/workdir/borrame/datapackage.json")$resources
    expected_nrows <- 2
    obtained_nrows <- nrow(resource)
    expect_equal(obtained_nrows, expected_nrows)
    tear_down("/workdir/borrame")
  })
})
