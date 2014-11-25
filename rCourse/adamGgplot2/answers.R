answer1 <- "ggplot(birthwt, aes(x=age,y=lwt, color = low)) "
answer2 <- "ggplot(birthwt, aes(x=age,y=lwt, color = low)) + geom_point()"
hint3 <- 'typh.boston.df <- boston.epi.df[which(boston.epi.df$disease == "TYPHOID FEVER [ENTERIC FEVER]" & boston.epi.df$event == "DEATHS"),]'
hint3.1 <- 'agg <- aggregate(data=typh.boston.df, number ~ Year,sum)'
answer3 <- "ggplot(agg,aes(x=Year,y=number)) + geom_line()"
answer4 <-  'ggplot(agg,aes(x=Year,y=number)) + geom_line() +
  xlab("Time (in years)") +
  ylab("Number of Typhoid Fever Deaths")
  ggtitle("Typhoid Fever Deaths Per Year\n1888-1932")'
answer5 <- 'ggplot(typh.boston.df, aes(x=number)) + geom_bar(binwidth=1)'
answer5.1 <- 'ggplot(agg, aes(x=number)) + geom_bar(binwidth=1)'
answer6a <- 'ggplot(GAGurine, aes(x=GAG)) + geom_density()'
hint6b <- "Instead of Age, use Age < 2, R will treat this as a binary variable"
answer6b <- 'ggplot(GAGurine, aes(x=GAG,color=Age < 2)) + geom_density()'
hint7 <- 'instead of GAGurine$Age, use cut(GAGurine$Age,breaks = 1:17)'
answer7 <- 'ggplot(GAGurine, aes(y=GAG,x=cut(GAGurine$Age,breaks = 1:17))) + geom_boxplot()'
answer8 <- 'http://flowingdata.com/category/visualization/ugly-visualization/'
print("Answers have successfully loaded")