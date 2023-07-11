# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取剪切板数据
dataf <- read.table("clipboard")
print(head(dataf))
# 保存工作空间
save.image("R7.RData")
