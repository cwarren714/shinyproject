library(shiny)
library(datasets)
shinyServer(function(input, output) {
  output$contents<- renderPlot({
    
    # input$file1 will be NULL initially. After the user selects and uploads a 
    # file, it will be a data frame with 'name', 'size', 'type', and 'datapath' 
    # columns. The 'datapath' column will contain the local filenames where the 
    # data can be found.
    
    inFile <- input$file1
    
    if (is.null(inFile))
      return(NULL)
    
    novel.v.new<-as.vector(read.table(inFile$datapath, header=FALSE,as.is=TRUE, sep="\n"))
    novel.v<-paste(novel.v.new, collapse=" ")
    novel.lower.v<-tolower(novel.v)
    moby.words.l<-strsplit(novel.lower.v, "\\W")
    moby.word.v<-unlist(moby.words.l)
    #Figure out which are blanks
    not.blanks.v <- which(moby.word.v!="")
    not.blanks.v[1:15]
    moby.word.v<- moby.word.v[not.blanks.v]
    length(unique(moby.word.v))
    moby.freqs.t<-table(moby.word.v)
    sorted.moby.freqs.t<-sort(moby.freqs.t , decreasing=T)
    mynums.v<-sorted.moby.freqs.t[c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15)]
    plot(mynums.v[1:15], type="b", main="Top 15 words",
         xlab="Top 15 words", ylab="Percentage of Full Text", xaxt ="n")
    axis(1,1:15, labels=names(sorted.moby.freqs.t [1:15]))
  })
})
