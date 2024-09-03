#' rgrumps grumps function
#'
#' @description This function creates a grumpsObj
#'
#' @param filepath Filepath to a .csv file output from GRUMPS
#' @param mode Mode to run rgrumps in. Options are: 'heatmap', 'dendrogram', or 'general'. Default: 'heatmap'.
#' @param cutoff Cutoff to use for creating subgroups from hclust output. If mode is not 'general', the max height of the hclust output is multiplied by this value. Default: 1.25E-02.
#' @param clusteringmethod Clustering method to use by hclust. Available methods are: 'ward.D', 'ward.D2', 'single', 'complete', 'average', 'mcquitty', 'median', or 'centroid'. Default: 'ward.D2'.
#' @param tree Output the resultant dendrogram as a .nwk file. Default: 'yes'.
#'
#' @keywords grumps
#'
#' @return A grumpsObj, which is used by all other functions in this package.
#' @export
#' @importFrom grDevices colorRampPalette dev.off png
#' @importFrom stats as.dendrogram as.dist cor cutree hclust heatmap
#' @importFrom utils read.csv
#' @importFrom RColorBrewer brewer.pal
#' @importFrom ape as.phylo write.tree
#' @importFrom MASS write.matrix
#' @importFrom sparcl ColorDendrogram
#'
#' @examples
#' grumpsFunc('/filepath/to/distmat.csv')
#' grumpsFunc('/filepath/to/distmat.csv', mode='heatmap')
#' grumpsFunc('/filepath/to/distmat.csv', mode='heatmap', cutoff=1.25E-02,clusteringmethod='ward.D2',tree='yes')
grumpsFunc <- function(filepath,mode='heatmap',cutoff=1.25E-02,clusteringmethod='ward.D2',tree='yes'){
  if (file.exists(filepath)){
    grumps <- list(file=filepath, mode=mode, cutoff=cutoff, clusteringmethod=clusteringmethod, tree=tree, dataframe = '', hClust='', mcl='',out_prefix='')
    class(grumps) <- 'grumpsObj'
    return(grumps)
  }
  else {
    print('File does not exist, please check the filepath')
  } 
}
