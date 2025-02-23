% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read_vcf.R
\name{read_vcf}
\alias{read_vcf}
\title{Read in VCF format}
\usage{
read_vcf(
  path,
  nThread = 1,
  temp_save = FALSE,
  keep_extra_cols = FALSE,
  save_path = tempfile(),
  nrows = Inf
)
}
\arguments{
\item{path}{Filepath for the summary statistics file to be formatted. A
dataframe or datatable of the summary statistics file can also be passed
directly to MungeSumstats using the path parameter.}

\item{nThread}{Number of threads to use for parallel processes.}

\item{temp_save}{Save temprorary file before proceeding,}

\item{keep_extra_cols}{Keep non-standard columns.}

\item{save_path}{File path to save formatted data. Defaults to
\code{tempfile(fileext=".tsv.gz")}.}

\item{nrows}{integer. The (maximal) number of lines to read.
If \code{Inf}, will read in all rows.}
}
\value{
The modified sumstats_file
}
\description{
Read in VCF format
}
\keyword{internal}
