library(ggplot2)
library(RColorBrewer)
data <- read.table("C:/Minor/bisulfite_vs_nanopolish.tsv", header=T)

# Set color palette for 2D heatmap
rf <- colorRampPalette(rev(brewer.pal(11,'Spectral')))
r <- rf(32)

c <- cor(data$frequency_1, data$frequency_2)
title <- sprintf("N = %d r = %.3f", nrow(data), c)
ggplot(data, aes(frequency_1, frequency_2)) +
    geom_bin2d(bins=25) + scale_fill_gradientn(colors=r, trans="log10") +
    xlab("Bisulfite Methylation Frequency") +
    ylab("Nanopolish Methylation Frequency") +
    theme_bw(base_size=20) +
    ggtitle(title)