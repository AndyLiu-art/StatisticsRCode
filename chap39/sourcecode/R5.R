# 加载读取excel的包
library("readxl")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取excel数据
dataf <- readxl::read_excel("movie.xlsx")
print(head(dataf))
# 保存工作空间
save.image("R5.RData")
