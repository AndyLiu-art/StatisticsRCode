# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 查看MASS包自带的数据集
data(package = "MASS")
# 加载Boston数据集
data(Boston, package = "MASS")
print(head(Boston))
# 保存工作空间
save.image("R2.RData")
