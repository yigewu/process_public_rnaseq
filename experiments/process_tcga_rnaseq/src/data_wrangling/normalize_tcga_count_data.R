#' ---
#' title: "A report generated from a pure R script"
#' output:
#'   html_document:
#'     keep_tex: true
#' ---
#'
#' ---------------------------
#'
#' Script name: 
#'
#' Purpose of script:
#'
#' Author: Dr. Yige Wu
#'
#' Date Created: 2024-03-08
#'
#' Copyright (c) Yige Wu, 2024
#' Email: yigewu2012@gmail.com
#'
#' ---------------------------

# 
#' # Set up
#' ## Use current script directory as working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()[["path"]]))

#' ## load up the packages:
require(tidyverse)
require(data.table)

#' ## Set up inputs and parameters

#' # Wrap up
sessionInfo()
