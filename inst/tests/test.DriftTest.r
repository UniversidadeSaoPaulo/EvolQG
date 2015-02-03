test_that("DriftTest return resonable resutls",
{
  means <- array(rnorm(40*10), c(10, 40)) 
  means.list <- alply(means, 1)
  cov.matrix <- RandomMatrix(40, 1, 1, 10)
  test.array <- DriftTest(means, cov.matrix, FALSE)
  test.list <- DriftTest(means.list, cov.matrix, FALSE)
  expect_equal(test.array, test.list)
  expect_is(test.array, "list")
  expect_is(test.array[[1]], "lm")
  expect_is(test.array[[2]], "matrix")
  expect_is(test.array[[3]], "numeric")
  expect_is(test.array[[4]], "numeric")
  expect_is(test.array[[5]], c("gg", "ggplot"))
  expect_equal(names(test.array), c("regression",
                                    "coefficient_CI_95",
                                    "log.between_group_variance",
                                    "log.W_eVals",
                                    "plot"))
  expect_equal(length(test.array$log.between_group_variance), dim(means)[2])
  expect_equal(length(test.array$log.W_eVals), dim(means)[2])
  expect_equal(test.array$log.W_eVals, log(eigen(cov.matrix, only.values = TRUE)$values))
})
          