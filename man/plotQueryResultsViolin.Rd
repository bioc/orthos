% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotQueryResults.R
\name{plotQueryResultsViolin}
\alias{plotQueryResultsViolin}
\title{Visualize query results as violin plots}
\usage{
plotQueryResultsViolin(queryResults, doPlot = TRUE)
}
\arguments{
\item{queryResults}{A list containing the results of a query performed with
\code{queryWithContrasts}}

\item{doPlot}{Logical scalar specifying if a plot should be generated.}
}
\value{
A list of ggplot violin plots (one for each dataset) for the scores
of queries using different contrast components against the respective
contrast DBs.
}
\description{
Visualize query results as violin plots
}
\examples{
MKL1_human <- readRDS(system.file("extdata", "GSE215150_MKL1_Human.rds",
package = "orthos"))

# Decompose contrasts:
dec_MKL1_human <- decomposeVar(M = MKL1_human, treatm = c(2, 3), cntr = c(1, 1), 
                              organism = "Human", verbose = FALSE)

# Perform query against contrast DB with the decomposed fractions.
# !!!Note!!! mode="DEMO" for demonstration purposes only.                             
params <- BiocParallel::MulticoreParam(workers = 2)                              
query.res.human <- queryWithContrasts(dec_MKL1_human, organism = "Human", 
                                     BPPARAM = params, verbose = FALSE, 
                                     mode = "DEMO")
                                     
# plot results for individual contrasts using violin plots::
ViolinPlots <- plotQueryResultsViolin(query.res.human, doPlot = FALSE)
ViolinPlots[["caMKL1"]]

}
\author{
Panagiotis Papasaikas, Michael Stadler
}
