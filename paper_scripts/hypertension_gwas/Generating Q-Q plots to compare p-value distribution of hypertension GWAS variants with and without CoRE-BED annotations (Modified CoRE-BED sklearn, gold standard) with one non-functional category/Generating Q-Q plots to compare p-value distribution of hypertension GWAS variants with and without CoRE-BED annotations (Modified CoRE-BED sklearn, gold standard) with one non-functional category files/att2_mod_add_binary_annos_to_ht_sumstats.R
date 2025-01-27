library("data.table")

#Declare the path of the original summary stats file, as well as the binarized annotations
sum_stats_path <- "/home/bettimj/gamazon_rotation/uk_biobank/hypertension/phecode-401-both_sexes.tsv"
bin_annos_path <- "/home/bettimj/gamazon_rotation/mod_core-bed/uk_biobank/att2_epimap_phecode-401-both_sexes.func_anno.all_heart.tsv"

#Open both of the files as data frames
sum_stats_file <- fread(sum_stats_path, header = TRUE, sep = "\t", quote = "")
sum_stats_df <- as.data.frame(sum_stats_file)

bin_annos_file <- fread(bin_annos_path, header = FALSE, sep = "\t", quote = "")
bin_annos_df <- as.data.frame(bin_annos_file)

#Append the annotation status to the original summary stats file
sum_stats_df <- cbind(sum_stats_df, bin_annos_df)
names(sum_stats_df)[ncol(sum_stats_df)] <- "CORE_BED_ANNO"

#Write out the merged file as a new .txt file
write.table(sum_stats_df, file = "/home/bettimj/gamazon_rotation/mod_core-bed/uk_biobank/att2_bin_annos_epimap_phecode-401-both_sexes.func_anno.txt", quote = FALSE, sep = "\t", row.names = FALSE, col.names = TRUE)