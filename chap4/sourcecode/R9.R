# 加载协方差分析的包
library("HH")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 因子变量
feed <- as.factor(rep(c("A", "B", "C"), each = 8))
Weight_Initial <- c(
    15, 13, 11, 12, 12, 16, 14, 17, 17, 16,
    18, 18, 21, 22, 19, 18, 22, 24, 20, 23,
    25, 27, 30, 32
)
Weight_Increment <- c(
    85, 83, 65, 76, 80, 91, 84, 90, 97, 90,
    100, 95, 103, 106, 99, 94, 89, 91, 83,
    95, 100, 102, 105, 110
)
# 以dataframe形式存储
dataf <- data.frame(feed, Weight_Initial, Weight_Increment)
res <- HH::ancova(
    Weight_Increment ~ Weight_Initial + feed, # 公式
    data = dataf # 数据
)
print(res)
print(summary(res))
print(anova(res))
# 保存工作空间
save.image("R9.RData")
