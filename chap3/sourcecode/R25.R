# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 挂载数据集
attach(women)
res1 <- shapiro.test(height)
res2 <- shapiro.test(weight)
print(res1)
print(res2)
# 保存工作空间
save.image("R25.RData")
