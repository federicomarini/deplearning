# Like map_if but with the option to specify a value for false cases.
# E.g. NA, character(0) etc.
map_ifelse <- function(.x, .p, .f, .e, ...) {
  if (is_logical(.p)) {
    stopifnot(length(.p) == length(.x))
    sel <- .p
  } else {
    sel <- map_lgl(.x, .p, ...)
  }
  .x[sel] <- map(.x[sel], .f, ...)
  .x[!sel] <- .e
  .x
}