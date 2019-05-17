## ----eval=FALSE----------------------------------------------------------
#  library("bmass");
#  HDL <- read.table("jointGwasMc_HDL.formatted.QCed.txt.gz", header=T);
#  LDL <- read.table("jointGwasMc_LDL.formatted.QCed.HDLMatch.txt.gz", header=T);
#  TG <- read.table("jointGwasMc_TG.formatted.QCed.HDLMatch.txt.gz", header=T);
#  TC <- read.table("jointGwasMc_TC.formatted.QCed.HDLMatch.txt.gz", header=T);
#  load("bmassDirectory/data/GlobalLipids2013.GWASsnps.rda");
#  Phenotypes <- c("HDL", "LDL", "TG", "TC");
#  bmassResults <- bmass(Phenotypes, GlobalLipids2013.GWASsnps);

## ----eval=FALSE----------------------------------------------------------
#  > summary(bmassResults)
#                        Length Class  Mode
#  MarginalSNPs             3   -none- list
#  PreviousSNPs             4   -none- list
#  NewSNPs                  3   -none- list
#  LogFile                 20   -none- character
#  ZScoresCorMatrix        16   -none- numeric
#  Models                 324   -none- numeric
#  ModelPriors           1134   -none- numeric
#  GWASlogBFMinThreshold    1   -none- numeric

## ----eval=FALSE----------------------------------------------------------
#  > summary(bmassResults$NewSNPs)
#             Length Class      Mode
#  SNPs         30   data.frame list
#  logBFs     5427   -none-     numeric
#  Posteriors 5427   -none-     numeric

## ----eval=FALSE----------------------------------------------------------
#  > head(bmassResults$NewSNPs$SNPs, n=3)
#                ChrBP Chr        BP    Marker    MAF A1 HDL_A2 HDL_Direction
#  1704   10_101902054  10 101902054 rs2862954 0.4631  C      T             +
#  72106    10_5839619  10   5839619 rs2275774 0.1781  G      A             +
#  118903 11_109521729  11 109521729  rs661171 0.2876  T      G             +
#         HDL_pValue  HDL_N HDL_ZScore LDL_Direction LDL_pValue    LDL_N
#  1704    1.287e-06 186893   4.841751             +  5.875e-01 172821.0
#  72106   7.601e-07 179144   4.945343             -  7.773e-05 165198.0
#  118903  1.705e-06 186946   4.785573             +  1.653e-02 172877.9
#         LDL_ZScore TG_Direction TG_pValue     TG_N TG_ZScore TC_Direction
#  1704    0.5424624            +  0.013930 177587.1  2.459063            +
#  72106  -3.9512933            -  0.001035 169853.0 -3.280836            -
#  118903  2.3969983            -  0.155800 177645.0 -1.419340            +
#         TC_pValue   TC_N TC_ZScore GWASannot   mvstat mvstat_log10pVal  unistat
#  1704   2.526e-04 187083  3.659609         0 48.70946         9.173067 23.44255
#  72106  1.911e-02 179333 -2.343378         0 38.26288         7.004804 24.45642
#  118903 1.785e-05 187131  4.290215         0 37.84098         6.917765 22.90171
#         unistat_log10pVal     Nmin logBFWeightedAvg
#  1704            5.890421 172821.0         7.068306
#  72106           6.119129 165198.0         5.447201
#  118903          5.768276 172877.9         5.438490

## ----eval=FALSE----------------------------------------------------------
#  > dim(bmassResults$NewSNPs$logBFs)
#  [1] 81 67
#  > bmassResults$NewSNPs$logBFs[1:5,1:10]
#       HDL LDL TG TC 10_101902054   10_5839619 11_109521729   11_13313759
#  [1,]   0   0  0  0     0.000000    0.0000000    0.0000000    0.00000000
#  [2,]   1   0  0  0  -233.831047 -235.0781367 -234.6670299 -234.15472067
#  [3,]   2   0  0  0     0.000000    0.0000000    0.0000000    0.00000000
#  [4,]   0   1  0  0     0.165855    0.3172489   -0.1100418    0.06393596
#  [5,]   1   1  0  0   -64.774919  -66.2959645  -69.2388829  -69.93309528
#         11_45696596   11_47251202
#  [1,]    0.00000000    0.00000000
#  [2,] -231.68478695 -219.10321932
#  [3,]    0.00000000    0.00000000
#  [4,]   -0.04838241    0.04997886
#  [5,]  -65.59917325  -45.04269241

## ----eval=FALSE----------------------------------------------------------
#  > summary(bmassResults$PreviousSNPs)
#               Length Class      Mode
#  logBFs       12069  -none-     numeric
#  SNPs            30  data.frame list
#  DontPassSNPs    30  data.frame list
#  Posteriors   12069  -none-     numeric

## ----eval=FALSE----------------------------------------------------------
#  > summary(bmassResults$MarginalSNPs)
#             Length Class      Mode
#  SNPs          30  data.frame list
#  logBFs     20493  -none-     numeric
#  Posteriors 20493  -none-     numeric

## ----eval=FALSE----------------------------------------------------------
#  > bmassResults$ZScoresCorMatrix
#             HDL_ZScore LDL_ZScore  TG_ZScore TC_ZScore
#  HDL_ZScore  1.0000000 -0.0872789 -0.3655508 0.1523894
#  LDL_ZScore -0.0872789  1.0000000  0.1607208 0.8223175
#  TG_ZScore  -0.3655508  0.1607208  1.0000000 0.2892982
#  TC_ZScore   0.1523894  0.8223175  0.2892982 1.0000000

## ----eval=FALSE----------------------------------------------------------
#  > dim(bmassResults$Models)
#  [1] 81  4
#  > head(bmassResults$Models)
#       HDL LDL TG TC
#  [1,]   0   0  0  0
#  [2,]   1   0  0  0
#  [3,]   2   0  0  0
#  [4,]   0   1  0  0
#  [5,]   1   1  0  0
#  [6,]   2   1  0  0

## ----eval=FALSE----------------------------------------------------------
#  > length(bmassResults$ModelPriors)
#  [1] 1134
#  > bmassResults[c("ModelPriorMatrix", "LogFile")] <- GetModelPriorMatrix(Phenotypes, bmassResults$Models, bmassResults$ModelPriors, bmassResults$LogFile)
#  > head(bmassResults$ModelPriorMatrix)
#    HDL LDL TG TC      Prior Cumm_Prior OrigOrder
#  1   1   2  1  1 0.32744537  0.3274454        44
#  2   1   2  2  1 0.13788501  0.4653304        53
#  3   1   1  1  2 0.11727440  0.5826048        68
#  4   1   1  1  1 0.07801825  0.6606230        41
#  5   1   2  1  2 0.06210658  0.7227296        71
#  6   2   1  2  2 0.05698876  0.7797184        78

## ----eval=FALSE----------------------------------------------------------
#  > bmassResults$GWASlogBFMinThreshold
#  [1] 4.289906

