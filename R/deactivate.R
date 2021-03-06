#' Deactivate daRkStudio
#'
#' Remove and replace the modified \code{index.htm} with the backup
#' \code{index.htm.pre-ds} file. Also deletes the \code{darkstudio} directory.
#'
#' This function does NOT uninstall the daRkStudio package.
#' To uninstall the darkstudio package, copy and
#' paste remove.packages('darkstudio') into the console.
#'
#' @param file_index character:
#'   Path to RStudio's \code{index.htm}.
#'
#' @return Returns \code{TRUE} if the operation is successful.
#' @export
deactivate <- function(path = NULL, restore_index = TRUE) {
  path_index <- index$find(path = path)

  if (isTRUE(restore_index)) {
    index$restore(path = path_index)
  }

  if (!settings_dir(path = path_index)) {
    warning("darkstudio directory does not exist.")
  } else {
    ds_dir <- settings_dir(path = path_index, value = TRUE)
    fs::dir_delete(ds_dir)
  }
  return(TRUE)
}
