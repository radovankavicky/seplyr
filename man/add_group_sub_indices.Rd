% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/in_group_indices.R
\name{add_group_sub_indices}
\alias{add_group_sub_indices}
\title{Group a data frame and add in-group indices as a column.}
\usage{
add_group_sub_indices(.data, ..., groupingVars, arrangeTerms = NULL,
  orderColumn)
}
\arguments{
\item{.data}{data.frame}

\item{...}{force later arguments to bind by name.}

\item{groupingVars}{character vector of column names to group by.}

\item{arrangeTerms}{character vector of column expressions to arrange by.}

\item{orderColumn}{character name of column to add in-group order marks to.}
}
\value{
.data with in group order indices added (no ties).
}
\description{
Group a data frame and add in-group indices as a column.
}
\examples{


groupingVars = c("cyl", "gear")
datasets::mtcars \%>\%
  # dplyr doesn't currently export tibble::rownames_to_column()
  { mutate(., CarName = rownames(.) ) } \%>\%
  select_se(c('CarName', 'cyl', 'gear', 'hp', 'wt')) \%>\%
  add_group_indices(groupingVars = groupingVars,
                    indexColumn = 'groupID') \%>\%
  add_group_sub_indices(groupingVars = groupingVars,
                       arrangeTerms = c('desc(hp)', 'wt'),
                       orderColumn = 'orderInGroup') \%>\%
  arrange_se(c('groupID', 'orderInGroup'))


}
