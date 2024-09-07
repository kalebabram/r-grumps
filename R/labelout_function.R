#' rgrumps heatmap function
#'
#' @description This function outputs the labels and groups from a grumpsObj
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @export
#'
#' @examples
#' labeloutFunc(grumpsObj)
labeloutFunc <- function(grumpsObj){
  print(paste('Your cutoff for this dataset is', max(grumpsObj$hClust$height*grumpsObj$cutoff), sep=' '))  
  out_prefix <- paste('_',grumpsObj$cutoff,'_',grumpsObj$clusteringmethod,'_', sep = '')
  clean_label <- as.matrix(grumpsObj$hClust$labels)
  clean_group <- as.matrix(grumpsObj$mcl)
  output <- cbind(clean_label,clean_group)
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'clust_groups_labels_cutoff_',max(grumpsObj$hClust$height*grumpsObj$cutoff),'.csv',sep = '')
  write.matrix(output,outfile,sep=',')
}
