## CHANGES IN VERSION 1.3.5

### Bug fixes

* Flipping of Odds Ratio corrected (1/OR rather than -1*OR)

## CHANGES IN VERSION 1.3.4

### Bug fixes

* Issue downloading chain file resolved

## CHANGES IN VERSION 1.3.3

### New Features

* More mappings added to default mapping file.


## CHANGES IN VERSION 1.3.2

### Bug fixes

* Previously rsids with characters added (e.g. rs1234567w) would cause an error
when checking for the rsid on the reference genome. This has been fixed and 
the correct rsid will now be imputed from the reference genome for these cases.

## CHANGES IN VERSION 1.3.1

### New Features

* `import_sumstats`: Create individual folders for each GWAS dataset,
with a respective `logs` subfolder to avoid overwriting log files
when processing multiple GWAS.  
* `parse_logs`: **New function** to convert logs from one or more munged GWAS
into a `data.table`.  
* `list_sumstats`: **New function** to recursively search for local 
summary stats files previously munged with `MungeSumstats`.  
* Added new dataset `inst/extdata/MungeSumstats_log_msg.txt` 
to test logs files.  
* Added unit tests for `list_sumstats` and `parse_logs`. 
* Added new Docker vignette.  
* Updated GHA workflows using [r_workflows](https://github.com/neurogenomics/r_workflows).  
* Remove *docs/* folder as the website will now be pushed to 
the `gh-pages` branch automatically by new GHA workflow.  
* Made documentation in README more clear and concise.  
* Added checks for p-values >1 or <0 via args `convert_large_p` and 
`convert_neg_p`, respectively.
These are both handled by the new internal function `check_range_p_val`, 
which also reports the number of SNPs found meeting these criteria 
to the console/logs.  
* `check_small_p_val` records which SNPs were imputed in a  more robust way, 
by recording which SNPs met the criteria before making the changes (as opposed to inferred this info from which columns are 0 after making the changes). This 
function now only handles non-negative p-values, so that rows with negative
p-values can be recorded/reported separately in the `check_range_p_val` step.  
* `check_small_p_val` now reports the number of SNPs <= 5e-324 to console/logs. 
* Unit tests have been added for both `check_range_p_val` 
and `check_small_p_val`. 
* `parse_logs` can now extract information reported by `check_range_p_val` and 
`check_small_p_val`.  
* New internal function `logs_example` provides easy access to log file stored 
in *inst/extdata*, and includes documentation on how it was created.  
* Both `check_range_p_val` and `check_small_p_val` now use `#' @inheritParams format_sumstats` to improve consistency of documentation.  

### Bug fixes

* Reduced vignette sizes.
* Removed usage of `suppressWarnings` where possible.  
* Deleted old *.Rproj* file and hidden folder (contained large files). 
* Configured *.Rproj* so it doesn't store large data files. 
* Fix badger issues: https://github.com/GuangchuangYu/badger/issues/34 
* Prevent *test-index_tabix.R* from running due to errors (for now). 


## CHANGES IN VERSION 1.3.0

### New Features

* Version bump to align with Bioconductor release 3.14.

## CHANGES IN VERSION 1.1.27

### Bug fixes

* `validate_parameters` can now handle `ref_genome=NULL`  
* *.tsv.gz* no longer assigned suffix *.tsv*.   
* Made code width <80 characters.  
* Changed `to_GRanges`/`to_GRanges` functions to all-lowercase functions
(for consistency with other functions). 
* Set `nThread=1` in `data.table` test functions.

### New Features

* Added tests for `get_genome_builds`  
* Added early check for making sure the directory `save_path` is in was 
actually created (as opposed to finding out at the very end of the pipeline). 
* Tabix-indexing now available for tabular output data.
* `read_header` and `read_sumstats` now both work with .bgz files.  

## CHANGES IN VERSION 1.1.26

### New Features

* Extra mappings for FRQ column, see `data("sumstatsColHeaders")` for details  

## CHANGES IN VERSION 1.1.23

### New Features

* `format_sumstats(FRQ_filter)` added so SNPs can now be filtered by allele 
frequency 
* Mapping file now has mappings for allele frequency (AF) to FRQ
* VCF files with AF in INFO column e.g. 'AF=...' now converted to AF column
* `format_sumstats(frq_is_maf)` check added to infer if FRQ column values are
minor/effect allele frequencies or not. frq_is_maf allows users to rename the
FRQ column as MAJOR_ALLELE_FRQ if some values appear to be major allele 
frequencies

## CHANGES IN VERSION 1.1.19

### New Features

* `get_genome_builds()` can now be called to quickly get the genome build 
without running the whole reformatting.
* `format_sumstats(compute_n)` now has more methods to compute the effective 
sample size with "ldsc", "sum", "giant" or "metal". 
* `format_sumstats(convert_ref_genome)` now implemented which can perform 
liftover to GRCh38 from GRCh37 and vice-versa enabling better cohesion between
different study's summary statistics.

## CHANGES IN VERSION 1.1.11

### Bug fixes

* `check_no_rs_snp` can now handle extra information after an RS ID. So if you 
have `rs1234:A:G` that will be separated into two columns.
* `check_two_step_col` and `check_four_step_col`, the two checks for when 
multiple columns are in one, have been updated so if not all SNPs have multiple
columns or some have more than the expected number, this can now be handled.
* Extra mappings for the `FRQ` column have been added to the mapping file

## CHANGES IN VERSION 1.1.11

### New Features

* `check_multi_rs_snp` can now handle all punctuation with/without spaces. So if
a row contains `rs1234,rs5678` or `rs1234, rs5678` or any other punctuation 
character other than `,` these can be handled.
* `format_sumstats(path)` can now be passed a dataframe/datatable of the summary
statistics directly as well as a path to their saved location.
* Input summary statistics with `A0/A1` corresponding to ref/alt can now be 
handled by the mappign file as well as `A1/A2` corresponding to ref/alt.

## CHANGES IN VERSION 1.1.2

### New Features

*   `import_sumstats` reads GWAS sum stats directly from Open GWAS. Now 
parallelised and reports how long each dataset took to import/format in total. 
*   `find_sumstats` searches Open GWAS for datasets. 
*   `compute_z` computes Z-score from P. 
*   `compute_n` computes N for all SNPs from user defined smaple size.
*   `format_sumstats(ldsc_format=TRUE)` ensures sum stats can be fed directly 
into [LDSC](https://github.com/bulik/ldsc) without any additional munging. 
*   `read_sumstats`, `write_sumstas`, and `download_vcf` functions now exported.  
*   `format_sumstats(sort_coordinates=TRUE)` sorts results by their genomic 
coordinates. 
*   `format_sumstats(return_data=TRUE)` returns data directly to user. Can be 
returned in either `data.table` (default), `GRanges` or `VRanges` format using 
`format_sumstats(return_format="granges")`.  
*   `format_sumstats(N_dropNA=TRUE)` (default) drops rows where N is missing. 
*   `format_sumstats(snp_ids_are_rs_ids=TRUE)` (default) Should the SNP IDs 
inputted be inferred as RS IDs or some arbitrary ID.
*   `format_sumstats(write_vcf=TRUE)` writes a tabix-indexed VCF file instead of
tabular format. 
*   `format_sumstats(save_path=...)` lets users decide where their results are 
saved and what they're named. 
*   When the `save_path` indicates it's in `tempdir()`, message warns users that
these files will be deleted when R session ends.  
*   Summary of data is given at the beginning and the end of `format_sumstats` 
via `report_summary()`.  
*   Readability of `preview_sumstats()` messages improved.  
*   New checks standard error (SE) must >0 and BETA (and other effect columns) 
must not equal 0: `format_sumstats(pos_se=TRUE,effect_columns_nonzero=TRUE)`
*   Log directory containing all removed SNPs is now available and can be 
changed to a different directory by setting:
`format_sumstats(log_folder_ind=TRUE,log_folder=tempdir())`
*   All imputed data can now be identified with a column in the output using:
`format_sumstats(imputation_ind=TRUE)`
*   Users can now input their own mapping file to be used for the column header 
mapping in place of `data(sumstatsColHeaders)`. See 
`format_sumstats(mapping_file = mapping_file)`.


### Bug fixes 

*   CHR column now standardised (X and Y caps, no "chr" prefix).
*   Allele flipping done on a per-SNP basis (instead of whole-column). 
*   Allele flipping now includes FRQ column as well as effect columns.
*   The effect allele is now interpreted as the A2 allele consistent with [IEU GWAS VCF approach](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7805039/). A1 will always be the reference allele.
*   `read_vcf` upgraded to account for more VCF formats. 
*   `check_n_num` now accounts for situations where N is a character vector and converts to numeric.  


## CHANGES IN VERSION 1.1.1

### Bug fixes

*   Preprint publication citation added.


## CHANGES IN VERSION 1.0.0

### New Features

*   MungeSumstats released to Bioconductor.

