#' rgrumps tree cutting function
#'
#' @description This function cuts the grumps tree and returns a vector of group membership
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#' @returns grumpsObj
#' @export
#'
#' @examples
#' mclFunc(grumpsObj)
mclFunc <- function(grumpsObj){
  grumpsObj$mcl <- cutree(grumpsObj$hClust, h=max(grumpsObj$hClust$height*grumpsObj$cutoff))
  return(grumpsObj)
}
