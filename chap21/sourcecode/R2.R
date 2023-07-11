# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap21\\sourcecode")
# 多项式系数，从左到右，次数从低到高
coef <- c(-5, 2, 1, 1)
# 求根
res <- polyroot(coef)
print("多项式的根为")
print(res)
# 保存工作空间
save.image("R2.RData")
