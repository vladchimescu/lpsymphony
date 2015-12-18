\name{lpsymphony_solve_LP}
\alias{lpsymphony_solve_LP}
\title{COIN-OR SYMPHONY Linear and Mixed Integer Programming Solver}
\description{
  High level R interface to the COIN-OR SYMPHONY solver for linear as
  well as mixed integer linear programming problems (MILPs).
}
\usage{
lpsymphony_solve_LP(obj, mat, dir, rhs, bounds = NULL, types = NULL,
                   max = FALSE, verbosity = -2, time_limit = -1,
                   node_limit = -1, gap_limit = -1, first_feasible = FALSE,
                   write_lp = FALSE, write_mps = FALSE)
}
\arguments{
  \item{obj}{a vector with the objective coefficients}
  \item{mat}{a vector or a matrix of the constraint coefficients}
  \item{dir}{a character vector with the directions of the constraints.
    Each element must be one of \code{"<"}, \code{"<="}, \code{">"},
    \code{">="}, \code{"=="} or \code{"!="}.}
  \item{rhs}{the right hand side of the constraints}
  \item{bounds}{\code{NULL} (default) or a list with elements
    \code{upper} and \code{lower} containing the indices and
    corresponding bounds of the objective variables.  The default for
    each variable is a bound between 0 and \code{Inf}.}
  \item{types}{a character vector giving the types of the objective
    variables, with \code{"C"}, \code{"I"}, and \code{"B"} corresponding
    to continuous, integer, and binary, respectively, or \code{NULL}
    (default), taken as all-continuous.  Recycled as needed.}
  \item{max}{a logical giving the direction of the optimization.
    \code{TRUE} means that the objective is to maximize the objective
    function, \code{FALSE} (default) means to minimize it.}
  \item{verbosity}{an integer defining the level of verbosity,
    \code{-2} (default) means no output.}
  \item{time_limit}{an integer defining the time limit in seconds,
    \code{-1} (default) means no time limit.}
  \item{node_limit}{an integer defining the limit in number of iterations,
    \code{-1} (default) means no node limit.}
  \item{gap_limit}{when the gap between the lower and the upper bound
    reaches this point, the solution process will stop and the best
    solution found to that point will be returned,
    \code{-1} (default) means no gap limit.}
  \item{first_feasible}{a logical defining if the solution process
    should stop after the first feasible solution has been found,
    \code{FALSE} (default) means that the solution process does not
    stop after the first feasible solution has been found.}
  \item{write_lp}{a logical value indicating if an LP representation
    of the problem should be written for debugging purposes,
    \code{FALSE} (default) means no LP file is written.}
  \item{write_mps}{a logical value indicating if an MPS representation
    of the problem should be written for debugging purposes,
    \code{FALSE} (default) means no MPS file is written.}
}
\details{
  SYMPHONY is an open source solver for solving mixed integer linear
  programs (MILPs).  The current version can be found at
  \url{https://projects.coin-or.org/SYMPHONY}.  Package \pkg{lpsymphony}
  uses the C interface of the callable library provided by SYMPHONY, and
  supplies a high level solver function in R using the low level C
  interface.
}
\value{
  A list containing the optimal solution, with the following components.
  \item{solution}{the vector of optimal coefficients}
  \item{objval}{the value of the objective function at the optimum}
  \item{status}{an integer with status information about the solution
    returned: 0 if the optimal solution was found, a non-zero value
    otherwise.}
}
\references{
  SYMPHONY development home page
  (\url{https://projects.coin-or.org/SYMPHONY/wiki}).
}
\author{
  Reinhard Harter, Kurt Hornik and Stefan Theussl
}
\seealso{
  \code{\link[lpSolve]{lp}} in package \pkg{lpSolve};
  \code{\link[Rglpk]{Rglpk_solve_LP}} in package \pkg{Rglpk}.
}
\examples{
## Simple linear program.
## maximize:   2 x_1 + 4 x_2 + 3 x_3
## subject to: 3 x_1 + 4 x_2 + 2 x_3 <= 60
##             2 x_1 +   x_2 +   x_3 <= 40
##               x_1 + 3 x_2 + 2 x_3 <= 80
##               x_1, x_2, x_3 are non-negative real numbers

obj <- c(2, 4, 3)
mat <- matrix(c(3, 2, 1, 4, 1, 3, 2, 2, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(60, 40, 80)
max <- TRUE

lpsymphony_solve_LP(obj, mat, dir, rhs, max = max)

## Simple mixed integer linear program.
## maximize:    3 x_1 + 1 x_2 + 3 x_3
## subject to: -1 x_1 + 2 x_2 +   x_3 <= 4
##                      4 x_2 - 3 x_3 <= 2
##                x_1 - 3 x_2 + 2 x_3 <= 3
##                x_1, x_3 are non-negative integers
##                x_2 is a non-negative real number

obj <- c(3, 1, 3)
mat <- matrix(c(-1, 0, 1, 2, 4, -3, 1, -3, 2), nrow = 3)
dir <- c("<=", "<=", "<=")
rhs <- c(4, 2, 3)
max <- TRUE
types <- c("I", "C", "I")

lpsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max)

## Same as before but with bounds replaced by
## -Inf <  x_1 <= 4
##    0 <= x_2 <= 100
##    2 <= x_3 <  Inf

bounds <- list(lower = list(ind = c(1L, 3L), val = c(-Inf, 2)),
               upper = list(ind = c(1L, 2L), val = c(4, 100)))

lpsymphony_solve_LP(obj, mat, dir, rhs, types = types, max = max,
                   bounds = bounds)
}
\keyword{optimize}
