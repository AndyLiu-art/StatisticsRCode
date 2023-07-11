# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap31\\sourcecode")
# 建立局部线性趋势模型
res <- StructTS(Nile, type = "trend")
print(res)
# 拟合值
print(fitted(res)[1:10, ])
# 保存工作空间
save.image("R2.RData")
