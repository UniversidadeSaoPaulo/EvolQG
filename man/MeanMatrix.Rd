% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MeanMatrix.R
\name{MeanMatrix}
\alias{MeanMatrix}
\title{Mean Covariance Matrix}
\usage{
MeanMatrix(matrix.array, tol = 1e-10, verbose = FALSE)
}
\arguments{
\item{matrix.array}{k x k x m array of covariance matrices, with k traits and m matrices}

\item{tol}{minimum riemannian distance between sequential iterated means for accepting an estimated matrix}

\item{verbose}{print values for each iteration?}
}
\value{
geometric mean covariance matrix
}
\description{
Estimate geometric mean for a set of covariance matrices
}
\author{
Guilherme Garcia, Diogo Melo
}
\references{
Bini, D. A., Iannazzo, B. 2013. Computing the Karcher Mean of Symmetric
Positive Definite Matrices. Linear Algebra and Its Applications, 16th ILAS Conference
Proceedings, Pisa 2010, 438 (4): 1700-1710. doi:10.1016/j.laa.2011.08.052.
}
\seealso{
\code{\link{EigenTensorDecomposition}}, \code{\link{RiemannDist}}
}

