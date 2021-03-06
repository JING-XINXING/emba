% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/biomarkers.R
\name{get_biomarkers}
\alias{get_biomarkers}
\title{Get total biomarkers from average data differences matrix}
\usage{
get_biomarkers(diff.mat, threshold)
}
\arguments{
\item{diff.mat}{a matrix whose rows are vectors of average node data
differences between two groups of models based on some kind of classification
(e.g. number of TP predictions) and whose names are set in the \code{rownames}
attribute of the matrix (usually denoting the different classification
groups, e.g. (1,2) means the models that predicted 1 TP synergy vs the models
that predicted 2 TP synergies, if the classification is done by number of TP
predictions). The columns represent the network's node names.}

\item{threshold}{numeric. A number in the [0,1] interval, above which (or
below its negative value) a biomarker will be registered in the returned result.
Values closer to 1 translate to a more strict threshold and thus less
biomarkers are found.}
}
\value{
a list with two elements:
 \itemize{
   \item \code{biomarkers.pos}: a character vector that includes the node
   names of the \emph{positive} biomarkers
   \item \code{biomarkers.neg}: a character vector that includes the node
   names of the \emph{negative} biomarkers
}
}
\description{
Use this function to find all biomarkers across multiple
performance classification group matchings based on a given threshold between
0 and 1.
}
\section{Details}{

This function uses the \code{\link{get_biomarkers_per_type}} function
to get the biomarkers (nodes) of both types (positive and negative) from the
average data differences matrix. The logic behind the biomarker selection is
that if there is at least one value in a column of the \code{diff.mat} matrix
that surpasses the threshold given, then the corresponding node (name of the
column) is returned as a biomarker.
This means that for a single node, if at least one value that represents an average data
difference (for example, the average activity state difference) between any
of the given classification group comparisons is above the given threshold
(or below the negative symmetric threshold), then a \emph{positive}
(\emph{negative}) biomarker is reported.

In the case of a node which is found to surpass the
significance threshold level given \emph{both negatively and positively},
we will keep it as a biomarker
in the category which corresponds to the \strong{comparison of the highest
classification groups}. For example, if the data comes from a model performance
classification based on the MCC score and in the comparison of the MCC classes
(1,3) the node of interest had an average difference of \emph{-0.89} (a negative
biomarker) while for the comparison of the (3,4) MCC classes it had a value
of \emph{0.91} (a positive biomarker), then we will keep that node \emph{only as a
positive biomarker}. The logic behind this is that
the 'higher' performance-wise are the classification groups that we compare,
the more sure we are that the average data difference corresponds to a
\emph{better indicator} for the type of the biomarker found.
}

\seealso{
Other biomarker functions: 
\code{\link{get_biomarkers_per_type}()}
}
\concept{biomarker functions}
