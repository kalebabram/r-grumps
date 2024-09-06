#' rgrumps dendrogram function
#'
#' @description This function creates a color dendrogram from hc.
#'
#' @param hc output of hclust
#' @param y vector containing labels of hclust output
#' @param main title of plot
#' @param branchlength how long colored region is of branch
#' @param labels labels for tips
#' @param xlab x-axis label
#' @param sub sub-x-axis label
#' @param ylab y-axis label
#' @param cex.main amount to enlarge main title of figure
#' @keywords grumps
#'
#' @export
#'
#' @examples
#' ColorDendrogram(grumpsObj$hClust, grumpsObj$mcl)
ColorDendrogram <- function(hc, y, main="", branchlength=.7, labels=NULL, xlab=NULL, sub=NULL,ylab="",cex.main=NULL){
  if(is.null(labels)) labels <- rep("", length(y))
  plot(hc,hang=.2, main=main, labels=labels, xlab=xlab, sub=sub,ylab=ylab,cex.main=cex.main) #plclust
  y <- y[hc$ord]
  if(is.numeric(y)){
    y <- y+1
    y[y==7] <- "orange"
  } 
  for(i in 1:length(hc$ord)){
    o=hc$merge[,1]==  -hc$ord[i] | hc$merge[,2]== -hc$ord[i]
    segments(i,hc$he[o]-branchlength,i,hc$he[o],col=y[i])
  }
}
