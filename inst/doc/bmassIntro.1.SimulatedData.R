## ------------------------------------------------------------------------
library("bmass");
data(bmass_SimulatedData1, bmass_SimulatedData2, bmass_SimulatedSigSNPs)
Phenotypes <- c("bmass_SimulatedData1", "bmass_SimulatedData2")

## ------------------------------------------------------------------------
head(bmass_SimulatedData1)

## ------------------------------------------------------------------------
bmassResults <- bmass(Phenotypes, bmass_SimulatedSigSNPs);

## ------------------------------------------------------------------------
bmass_SimulatedSigSNPs

## ------------------------------------------------------------------------
summary(bmassResults)

## ------------------------------------------------------------------------
summary(bmassResults$NewSNPs)
head(bmassResults$NewSNPs$SNPs)

## ------------------------------------------------------------------------
bmassResults$GWASlogBFMinThreshold

