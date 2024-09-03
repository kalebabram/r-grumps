#' rgrumps heatmap function
#'
#' @description This function creates a heatmap from a grumpsObj and saves it to a file
#'
#' @param grumpsObj grumpsObj from grumps_function
#'
#' @keywords grumps
#'
#' @export
#'
#' @examples
#' heatmapFunc(grumpsObj)
heatmapFunc <- function(grumpsObj){
  colfunc <- colorRampPalette(rev(brewer.pal(n=11, name = "BrBG")))
  out_prefix <- paste('_',grumpsObj$clusteringmethod, sep = '')
  outfile <- paste(strsplit(grumpsObj$file, '_distmat.csv')[[1]][1],'_r',out_prefix,'_heatmap.png', sep = '')
  png(outfile, units="in", width =30 , height = 15, res = 600)
  heatmap(grumpsObj$dataframe, Rowv = as.dendrogram(grumpsObj$hClust),Colv = 'Rowv', col = colfunc(200000), scale = 'none', labRow = FALSE, labCol = FALSE)
  dev.off()
}