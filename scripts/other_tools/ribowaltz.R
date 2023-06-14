library(riboWaltz)

setwd("../../data/")
metadata <- read.table('ribo/metadata.txt', header = FALSE, sep = "", dec = ".")
annotation_db <- create_annotation('genome/Homo_sapiens.GRCh38.107.gtf')
for (i in metadata$V1){
    reads_list <- bamtolist(bamfolder=sprintf("ribo/%s/out/", i), annotation=annotation_db)
    filtered_list <- length_filter(data=reads_list, length_filter_mode="custom", length_range=20:40)
    psite_offset <- psite(filtered_list)
    dir.create(sprintf("ribo/%s/out/ribowaltz", i))
    write.table(psite_offset, sprintf("ribo/%s/out/ribowaltz/riboWaltz_offsets.csv", i), sep="\t")
}
