#load libraries
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

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


