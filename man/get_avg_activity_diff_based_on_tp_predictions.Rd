% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/diff.R
\name{get_avg_activity_diff_based_on_tp_predictions}
\alias{get_avg_activity_diff_based_on_tp_predictions}
\title{Get the average activity difference based on the number of true positives}
\usage{
get_avg_activity_diff_based_on_tp_predictions(
  models.synergies.tp,
  models.stable.state,
  num.low,
  num.high,
  penalty = 0
)
}
\arguments{
\item{models.synergies.tp}{an integer vector of TP values. The \emph{names}
attribute holds the models' names and must be a subset of the row names
of the \code{models.stable.state} parameter. Consider using the function
\code{\link{calculate_models_synergies_tp}}.}

\item{models.stable.state}{a \code{data.frame} (nxm) with n models and m nodes. The row
names specify the models' names whereas the column names specify the network nodes
(gene, proteins, etc.). Possible values for each \emph{model-node element}
can be between \emph{0} (inactive node) and \emph{1} (active node) inclusive.}

\item{num.low}{integer. The number of true positives representing the 'bad'
model class.}

\item{num.high}{integer. The number of true positives representing the 'good'
model class. This number has to be strictly higher than \code{num.low}.}

\item{penalty}{value between 0 and 1 (inclusive). A value of 0 means no
penalty and a value of 1 is the strickest possible penalty. Default value is 0.
This penalty is used as part of a weighted term to the difference in a value of
interest (e.g. activity or link operator difference) between two group of
models, to account for the difference in the number of models from each
respective model group.}
}
\value{
a numeric vector with values in the [-1,1] interval (minimum and maximum
possible average difference) and with the \emph{names} attribute representing the name
of the nodes.
}
\description{
This function splits the models to 'good' and 'bad' based on the number of true
positive predictions: \emph{num.high} TPs (good) vs \emph{num.low} TPs (bad).
Then, for each network node, it finds the node's average activity in each of
the two classes (a value in the [0,1] interval) and then subtracts the
'bad' average activity value from the good' one, taking into account the
given \code{penalty} factor and the number of models in each respective
model group.
}
\section{Details}{

So, if a node has a value close to -1 it means that on average,
this node is more \strong{inhibited} in the 'good' models compared to the
'bad' ones while a value closer to 1 means that the node is more \strong{activated}
in the 'good' models. A value closer to 0 indicates that the activity of that
node is \strong{not so much different} between the 'good' and 'bad' models and
so it won't not be a node of interest when searching for indicators of better
performance (higher number of true positives) in the good models.
}

\seealso{
\code{\link{get_vector_diff}}

Other average data difference functions: 
\code{\link{get_avg_activity_diff_based_on_mcc_clustering}()},
\code{\link{get_avg_activity_diff_based_on_specific_synergy_prediction}()},
\code{\link{get_avg_activity_diff_based_on_synergy_set_cmp}()},
\code{\link{get_avg_activity_diff_mat_based_on_mcc_clustering}()},
\code{\link{get_avg_activity_diff_mat_based_on_specific_synergy_prediction}()},
\code{\link{get_avg_activity_diff_mat_based_on_tp_predictions}()},
\code{\link{get_avg_link_operator_diff_based_on_synergy_set_cmp}()},
\code{\link{get_avg_link_operator_diff_mat_based_on_mcc_clustering}()},
\code{\link{get_avg_link_operator_diff_mat_based_on_specific_synergy_prediction}()},
\code{\link{get_avg_link_operator_diff_mat_based_on_tp_predictions}()}
}
\concept{average data difference functions}
