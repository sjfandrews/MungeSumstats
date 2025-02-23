% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/downloader.R
\name{downloader}
\alias{downloader}
\title{downloader wrapper}
\usage{
downloader(
  input_url,
  output_path,
  download_method = "axel",
  background = FALSE,
  force_overwrite = FALSE,
  quiet = TRUE,
  show_progress = TRUE,
  continue = TRUE,
  nThread = 1,
  alternate = TRUE,
  check_certificates = TRUE,
  timeout = 30 * 60
)
}
\arguments{
\item{input_url}{input_url.}

\item{output_path}{output_path.}

\item{download_method}{\code{"axel"} (multi-threaded) or
\code{"download.file"} (single-threaded) .}

\item{background}{Run in background}

\item{force_overwrite}{Overwrite existing file.}

\item{quiet}{Run quietly.}

\item{show_progress}{show_progress.}

\item{continue}{continue.}

\item{nThread}{Number of threads to parallelize over.}

\item{alternate}{alternate,}

\item{check_certificates}{check_certificates}

\item{timeout}{How many seconds before giving up on download.
Passed to \code{download.file}. Default: \code{30*60} (30min).}
}
\value{
Local path to downloaded file.
}
\description{
R wrapper for \code{"axel"} (multi-threaded) and
\code{"download.file"} (single-threaded) download functions.
}
\seealso{
Other downloaders: 
\code{\link{axel}()}
}
\concept{downloaders}
\keyword{internal}
