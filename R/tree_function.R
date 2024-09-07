#' rgrumps tree function
#'
#' @description This function outputs the dendrogram as a .nwk file
#'
#' @param grumpsObj grumpsObj from grumpsFunction
#'
#' @keywords grumps
#'
#' @export
#'
#' @examples
#' treeFunc(grumpsObj)
treeFunc <- function(grumpsObj){
  tr <- as.phylo(grumpsObj$hClust)
  out_prefix <- paste('_',grumpsObj$cutoff,'_',grumpsObj$clusteringmethod,'_', sep = '')
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r', out_prefix,'_',max(grumpsObj$hClust$height*grumpsObj$cutoff),'_dendrogram.nwk', sep = '')
  write.tree(tr, file = outfile)
}

