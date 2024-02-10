This is an [R Markdown](http://rmarkdown.rstudio.com) notebook
containing code to analyse pairwise SNP distance between 190 CC30 *S.
aureus* genomes from Argentina. The results appear beneath the code.

``` r
#load libraries
library(tidyverse)
```

    ## ── Attaching packages ─────────────────────────────────────── tidyverse 1.3.2 ──
    ## ✔ ggplot2 3.4.0      ✔ purrr   1.0.1 
    ## ✔ tibble  3.1.8      ✔ dplyr   1.0.10
    ## ✔ tidyr   1.2.1      ✔ stringr 1.5.0 
    ## ✔ readr   2.1.3      ✔ forcats 0.5.2 
    ## ── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
    ## ✖ dplyr::filter() masks stats::filter()
    ## ✖ dplyr::lag()    masks stats::lag()

``` r
library(readr)
library(dplyr)
library(ggplot2)
```

Plot the pairwise SNP distance distribution by genomes of the
same/different clade

``` r
#import Dataset
CC30ARG_SNP_count <- read.csv("CC30ARG_SNP_count.csv")

#plot histogram of pairwise SNP distance distribution
CC30ARG_SNP_count %>%
  group_by(same_clade)%>%
  ggplot(aes(SNPs, fill=same_clade)) +
           geom_bar() +
  ylim(0, 300)+
  labs(x= "Pairwise SNP distance", 
       y= "Frequency") +
  theme_minimal()+
  theme(axis.title.x = element_text(size=18), 
        axis.title.y = element_text(size=18),
        axis.text = element_text(size = 12),
        legend.text = element_text(size = 18),
        legend.position = "bottom",
        legend.title=element_blank()) +
  scale_fill_discrete(name="same_clade",
                      breaks=c("yes", "no"),
                      labels=c("Same clade", "Different clade"))
```

![](CC30ARG_SNP_count_files/figure-markdown_github/unnamed-chunk-2-1.png)
