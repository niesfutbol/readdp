describe("path_worker", {
  it("Return directory", {
    path_example <- "results/example.csv"
    Path_Worker <- new_path_worker(path_example)
    expect_s3_class(Path_Worker, "path_worker")
  })
})
