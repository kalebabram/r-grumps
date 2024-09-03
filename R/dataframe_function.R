#' rgrumps dataframe function
#'
#' @description This function reads a .csv file output by GRUMPS and saves it as a matrix
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @export
#' @returns grumpsObj
#' @examples
#' dataframeFunc(grumpsObj)
dataframeFunc <- function(grumpsObj){
  grumpsObj$dataframe <- as.matrix(read.csv(file = grumps$file, sep = ',', header = T, row.names = 1))
  return(grumpsObj)
}
