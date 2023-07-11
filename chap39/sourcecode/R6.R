# 加载写入excel的包
library("writexl")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 写入excel数据
dataf <- writexl::write_xlsx(iris, "iris.xlsx")
# 保存工作空间
save.image("R6.RData")
