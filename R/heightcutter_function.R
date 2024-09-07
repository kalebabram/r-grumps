#' rgrumps tree height cutter function
#'
#' @description This function cuts a tree from a grumpsObj using the user supplied cutoff
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @return grumpsObj
#' @export
#'
#' @examples
#' heightCutter(grumpsObj)
heightCutter <- function(grumpsObj){
  out_prefix <- paste('_',grumpsObj$cutoff,'_',grumpsObj$clusteringmethod,'_', sep = '')
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'_dendrogram.png', sep = '')
  print(paste('Your cutoff for this dataset is', grumps$cutoff, sep=' '))
  grumpsObj$mcl <- cutree(grumpsObj$hClust, h=grumpsObj$cutoff)
  clean_label <- as.matrix(grumpsObj$hClust$labels)
  clean_group <- as.matrix(grumpsObj$mcl)
  output <- cbind(clean_label,clean_group)
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'_clust_groups_labels_cutoff_',max(grumpsObj$hClust$height*grumpsObj$cutoff) '.csv',sep = '')
  write.matrix(output,outfile,sep=',')
  return(grumpsObj)
}
