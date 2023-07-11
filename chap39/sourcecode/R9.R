# 加载读取外部数据的包
library("foreign")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取SPSS数据
dataf <- foreign::read.spss("iris.sav")
print(head(dataf))
# 保存工作空间
save.image("R9.RData")
