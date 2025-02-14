
<!-- README.md is generated from README.Rmd. Please edit that file -->

## 📝 CDT25 Genetics Module: Summary statistics

Previously, summary statistics for many phenotypes could be extracted
directly from the [IEU OpenGWAS repository](https://gwas.mrcieu.ac.uk/)
using the `extract_instruments` function in the `TwoSampleMR` package.
However, this function is no longer functional. Below, you will find
direct links to the summary statistics for exposures and outcomes
relevant to this tutorial and your projects.

### ☀️ Exposures

<span style="font-size:14px;"> **Note:** Exposure datasets include only
genome-wide significant variants (*P* \< 5e-8). </span>

##### Smoking initiation (GSCAN European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/smoking_initiation_liu_(GSCAN)_eur.csv?download=1"))`

##### Lifetime smoking index (European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/lifetime_smoking_munafo_eur.csv?download=1"))`

##### LDL-C (Various)

For more information on these data sets, see [Table 1](#table1)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_willer.csv?download=1"))`

`data <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_barton.csv?download=1"))`

`data <- read.csv(url("https://zenodo.org/record/14871196/files/ldl_wojcik.csv?download=1"))`

##### Tryglicerides (Global Lipids Genetics Consortium; Multiancestry)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/trigs_willer_(GLGC)_multi.csv?download=1"))`

##### Tryglicerides (UK Biobank)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/trigs_richardson_(UKB)_eur.csv?download=1"))`

##### Body mass index (GIANT; European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/bmi_yengo_(GIANT)_eur.csv?download=1"))`

##### Body mass index (UK Biobank)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/bmi_neale_(UKB)_eur.csv?download=1"))`

##### Heart rate (Hrgene; European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/heart_rate_denHoad_(HRgene)_eur.csv?download=1"))`

##### Heart rate (UK Biobank)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/heart_rate_Elsworth_(UKB)_eur.csv?download=1"))`

### ⚕️ Outcomes

##### Coronary Heart Disease (CARDIoGRAMplusC4D; European)\*

`data <- read.csv(url("https://zenodo.org/record/14871196/files/chd_aragam_matched_ldl.csv?download=1"))`

<span style="font-size:14px;"> \*These variants are matched to the LDL-C
lists for the purpose of the practical </span> \##### All stroke
(GIGASTROKE; European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/AS_mishra_(GIGA)_eur.csv?download=1"))`

##### All stroke (GIGASTROKE; Multiancestry)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/AS_mishra_(GIGA)_multi.csv?download=1"))`

##### All ischaemic stroke (GIGASTROKE; European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/AIS_mishra_(GIGA)_eur.csv?download=1"))`

##### All ischaemic stroke (GIGASTROKE; Multiancestry)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/AIS_mishra_(GIGA)_multi.csv?download=1"))`

##### Cardioembolic stroke (GIGASTROKE; European)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/CES_mishra_(GIGA)_eur.csv?download=1"))`

##### Cardioembolic stroke (GIGASTROKE; Multiancestry)

`data <- read.csv(url("https://zenodo.org/record/14871196/files/CES_mishra_(GIGA)_multi.csv?download=1"))`

### ⚠️ Handling Timeout Errors for `read.csv`

If you encounter **timeout errors** when reading in large files, you can
try increasing the timeout limit:

``` r
install.packages("RCurl")
library(RCurl)
curlSetOpt(timeout = 600)
```

If that does not work, you may need to **download the file directly**
and then load it into R:

``` r
download.file("https://zenodo.org/record/14871196/files/smoking_initiation_liu_(GSCAN)_eur.csv",  
              "smoking_init.csv")
data <- read.csv("smoking_init.csv")
```

### 📊 Information on Practical data sets

<a id="table1"></a> **Table 1: Information for exposure data and outcome
data sets used in practical**

<table class="table table-striped table-hover table-condensed" style="font-size: 11px; width: auto !important; margin-left: auto; margin-right: auto;border-bottom: 0;">
<thead>
<tr>
<th style="text-align:left;">
Trait
</th>
<th style="text-align:left;">
Author
</th>
<th style="text-align:right;">
PMID
</th>
<th style="text-align:right;">
Year
</th>
<th style="text-align:left;">
Pop
</th>
<th style="text-align:left;">
Variants
</th>
<th style="text-align:left;">
Sample.size
</th>
</tr>
</thead>
<tbody>
<tr>
<td style="text-align:left;">
LDL-C
</td>
<td style="text-align:left;">
Barton
</td>
<td style="text-align:right;">
34226706
</td>
<td style="text-align:right;">
2021
</td>
<td style="text-align:left;">
European\*
</td>
<td style="text-align:left;">
4M
</td>
<td style="text-align:left;">
437,068
</td>
</tr>
<tr>
<td style="text-align:left;">
LDL-C
</td>
<td style="text-align:left;">
Willer
</td>
<td style="text-align:right;">
24097068
</td>
<td style="text-align:right;">
2013
</td>
<td style="text-align:left;">
Mixed
</td>
<td style="text-align:left;">
2M
</td>
<td style="text-align:left;">
173,082
</td>
</tr>
<tr>
<td style="text-align:left;">
LDL-C
</td>
<td style="text-align:left;">
Wojcik
</td>
<td style="text-align:right;">
31217584
</td>
<td style="text-align:right;">
2019
</td>
<td style="text-align:left;">
Hispanic/Latin American
</td>
<td style="text-align:left;">
3M
</td>
<td style="text-align:left;">
17,373
</td>
</tr>
<tr>
<td style="text-align:left;">
CHD
</td>
<td style="text-align:left;">
Aragam
</td>
<td style="text-align:right;">
36474045
</td>
<td style="text-align:right;">
2022
</td>
<td style="text-align:left;">
European
</td>
<td style="text-align:left;">
20M
</td>
<td style="text-align:left;">
1.3M (181K cases†)
</td>
</tr>
</tbody>
<tfoot>
<tr>
<td style="padding: 0; " colspan="100%">
<sup>\*</sup> UK Biobank
</td>
</tr>
<tr>
<td style="padding: 0; " colspan="100%">
<sup>†</sup> 10% from UK Biobank
</td>
</tr>
</tfoot>
</table>

### 🙋 Questions?

Please email [Adam Von Ende](mailto:adam.vonende@ndph.ox.ac.uk) or [Elsa
Valdez-Márquez](mailto:elsa.valdez-marquez@ndph.ox.ac.uk).
