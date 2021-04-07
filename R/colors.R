
config_path <- system.file("extdata", "config.yml", package = "EasyBranding")
cfg <- yaml::read_yaml(config_path)
color_hex_map <- cfg$colors
brand_palette_list <- cfg$palettes

#' Prints out available named colors and palettes
#'
#' @param ... Character names of color
#' @export
brand_info <- function(...) {
  cfg
}


#' Function to extract colors as hex codes by name
#'
#' @param ... Character names of color
#'
brand_colors <- function(...) {
  cols <- c(...)
  
  if (is.null(cols))
    return (color_hex_map)
  
  color_hex_map[cols]
}

#' Function to extract lists of palette colors by name
#'
#' @param ... Character name of palette
#'
brand_palettes <- function(...) {
  palette_names <- c(...)
  
  if(length(palette_names) == 1){
    list_of_colors <- brand_palette_list[[palette_names]]
    brand_colors()[ list_of_colors ]
  }else{
    brand_palette_list
  }
  
}


#' Return function to interpolate a color palette
#'
#' @param palette Character name of palette in brand_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
brand_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- brand_palettes(palette)
  if (reverse) pal <- rev(pal)
  
  colorRampPalette(pal, ...)
}

#' Color scale constructor for branding colors
#'
#' @param palette Character name of palette in brand_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_color_brand <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brand_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("colour", paste0("branding_discrete_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for branding colors
#'
#' @param palette Character name of palette in brand_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_fill_brand <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- brand_pal(palette = palette, reverse = reverse)
  
  if (discrete) {
    discrete_scale("fill", paste0("branding_discrete_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

