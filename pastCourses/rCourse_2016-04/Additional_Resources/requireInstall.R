requireInstall <- function(packName){
  if(!require(packName)){
    install.packages(packName)
  }
}
