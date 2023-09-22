#' Update species taxa based on speciesmaster lookup
#'
#' @param vegdata is a data.table with species codes in a 'Species' column
#' @param sppmaster the taxon lookup table from the spp master
#'
#' @return
#' @export
#'
#' @examples

update_taxa <- function(vegdata, sppmaster){
  lookup <- sppmaster[sppmaster$OldCode != sppmaster$Code,c("Code", "OldCode")]
  setDT(vegdata)[setDT(lookup), "Species" := Code, on = c("Species" = "OldCode")]
  #return(vegdata)
}
