setwd("~/git/SQL-workshop")
library(readr)

# congress data
d <- read.csv("~/Dropbox/research/incivility/data/congress-data-20180101.csv",
              stringsAsFactors=F)
d$screen_name <- d$facebook
d <- d[!is.na(d$screen_name),]
d <- d[,c("bioid", "screen_name", "name", "gender", "type", "party")]
write.csv(d, file="~/git/SQL-workshop/data/congress-facebook-2017.csv",
          row.names=FALSE)

# now adding FB posts
fls <- list.files(
  "~/Dropbox/research/incivility/data/facebook-115-posts", 
  full.names=TRUE)

for (i in 1:length(fls)){
  
  message(fls[i])
  # reading file
  fb <- read_csv(fls[i], col_types="cccccccciii")
  
  # adding name of file as screen_name (we will use to link tables)
  fb$screen_name<- screen_name <- gsub(".*posts/|.csv", "", fls[i])
  
  # converting date to R format (so that we can query it later)
  fb$date <- as.character(tweetscores::formatFbDate(fb$created_time, "date"))
  fb$datetime <- as.character(tweetscores::formatFbDate(fb$created_time, "datetime"))
  
  # adding URL domain
  fb$domain <- gsub("https?://w?w?w?\\.?", "", fb$link)
  fb$domain <- gsub("/.*", "", fb$domain)
  fb$domain[fb$type!="link"] <- NA
  
  # merging with reactions
  f <- gsub("-posts", "-reactions-totals", fls[i])
  f <- gsub(".csv", "_reactions.csv", f)
  if (file.exists(f)){
    reactions <- read_csv(f, col_types="ciiiiii")
    fb <- merge(fb, 
                reactions[,-which(names(reactions)=="likes_count")],
                all.x=TRUE)
  }
  if (!file.exists(f)){
    fb$love_count <- fb$haha_count <- fb$wow_count <-
        fb$sad_count <- fb$angry_count <- NA
  }
  
  # sorting labels
  fb <- fb[,c("screen_name", "id", "from_name",
              "date", "datetime", "message", "type", "link", "domain",
              "likes_count", "comments_count", 
              "shares_count", "love_count", "haha_count",
              "wow_count", "sad_count", "angry_count")]
  
  # writing to disk
  write.csv(fb,
            file=paste0("~/git/SQL-workshop/data/posts/",
                        screen_name, ".csv"), row.names = FALSE)
    
}