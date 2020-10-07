# Creating training and testing datasets based on analysis dataset.

analysis = read.csv("derived_data/analysis.csv")

set.seed(1107)
train=sample(c(TRUE,FALSE),nrow(analysis),rep=TRUE)
test=(!train)

ds_train = analysis[train,]
ds_test = analysis[test,]

write_csv(ds_train, "derived_data/train.csv")
write_csv(ds_test, "derived_data/test.csv")