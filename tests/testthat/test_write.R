tear_down <- function(folder) {
  unlink(folder, recursive = TRUE, force = TRUE)
}

describe("write_csv", {
  example_data <- tibble::tibble(
    a = 1:5,
    b = letters[1:5]
  )
  path_example <- "/workdir/borrame/example.csv"
  dir.create("borrame")
  it("writes a csv and datapackage", {
    write_csv(example_data, path_example)
    expect_true(file.exists(path_example))
    expect_true(file.exists("/workdir/borrame/datapackage.json"))
    tear_down("/workdir/borrame")
  })
})
