# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 读取文本数据
dataf <- write.table(
    women, "women.txt",
    sep = "\t",
    quote = FALSE, row.names = FALSE
)
# 保存工作空间
save.image("R4.RData")
