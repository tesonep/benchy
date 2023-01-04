# install.packages("hrbrthemes")
# install.packages("ggpubr")

# Library
library(ggplot2)
library(hrbrthemes)
library(ggpubr)

cmdArgs <- commandArgs()

if(is.na(cmdArgs[6])){
  date<- '2023-01-04'
  experimentName <- 'richards'
  buildDir <- '/Users/admin/dev/Pharo/benchy/_build'
}else{
  date<- cmdArgs[6] #eg '2023-01-04'
  experimentName <- cmdArgs[7] #eg 'opalTests'
  buildDir <- cmdArgs[8] #eg '/Users/admin/dev/Pharo/benchy/_build'
}


outputDir <- paste(buildDir,"/plots/", experimentName, sep='')
outputFile <- paste(outputDir, "/", experimentName, "-", date, ".pdf", sep='')

dir.create(outputDir, recursive=TRUE)


runs <- dir(paste(buildDir,'/results/', sep=""), 
            pattern=paste(experimentName,"(.*)",date,"\\.csv", sep=""), 
            recursive=TRUE, full.names = TRUE)

print(runs)

merged <- data.frame()

for (file in runs) {
  
  parts <- unlist(strsplit(basename(file), '-'))
  image <- parts[2]
  vm <- parts[3]

  values <- read.csv(file, header=FALSE)$V1
  names <- rep(paste(image, vm, sep='\n'), times=length(values))
  
  if(length(merged) == 0){
    merged <- data.frame('Time'=values, 'Name'=names)
  }else{
    merged <- merge(merged, data.frame('Time'=values, 'Name'=names),all=TRUE,no.dups=FALSE)
  }
}

p <- ggplot(merged, aes(y=Time,x=Name))+ 
  geom_violin(trim=FALSE, fill="gray")+
  labs(x="Image & VM", y = "Time")+
  geom_boxplot(width=0.1)+
  theme_classic()

pa <- annotate_figure(p, top = text_grob(paste(experimentName, date)))

ggsave(
  outputFile,
  plot = pa,
  width=5,
  height=4,
  unit="in")
