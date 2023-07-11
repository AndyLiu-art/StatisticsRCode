# 加载读取外部数据的包
library("haven")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取SAS数据
dataf <- haven::read_sas("iris.sas7bdat")
print(head(dataf))
# 保存工作空间
save.image("R13.RData")
