test_that("SRD returns correct results",
          {
            cov.matrix.1 <- cov(matrix(rnorm(30*10), 30, 10))
            cov.matrix.2 <- cov(matrix(rnorm(30*10), 30, 10))
            srd.out <- SRD(cov.matrix.1, cov.matrix.2)
            expect_that(srd.out, is_a("list"))
            expect_that(names(srd.out), equals(c("out", "pc1", "model", "cormat")))
            expect_that(names(srd.out[[3]]), equals(c("quantiles", "interval", "code")))
            expect_that(dim(srd.out[[1]]), equals(c(10, 6)))
            expect_that(length(srd.out[[2]]), equals(10))
            expect_that(length(srd.out[[3]]), equals(3))
            expect_that(dim(srd.out[[4]]), equals(c(10, 10)))
            expect_that(srd.out[[1]], is_a("matrix"))
            expect_that(srd.out[[2]], is_a("numeric"))
            expect_that(srd.out[[3]], is_a("list"))
            expect_that(srd.out[[4]], is_a("matrix"))
            srd.scores.bool <- sapply(srd.out[[1]][,1], function(x) isTRUE(x > -1 & x < 1))
            srd.lower.bool <- sapply(srd.out[[1]][,2], function(x) isTRUE(x > -1 & x < 1))
            srd.upper.bool <- sapply(srd.out[[1]][,3], function(x) isTRUE(x > -1 & x < 1))
            srd.sd.bool <- sapply(srd.out[[1]][,4], function(x) isTRUE(x > 0 & x < 1))
            expect_that(sum(srd.scores.bool), equals(length(srd.scores.bool)))
            expect_that(sum(srd.lower.bool), equals(length(srd.scores.bool)))
            expect_that(sum(srd.upper.bool), equals(length(srd.scores.bool)))
            expect_that(mean(srd.out[[1]][,5]), equals(0))
            expect_that(mean(srd.out[[1]][,6]), equals(0))
            expect_that(mean(srd.out[[2]]), equals(0))
            expect_that(sum(diag(srd.out[[4]])), equals(10))
            expect_that(as.numeric(srd.out[[2]] < srd.out[[3]][[2]]), equals(srd.out[[3]][[3]]))
          }
)
