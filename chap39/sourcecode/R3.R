# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取文本数据
dataf <- read.table("iris.txt", header = TRUE)
print(head(dataf))
# 保存工作空间
save.image("R3.RData")
