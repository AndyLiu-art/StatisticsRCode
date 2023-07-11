# 加载读取外部数据的包
library("foreign")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 写入SPSS数据
write.foreign(
    iris[1:10, 1:5],
    "irispart.sav",
    "irispart.spss",
    package = "SPSS"
)
# 保存工作空间
save.image("R10.RData")
