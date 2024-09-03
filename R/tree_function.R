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
  if (grumpsObj$mode == 'general'){
    out_prefix <- paste('_',grumpsObj$cutoff,'_',grumpsObj$clusteringmethod,'_', sep = '')
    outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'_newick.nwk', sep = '')
  }
  else{
    out_prefix <- paste('_',grumpsObj$clusteringmethod, sep = '')
    outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'_newick.nwk', sep = '')
  }
  write.tree(tr, file = outfile)
}