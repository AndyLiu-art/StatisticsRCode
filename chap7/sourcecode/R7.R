# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap7\\sourcecode")
km <- kmeans(iris[, 1:4], center = 3)
print(km)
# 保存工作空间
save.image("R7.RData")
