% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pdf_functions.R
\name{plotSummaryPDF}
\alias{plotSummaryPDF}
\title{Export PDF}
\usage{
plotSummaryPDF(data_path, save_path = tempdir(), experimenter = "Anon")
}
\arguments{
\item{data_path}{The full path to the Excel file exported from DeepSqueak}

\item{save_path}{The full path to the directory where the PDF will be saved (default is the current working directory)}

\item{experimenter}{The name of the experimenter for naming the save file (default is "Anon")}
}
\value{
A PDF containing a series of relevant ethnograms and density graphs assessing the recording.
}
\description{
Plots a density graph, separating each frequency group into a separate plot in the figure.
}
\examples{
\dontrun{plotSummaryPDF(
  data_path = "inst/extdata/Example_Mouse_Data.xlsx",
  save_path = tempdir(), experimenter = "experimenter_name"
)}

}
