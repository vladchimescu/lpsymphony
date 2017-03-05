context("LP solution")

test_that("lpsymphony_solve_LP works",
          {
            obj <- c(3, 1, 3)
            mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
            dir <- c("<=", "<=", "<=")
            rhs <- c(4, 2, 3)
            max <- TRUE
            types <- c("I", "C", "I")
            loesung <-lpsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max)
            expect_that(loesung, is_a("list"))
            expect_that(loesung$solution, is_a("numeric"))
            expect_that(length(loesung$solution), equals(3))
          })
