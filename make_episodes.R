rmd_epispodes <- list.files(pattern = ".Rmd$", full.names = TRUE)
dir.create("docs", showWarnings = FALSE)

lapply(rmd_epispodes[1:3], function(foobar) {
  rmarkdown::render(foobar, output_dir = "docs", output_format = "html_document")
})
