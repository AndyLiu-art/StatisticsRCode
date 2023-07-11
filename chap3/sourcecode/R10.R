# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
dataf <- c(74, 92, 83, 79, 80, 73, 77, 75, 76, 91)
res <- chisq.test(
    x = dataf, # 样本
    p = rep(0.1, 10), # 待检验的概率
)
print(res)
# 保存工作空间
save.image("R10.RData")
