# 加载随机游程检验的包
library("tseries")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
data <- c(
    1, 1, 1, 0, 1, 1, 0, 0, 1, 1, 1, 0, 1,
    1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0, 1
)
res <- tseries::runs.test(
    as.factor(data), # 样本，必须是因子
    alternative = "two.sided" # 双边检验
)
print(res)
# 保存工作空间
save.image("R22.RData")
