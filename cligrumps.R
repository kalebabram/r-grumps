#!/usr/bin/env Rscript
library(rgrumps)
library(optparse)
option_list = list(
  make_option(c("-f", "--file"), type="character", default=NULL, help="Dataset file path", metavar="character"),
  make_option(c("-m", "--mode"), type="character", default="heatmap", help="Mode to run script in [default= %default]. \n \t Available modes are: 'heatmap', 'dendrogram', & 'general'", metavar="character"),
  make_option(c("-c", "--cutoff"), type='double', default = 1.25E-02, help = "Max height of dendrogram multiplied by this value to make the cuts [default= %default]. \n \t If running in 'general mode', this should be user set based on the data.", metavar ='double'),
  make_option(c("-g", "--clusteringmethod"), type="character", default = "ward.D2", help="Method to use when performing the hierarchical clustering [default= %default]. \n \t Available methods are: 'ward.D', 'ward.D2', 'single', 'complete', 'average', 'mcquitty', 'median', or 'centroid'", metavar = 'charcter'),
  make_option(c("-t", "--tree"), type="character", default="yes", help="output the dendrogram in newick format", metavar='charcter')
);
opt_parser = OptionParser(option_list=option_list);
opt = parse_args(opt_parser);

if (is.null(opt$file)){
  print_help(opt_parser)
  stop("At least one argument must be supplied (input file).n", call.=FALSE)
}

## program
grumps <- grumpsFunc(opt$file,opt$mode,opt$cutoff,opt$clusteringmethod,opt$tree)
grumps = dataframeFunc(grumps)
grumps = clusterFunc(grumps)

if (grumps$mode == 'heatmap'){
  grumps= mclFunc(grumps)
  heatmapFunc(grumps)
  labeloutFunc(grumps)
  dendrogramFunc(grumps)
  if (grumps$tree == 'yes'){
    treeFunc(grumps)
  }
}

if (grumps$mode == 'dendrogram'){
  grumps = mclFunc(grumps)
  labeloutFunc(grumps)
  dendrogramFunc(grumps)
  if (grumps$tree == 'yes'){
    treeFunc(grumps)
  }
}

if (grumps$mode == 'general'){
  heatmapFunc(grumps)
  grumps = heightCutter(grumps)
  dendrogramFunc(grumps)
  if (grumps$tree == 'yes'){
    treeFunc(grumps)
  }  
}  
