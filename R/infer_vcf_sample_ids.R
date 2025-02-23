#' Infer VCF sample ID(s)
#'
#' @inheritParams format_sumstats
#' @return sample_id
#' @keywords internal
infer_vcf_sample_ids <- function(sample_id = NULL,
                                 sumstats_file) {
    # sample_id isn't essential if sumstats_file has already been parsed with 
    # vcf2df
    if(is_vcf_parsed(sumstats_file, verbose=FALSE)) return(sample_id)
    # sometimes name for sample taken from VCF can be wrong 
    # and not match the col. If this is the case also infer from the column. 
    if (is.null(sample_id) || !(sample_id %in% names(sumstats_file))) {
        idcol_index <- grep("FORMAT", colnames(sumstats_file),
                            ignore.case = TRUE)
        if (any(length(colnames(sumstats_file)) >= idcol_index)) {
            sample_id <-
                colnames(sumstats_file)[seq(
                    idcol_index[1] + 1,
                    length(colnames(sumstats_file))
                )]
            message(
                "sample ID(s) inferred from data colnames: ",
                paste(sample_id, collapse = ", ")
            )
        } else {
            stop("Sample ID(s) could not be extracted from VCF",
                 "header or inferred from data colnames.")
        }
    }
    return(sample_id)
}
