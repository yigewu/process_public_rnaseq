#' ---
#' title: "A report generated from a pure R script"
#' output:
#'   html_document:
#'     keep_tex: true
#' ---
#'
#' ---------------------------
#' Purpose of script:
#'
#' Author: Dr. Yige Wu
#'
#' Date Created: 2024-03-15
#'
#' Copyright (c) Yige Wu, 2024
#' Email: yigewu.app@gmail.com
#'
#' ---------------------------

#
#' # Set up
#' ## load up the packages:
require(tidyverse)
require(data.table)
require(here)
library(TCGAbiolinks)

#' ## Set up inputs and parameters
dir_out <- here("experiments/process_public_rnaseq/experiments/process_tcga_rnaseq/results/other/")
dir_out

#' # Get project ids (to build a query)
gdcprojects <- getGDCprojects()
gdcprojects
projectids_gdc <- getGDCprojects()$id
# projectids_query <- projectids_gdc[grepl(pattern = "TCGA|DLBC|CPTAC", x = projectids_gdc)]
projectids_query <- projectids_gdc[!(projectids_gdc %in% c("BEATAML1.0-CRENOLANIB", "FM-AD", "VAREPOP-APOLLO",
                                                           "TRIO-CRU"))] # These projects do not have RNA-seq data
projectids_query

#' # Query
my_query <- GDCquery(project = projectids_query, data.category = "Transcriptome Profiling", experimental.strategy = "RNA-Seq", access = "open")
output_query <- getResults(my_query)
output_query %>%
  select(project, analysis_workflow_type) %>%
  distinct()

#' # Write output
saveRDS(my_query, file = paste0(dir_out, "gdc_rnaseq_start_counts_query.rds"), compress = T)
write.table(x = output_query, file = paste0(dir_out, "gdc_rnaseq_starcounts_query_meta_data.tsv"), quote = F, sep = "\t", row.names = )

#' # Wrap up
sessionInfo()
