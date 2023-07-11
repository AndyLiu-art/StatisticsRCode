# 加载读取外部数据的包
library("haven")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 修改列名
dataf <- iris
names(dataf) <- paste("V", 1:5, sep="")
# 写入SAS数据
haven::write_sas(head(dataf), "irispart.sas7bdat")
# 保存工作空间
save.image("R14.RData")
