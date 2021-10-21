library(bibtex)

all_pubs <- read.bib("burdukiewicz-publikacje.bib")

title_and_doi <- unlist(lapply(names(all_pubs), function(ith_name) {
  ith_pub <- unclass(all_pubs[[ith_name]])
  ith_doi <- paste0("https://doi.org/", ith_pub[[1]][["doi"]])
  pub_title <- gsub("[\\{\\}]", "", ith_pub[[1]][["title"]])
  c(pub_title, ith_doi, "\n")
}))

cat(title_and_doi, sep = "\n", file = "publications.txt")
