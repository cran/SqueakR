% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/analysis_functions.R
\name{analyze_factor}
\alias{analyze_factor}
\title{Analyze Factor}
\usage{
analyze_factor(experiment, analysis_factor)
}
\arguments{
\item{experiment}{The experiment object}

\item{analysis_factor}{A string representing the factor to analyze between groups}
}
\value{
A bar graph comparing the analysis_factor between groups
}
\description{
Compares data across experimental groups, plotting the data as a
bar graph with error bars.
}
\examples{
\dontrun{analyze_factor(experiment = experiment, analysis_factor = "tonality")}

}
