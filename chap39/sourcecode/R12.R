# 加载读取外部数据的包
library("foreign")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 写入Stata数据
foreign::write.dta(head(iris), "irispart.dta")
# 保存工作空间
save.image("R12.RData")
