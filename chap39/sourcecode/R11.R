# 加载读取外部数据的包
library("foreign")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取Stata数据
dataf <- foreign::read.dta("iris.dta")
print(head(dataf))
# 保存工作空间
save.image("R11.RData")
