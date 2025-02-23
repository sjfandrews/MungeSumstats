test_that("Filter SNPs SE<=0", {
    ## Call uses reference genome as default with more than 2GB of memory,
    ## which is more than what 32-bit Windows can handle so remove tests
    is_32bit_windows <-
        .Platform$OS.type == "windows" && .Platform$r_arch == "i386"
    if (!is_32bit_windows) {
        file <- tempfile()
        # write the Educational Attainment GWAS to a temp file for testing
        eduAttainOkbay <- readLines(system.file("extdata", "eduAttainOkbay.txt",
            package = "MungeSumstats"
        ))
        writeLines(eduAttainOkbay, con = file)
        # read it in and make N
        sumstats_dt <- data.table::fread(file, nThread = 1)
        # Change SE to minus for some SNPs
        set.seed(101)
        num_snps <- 5
        sumstats_dt[seq_len(num_snps), SE := runif(num_snps) * -1]
        # get SNPs names
        rmv_snps <- sumstats_dt[SE <= 0, ]$MarkerName
        data.table::fwrite(x = sumstats_dt, file = file, sep = "\t")
        # Run MungeSumstats code
        reformatted <- MungeSumstats::format_sumstats(file,
            ref_genome = "GRCh37",
            pos_se = TRUE,
            on_ref_genome = FALSE,
            strand_ambig_filter = FALSE,
            bi_allelic_filter = FALSE,
            allele_flip_check = FALSE
        )
        res_dt <- data.table::fread(reformatted, nThread = 1)
        testthat::expect_equal(all(!rmv_snps %in% res_dt$SNP), TRUE)
    }    
    else{
        expect_equal(is_32bit_windows, TRUE)
    }
})
