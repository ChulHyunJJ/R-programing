data <- read.csv('C:/Users/Chris/MyGit/R_Practice/Data manipulation/data/Forest.csv', na.strings=NA)
str(data)
table(is.na(data))
test <- data

attach(test)
table(is.na(휴양림명))
table(is.na(시도명))
table(is.na(휴양림구분))
table(is.na(휴양림면적))

table(is.na(수용인원수))

test[,5] <- ifelse(is.na(test[,5]), mean(test$수용인원수, na.rm=T), test[,5])
test$수용인원수
table(is.na(test$수용인원수))

test %>%
  group_by(시도명) %>%
  filter(숙박가능여부 == 'Y') %>%
  summarise(휴양림합 = n(), 수용인원수합 = sum(수용인원수)) %>%
  arrange(desc(휴양림합)) %>%
  select(시도명, 휴양림합, 수용인원수합) %>%
  head(5)

tb1 <- test %>%
  filter(수용인원수 != 0) %>%
  mutate(밀집도 = 수용인원수 / 휴양림면적) %>%
  arrange(desc(밀집도)) %>%
  select(휴양림명, 시도명, 밀집도, 휴양림전화번호) %>%
  head(3) %>%
  mutate(표기 = 'HD')
tb1
tb2 <-   test %>%
  filter(수용인원수 != 0) %>%
  mutate(밀집도 = 수용인원수 / 휴양림면적) %>%
  arrange(desc(밀집도)) %>%
  select(휴양림명, 시도명, 밀집도, 휴양림전화번호) %>%
  tail(3) %>%
  mutate(표기 = 'LD')
tb2
total_tb <- full_join(tb1,tb2)
total_tb
