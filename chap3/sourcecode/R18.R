# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(306, 385, 300, 319, 320)
y <- c(311, 364, 315, 338, 398)
z <- c(289, 198, 201, 302, 289)
# 转为列表
dataf <- list(x = x, y = y, z = z)
res <- kruskal.test(dataf)
print(res)
# 保存工作空间
save.image("R18.RData")
