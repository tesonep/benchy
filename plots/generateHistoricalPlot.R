# install.packages("hrbrthemes")
# install.packages("ggpubr")

# Library
library(ggplot2)
library(hrbrthemes)
library(ggpubr)
library(dplyr, include.only = 'summarize')

Sys.setenv(LANG = "en")

cmdArgs <- commandArgs()

if(is.na(cmdArgs[6])){
  maxNumberOfDates <- 20
  experimentName <- 'richards'
  imageAndVMsString <- 'Pharo11SMark-latest9 Pharo11SMark-latest10 Pharo11ComposedImageSMark-newImageFormat'
  buildDir <- '/Users/admin/dev/Pharo/benchy/_build'
}else{
  maxNumberOfDates <- strtoi(cmdArgs[6])
  experimentName <- cmdArgs[7]
  imageAndVMsString <- cmdArgs[8]
  buildDir <- cmdArgs[9]
}

print(cmdArgs)

imageAndVMs <- unlist(strsplit(imageAndVMsString, ' '))
outputDir <- paste(buildDir,"/plots/historical", sep='')
outputFile <- paste(outputDir, "/", experimentName, ".pdf", sep='')

print(outputFile)

dir.create(outputDir, recursive=TRUE)

#Extract All Runs for the experiment and imagesAndVMs
runs <- vector()
for (i in imageAndVMs) {
  someRuns <- dir(paste(buildDir,'/results', sep=""), 
              pattern=paste(experimentName,"-", i, "(.*)\\.csv", sep=""), 
              recursive=TRUE, full.names = TRUE)
  
  runs <- append(runs, someRuns)
}

#Extract All Dates
dates <- vector()
for(f in runs){
  parts <- unlist(strsplit(basename(f), '-'))
  date <- paste(parts[4], parts[5], unlist(strsplit(parts[6], '\\.'))[1], sep='-')

  dates <- append(dates, date)
}

dates <- tail(unique(dates),maxNumberOfDates)

merged <- data.frame()
for(d in dates){
  for(i in imageAndVMs){
    f <- paste(buildDir, "/results/", experimentName, '-', i, '/', experimentName,'-',i,'-',d,'.csv', sep="")

    values <- read.csv(f, header=FALSE)$V1
    names <- rep(i, times=length(values))
    dateValue <- rep(d, times=length(values))
    
    newFrame <- data.frame('Time'=values, 'ImageAndVM'=names, 'Date'=dateValue)
    
    if(length(merged) == 0){
      merged <- newFrame
    }else{
      merged <- merge(merged, newFrame,all=TRUE,no.dups=FALSE)
    }
  }
}

averages <- merged %>% 
  group_by(ImageAndVM, Date) %>%
  summarize(Time = mean(Time), .groups ="drop")

ggplot(averages, aes(x=Date, y=Time)) + 
  geom_line(aes(colour=ImageAndVM, group=ImageAndVM)) +
  labs(title=paste('Mean Times of',experimentName), y='Time(mean)', colour='Image & VM') +
  theme_classic()+
  theme(legend.position = "bottom") +
  geom_point(aes(colour=ImageAndVM),
             size=3)

print(outputFile)

ggsave(
  width = 10,
  height = 7,
  unit = 'in',
  outputFile)
