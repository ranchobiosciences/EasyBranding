rancho_colors <- list(`orange`      = "#F58220",
                      `light_green` = "#7AC143",
                      `brown`       = "#591F00",
                      `dark_green`  = "#61AB33",
                      `gold`        = "#ffc425",
                      `red`         = "#d11141")

#' Function to extract colors as hex codes by name
#'
#' @param ... Character names of color
#'
rancho_cols <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (rancho_colors)

  rancho_colors[cols]
}

rancho_palettes <- list(
  `main`  = rancho_cols("orange", "light_green"),
  `light` = rancho_cols("orange", "gold"),
  `dark`  = rancho_cols("dark_green", "brown")
)

#' Return function to interpolate a color palette
#'
#' @param palette Character name of palette in rancho_palettes
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments to pass to colorRampPalette()
#'
rancho_pal <- function(palette = "main", reverse = FALSE, ...) {
  pal <- rancho_palettes[[palette]]

  if (reverse) pal <- rev(pal)

  colorRampPalette(pal, ...)
}

#' Color scale constructor for Rancho colors
#'
#' @param palette Character name of palette in rancho_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_color_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_color_rancho <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rancho_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("colour", paste0("rancho_", palette), palette = pal, ...)
  } else {
    scale_color_gradientn(colours = pal(256), ...)
  }
}

#' Fill scale constructor for Rancho colors
#'
#' @param palette Character name of palette in rancho_palettes
#' @param discrete Boolean indicating whether color aesthetic is discrete or not
#' @param reverse Boolean indicating whether the palette should be reversed
#' @param ... Additional arguments passed to discrete_scale() or
#'            scale_fill_gradientn(), used respectively when discrete is TRUE or FALSE
#'
#' @export
scale_fill_rancho <- function(palette = "main", discrete = TRUE, reverse = FALSE, ...) {
  pal <- rancho_pal(palette = palette, reverse = reverse)

  if (discrete) {
    discrete_scale("fill", paste0("drsimonj_", palette), palette = pal, ...)
  } else {
    scale_fill_gradientn(colours = pal(256), ...)
  }
}

