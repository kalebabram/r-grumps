#' rgrumps cluster function
#'
#' @description This function clusters a distance matrix and returns a hierarchical clustering object
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @return grumpsObj
#' @export
#'
#' @examples
#' clusterFunc(grumpsObj)
clusterFunc <- function(grumpsObj){
  dis_mash <- as.dist(1-cor(t(grumpsObj$dataframe)))
  grumpsObj$hClust <- hclust(dis_mash, method = grumpsObj$clusteringmethod)
  return(grumpsObj)
}
