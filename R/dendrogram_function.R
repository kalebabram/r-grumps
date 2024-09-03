#' rgrumps dendrogram output function
#'
#' @description This function creates a dendrogram from a grumpsObj and saves it to a file
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @export
#'
#' @examples
#' dendrogramFunc(grumpsObj)
dendrogramFunc <- function(grumpsObj){
  out_prefix <- paste('_',grumpsObj$clusteringmethod, sep = '')
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r', out_prefix,'_',max(grumpsObj$hClust$height*grumpsObj$cutoff),'_dendrogram.png', sep = '')
  png(outfile, units="in", width =30 , height = 15, res = 600)
  ColorDendrogram(grumpsObj$hClust, y = grumpsObj$mcl, branchlength = 20)
  dev.off()  
}
