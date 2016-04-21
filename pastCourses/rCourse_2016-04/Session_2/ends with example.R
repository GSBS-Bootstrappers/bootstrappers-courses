endsWith <- function (vars, match, ignore.case = TRUE) {
  originalVars = vars
  stopifnot(is.string(match), !is.na(match), nchar(match) > 
              0)
  if (ignore.case) {
    match <- tolower(match)
  }
  n <- nchar(match)
  if (ignore.case) {
    vars <- tolower(vars)
  }
  length <- nchar(vars)
  orginalVars[which(substr(vars, pmax(1, length - n + 1), length) == match)]
}

endsWith <- function(var, match) {
  substr(var, pmax(1, nchar(var) - nchar(match) + 1), nchar(var)) == match
}

