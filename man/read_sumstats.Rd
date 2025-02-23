% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_sumstats.R
\name{read_sumstats}
\alias{read_sumstats}
\title{Determine summary statistics file type and read them into memory}
\usage{
read_sumstats(
  path,
  nThread = 1,
  nrows = Inf,
  standardise_headers = FALSE,
  mapping_file = sumstatsColHeaders
)
}
\arguments{
\item{path}{Filepath for the summary statistics file to be formatted. A
dataframe or datatable of the summary statistics file can also be passed
directly to MungeSumstats using the path parameter.}

\item{nThread}{Number of threads to use for parallel processes.}

\item{nrows}{integer. The (maximal) number of lines to read.
If \code{Inf}, will read in all rows.}

\item{standardise_headers}{Standardise headers first.}

\item{mapping_file}{MungeSumstats has a pre-defined column-name mapping file
which should cover the most common column headers and their interpretations.
However, if a column header that is in youf file is missing of the mapping we
give is incorrect you can supply your own mapping file. Must be a 2 column
dataframe with column names "Uncorrected" and "Corrected". See
data(sumstatsColHeaders) for default mapping and necessary format.}
}
\value{
\code{data.table} of formatted summary statistics
}
\description{
Determine summary statistics file type and read them into memory
}
\examples{
path <- system.file("extdata", "eduAttainOkbay.txt",
    package = "MungeSumstats"
)
eduAttainOkbay <- read_sumstats(path = path)
}
