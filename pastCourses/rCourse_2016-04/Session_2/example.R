
ensureLib <-function(libName){
  if(!require(libName, character.only = T)){
    install.packages(libName)
    #call require again because install.packages simply installs the package, it doesn't load it
    require(libName, character.only = T)
  }
}


ensureLib("readr")
ensureLib("tidyr")
ensureLib("dplyr")

ensureLib("ggplot2")

temp = read_tsv("/Users/nick/bootstrappers/bootstrappers-courses/pastCourses/rCourse_2016-04/datasets/Temperatures.txt")
colnames(temp)[1] = "Months"

tempOrganized = gather(temp, "City", "Temperature", 2:ncol(temp))
tempOrganized$Months = factor(tempOrganized$Months, levels = c('January','February','March','April','May','June','July','August','September','October','November','December'))

tempPlot = ggplot(tempOrganized, aes(x = Months, y = Temperature, group = City, color = City) ) + geom_line()
print(tempPlot)

