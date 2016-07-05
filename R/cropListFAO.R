#####################################################################################
# Title:   Crop/Sector Codelists
# Date:    July 2016
# Project: OpenAgFunding
# Author:  Bacou, Melanie <mel@mbacou.com>
#####################################################################################

library(data.table)
library(foreign)
library(rvest)
library(stringr)

setwd("~/Projects/openag-dev")

# Download all crop codelists from FAOSTAT, incl. aggregates
# Downloaded from http://faostat3.fao.org/download/Q/QC/E, since groups are not 
# available anywhere else, and are not in official documentation or data API

f <- list.files("./in", "FAOSTAT", full.names=T)
f <- lapply(f, fread)
sapply(f, names)
f <- rbindlist(f)
setnames(f, 1, "DomainCode")
f[, isGroup := Flag=="A"]

# Identify groups/aggregates
f <- f[, .N, by=.(DomainCode, Domain,  ItemCode, ItemName, isGroup)]
f[, ItemCode := as.integer(ItemCode)]
f[isGroup==T, GroupCode := ItemCode]

# => a little problematic to identify commodity groups using this source. Also the 
# groups overlap which is a little too complex for our prupose.
# Ulrike suggested using FAOSTAT commodity definitions and correspondences at
# http://www.fao.org/economic/ess/ess-standards/commodity/comm-chapters/en/
# These tables need to be scraped.

url.base <- "http://www.fao.org/"
url <- "http://www.fao.org/economic/ess/ess-standards/commodity/comm-chapters/en/"

# Extract the groupings
page <- read_html(url)
g <- page %>% html_nodes(css=".list-title") %>% html_text()
g.link <- page %>% html_nodes(xpath="//div[@class='list-link']/a/@href") %>% html_text()
g.code <- lapply(1:length(g.link), function(x) {
    tmp <- read_html(paste0(url.base, g.link[x])) %>%
      html_nodes(css=".tx-dynalist-pi1 table") %>% html_table()
    tmp[[1]]$group <- g[x]
    return(tmp)
  })

# Combine
g <- data.table(group=g, groupURL=g.link)
codelist <- lapply(g.code, `[[`, 1)
codelist <- rbindlist(codelist)
setkey(g, group)
setkey(codelist, group)
codelist <- g[codelist]

# Clean up
setnames(codelist, c("groupLabel", "groupURL", "itemCode", "itemLabel", "drop"))
codelist[, drop := NULL]
codelist[, groupCode := str_replace(str_split_fixed(groupLabel, " ", 2)[,1], "\n", "")]
codelist[, groupLabel := tolower(str_split_fixed(groupLabel, " ", 2)[,2])]
codelist[, groupCode := as.integer(groupCode)]
codelist[, itemLabel := tolower(itemLabel)]
codelist[, groupURL := paste0(url.base, groupURL)]
setcolorder(codelist, c(5,1,3,4,2))
setkey(codelist, groupCode, itemCode)

# Export to CSV
write.csv(codelist, "./codelists/FAOSTAT-items.csv", na="", row.names=F)




