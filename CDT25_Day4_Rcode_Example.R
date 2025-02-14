#####################################################################################################
# CDT MR practice: examine the causal effect of LDL-C on coronary heart disease                                                                                                   #
#####################################################################################################


#  Load packages 

library(dplyr) 
library(TwoSampleMR) 


################################################################################
#  1: Select and load exposure data (genetic instruments)
################################################################################

### Choose 1 of 3 possible exposure data sets based on information provided

# Barton et al

exp_dat <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_barton.csv?download=1"))

# Willer et al

exp_dat <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_willer.csv?download=1"))

# Wojcik et al

exp_dat <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_wojcik.csv?download=1"))


################################################################################
#  2: Clump the data
################################################################################

# Update the file paths as needed:

# 1) bfile: Path to the EUR reference files (PED, BIM, FAM), e.g.:
#    "/Users/your_username/PLINK/EUR/EUR"
# 2) plink_bin: Path to the PLINK binary:
#    - macOS: "/usr/local/bin/plink"
#    - Windows: "C:/plink/plink.exe"

exp_dat$rsid <- exp_dat$SNP
exp_dat_clumped <- ieugwasr::ld_clump(
  exp_dat,   # The dataset containing the SNPs and their association statistics (usually with p-values).
  pop = "EUR",     # The reference population to use for LD analysis, in this case, European (EUR).
  clump_kb = 10000,  # The window size in kilobases (kb)
  clump_r2 = 0.001,  # The r?? threshold for LD clumping.
  bfile = "K:/isise/Adam/PLINK/EUR/EUR",  # The location of the PLINK files (PED, BIM, and FAM files) used for the LD analysis.
  plink_bin = "K:/isise/Adam/PLINK/plink.exe"  # The path to the PLINK binary executable.
  
)

################################################################################
#  3: Load outcome data
################################################################################

outcome_dat <- read.csv(url("https://zenodo.org/record/14871196/files/chd_aragam_matched_ldl.csv?download=1"))


################################################################################
#  4: Harmonise the exposure and outcome data
################################################################################

dat <- TwoSampleMR::harmonise_data(exp_dat_clumped, 
                      outcome_dat, 
                      action = 2) # infer strand for ambiguous SNPs


################################################################################
#  5: Perform Mendelian randomization 
################################################################################

# Check the available MR methods by running
TwoSampleMR::mr_method_list()
# Estimate the effect of LDL on CHD using different MR Method
mr_results <- TwoSampleMR::mr(dat,method_list = c("mr_ivw","mr_weighted_median","mr_weighted_mode","mr_egger_regression")) 
print(mr_results)


################################################################################
#  6: Assess Heterogeneity across SNPs 
################################################################################

### 6.1.- Visual inspection: Scatter plot (SNPs effect on LDL vs SNP effect on CHD) 
    p1 <- TwoSampleMR::mr_scatter_plot(mr_results,dat)
    p1[[1]] 
    
### 6.2.- Formal heterogeneity test (Cochran's Q test) 
    Het_test <- TwoSampleMR::mr_heterogeneity(dat)
    Het_test
    
### 6.3.- Visual inspection: effect of individual SNPs
    res_single <- TwoSampleMR::mr_singlesnp(dat)
    p2 <- TwoSampleMR::mr_forest_plot(res_single)
    p2[[1]]
      
################################################################################
# 7: Assess Horizontal Pleiotropy     
################################################################################
      
### 7.1.- Visual inspection: Funnel plot 
    p3 <- TwoSampleMR::mr_funnel_plot(res_single)
    p3[[1]]
### 7.2.- Formal horizontal pleiotropy test
    HorizP_test <- TwoSampleMR::mr_pleiotropy_test(dat)
    HorizP_test 
      

################################################################################
# 8: Leave-one-out test              
################################################################################
    
    
leavoneout_test_res<- TwoSampleMR::mr_leaveoneout(dat)
TwoSampleMR::mr_leaveoneout_plot(leavoneout_test_res)


