## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.width = 5,
  dpi=150
)

## ----install from CRAN, eval=FALSE--------------------------------------------
#  install.packages("SqueakR")

## ----loading SqueakR----------------------------------------------------------
library(SqueakR)

## ----install from GitHub, eval = FALSE----------------------------------------
#  library(devtools)
#  install_github("osimon81/SqueakR")
#  library(SqueakR)

## ----create experiment--------------------------------------------------------
experiment <- create_experiment(experiment_name = "my_experiment")

## ----experiment structure-----------------------------------------------------
str(experiment)

## ----add timepoint data-------------------------------------------------------
my_new_data <- add_timepoint_data(data_path = "../inst/extdata/Example_Mouse_Data.xlsx", t1 = 5, t2 = 25)

## ----view head and tail of extracted data-------------------------------------
# The first few rows of the dataset
head(my_new_data)
# The last few rows of the dataset
tail(my_new_data)

## ----scored data--------------------------------------------------------------
my_scored_data <- score_timepoint_data(data_subset = my_new_data,
                                    group = "Control",
                                    experimenter = "my_name")
str(my_scored_data)

## ----adding data to experiment and update experiment--------------------------
experiment <- add_to_experiment(experiment = experiment, added_data = my_scored_data)

## ----removing data from experiment, eval=FALSE--------------------------------
#  experiment <- remove_experiment_data(experiment, data_id = 1)

## ----describe experiment------------------------------------------------------
describe_experiment(experiment = experiment)

## ----update experiment function-----------------------------------------------
experiment <- update_experiment(experiment = experiment)

## ----save experiment, eval=FALSE, echo=FALSE----------------------------------
#  experiment <- save_experiment(experiment = experiment,
#                                save_path = "[put path here]")

## ----semi-automatic pipeline, eval=FALSE, echo=FALSE--------------------------
#  my_semi_automaticaly_loaded_experiment <- semisqueakRpipeline()

## ----automatic pipeline, eval = FALSE, echo = FALSE---------------------------
#  my_automatically_loaded_experiment <- autosqueakRpipeline()

## ----view raw data from experiment--------------------------------------------
experiment$experimental_data[1]$call_data$raw

## ----standard ethnogram, warning = FALSE--------------------------------------
plotEthnogram(data_path = experiment$experimental_data[1]$call_data$raw)

## ----ethnogram with custom label----------------------------------------------
plotEthnogram(experiment$experimental_data[1]$call_data$raw,
              graph_title = "My Ethnogram",
              graph_subtitle = "This is the description I want instead!")

## ----tonality ethnogram, warning = FALSE--------------------------------------
plotEthnogramSplitByTonality(experiment$experimental_data[1]$call_data$raw,
              graph_title = "My Tonality-Split Ethnogram")

## ----frequency stacked, warning = FALSE---------------------------------------
plotDensityStackedByFrequency(experiment$experimental_data[1]$call_data$raw)

## ----frequency stacked - choose group, warning = FALSE------------------------
plotDensityStackedByFrequency(experiment$experimental_data[1]$call_data$raw,
                              chosen_group = 50)

## ----frequency split, warning = FALSE-----------------------------------------
plotDensitySplitByFrequency(experiment$experimental_data[1]$call_data$raw)

## ----custom stacked, warning = FALSE------------------------------------------
plotDensityStackedByCustom(experiment$experimental_data[1]$call_data$raw)

## ----custom split, warning = FALSE--------------------------------------------
plotDensitySplitByCustom(experiment$experimental_data[1]$call_data$raw)

## ----duration stacked, warning = FALSE----------------------------------------
plotDensityStackedByDuration(experiment$experimental_data[1]$call_data$raw)

## ----duration split, warning = FALSE------------------------------------------
plotDensitySplitByDuration(experiment$experimental_data[1]$call_data$raw)

## ----delta histogram, warning = FALSE-----------------------------------------
plotDeltaHistogram(experiment$experimental_data[1]$call_data$raw)

## ----principal box-plot, warning = FALSE--------------------------------------
plotPrincipalBoxplot(experiment$experimental_data[1]$call_data$raw)

## ----correlations, warning = FALSE--------------------------------------------
plotCorrelations(experiment$experimental_data[1]$call_data$raw)

## ----preview excel file (1)---------------------------------------------------
plotDensityStackedByFrequency("../inst/extdata/Example_Mouse_Data.xlsx")

## ----preview excel file (2), warning=FALSE------------------------------------
plotSummaryPDF("../inst/extdata/Example_Mouse_Data.xlsx", save_path = tempdir())

## ----adding new data----------------------------------------------------------
additional_data <- add_timepoint_data(data_path = "../inst/extdata/Example_Mouse_Data.xlsx", t1 = 30, t2 = 50)

additional_data <- score_timepoint_data(data_subset = additional_data, group = "Drug",
                                        experimenter = "new_experimenter")

experiment <- add_to_experiment(experiment = experiment, added_data = additional_data)


## ----inspecting experiment object for two groups------------------------------
describe_experiment(experiment)

## ----adding one last group----------------------------------------------------
third_dataset <- add_timepoint_data(data_path = "../inst/extdata/Example_Mouse_Data.xlsx", t1 = 70, t2 = 90)
third_dataset <- score_timepoint_data(data_subset = third_dataset, group = "Sham",
                                      experimenter = "experimenter_3")

experiment <- add_to_experiment(experiment = experiment, added_data = third_dataset)


## ----inspecting experiment for three groups-----------------------------------
describe_experiment(experiment)

## ----analyze delta frequency between groups-----------------------------------
analyze_factor(experiment = experiment, analysis_factor = "delta_frequency")

## ----anova for delta-frequency------------------------------------------------
squeakrANOVA(experiment = experiment, analysis_factor = "Delta_Freq")

## ----anova for call length----------------------------------------------------
squeakrANOVA(experiment = experiment, analysis_factor = "Call_Length")

## ----SqueakR dashboard, eval = FALSE------------------------------------------
#  squeakRDashboard()

