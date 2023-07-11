# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加载生成多元正态分布的包
library("MASS")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap15\\sourcecode")
# 设置随机数种子
set.seed(1)
# 样本量
samplesize <- 30
# 二维正态随机分布
dataf <- MASS::mvrnorm(
    n = samplesize, # 样本量
    mu = rep(0, 2), # 均值向量
    Sigma = matrix(
        c(1, 0.8, 0.8, 1), # 数据
        nrow = 2, # 行数
        byrow = TRUE # 按行排列
    ) # 协方差矩阵
)
# 将它转为dataframe
dataf <- as.data.frame(dataf)
# 列重命名
names(dataf) <- c("x1", "x2")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 散点图
plot(
    x1 ~ x2, # 公式
    data = dataf, # 数据集
    xlab = "x1", # 横轴标签
    ylab = "x2", # 纵轴标签
    bty = "n", # 不绘制边框
    main = "x1与x2的散点图" # 图形标题
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
