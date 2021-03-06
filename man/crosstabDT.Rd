% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/crosstabDT.R
\name{crosstabDT}
\alias{crosstabDT}
\title{Speedy Raster Cross-tabulation}
\usage{
crosstabDT(x, y, digits = 0, long = FALSE, useNA = FALSE)
}
\arguments{
\item{x}{A \code{Raster*} object}

\item{y}{If \code{x} has just one layer, a \code{RasterLayer}
object. Otherwise, if \code{x} is a multi-layered
\code{RasterStack} or \code{RasterBrick}, this argument (if
any) is unused.}

\item{digits}{Integer. The number of digits for rounding the
values before cross-tabulation. Default is \code{0}.}

\item{long}{Logical. If \code{TRUE}, the results are returned in a
'long' format \code{data.table} instead of as a table. Default
is \code{FALSE}.}

\item{useNA}{Logical. Should the returned table or
\code{data.table} include counts of \code{NA} values? Default
is \code{FALSE}.}
}
\value{
Either a table or a \code{data.table} recording the
    frequency of each combination of raster values.
}
\description{
A fast \code{data.table}-based alternative to
\code{\link[raster:crosstab]{raster::crosstab()}}.
}
\examples{
r <- raster(nc = 5, nr = 5)
r[] <- runif(ncell(r)) * 2
s <- setValues(r, runif(ncell(r)) * 3)
crosstabDT(r, s)

rs <- r/s
r[1:5] <- NA
s[20:25] <- NA
x <- stack(r, s, rs)
crosstabDT(x, useNA = TRUE, long = TRUE)
}
\author{
Joshua O'Brien
}
