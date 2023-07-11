# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# 设置随机数种子
set.seed(1)
# 样本量
samplesize <- 30
# 正态分布
x <- rnorm(samplesize, sd = 2)
# 指数分布
y <- rexp(samplesize)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code9.pdf", width = 8)
par(mfrow = c(1, 2))
# QQ正态图
qqnorm(x)
qqline(x)
qqnorm(y)
qqline(y)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R9.RData")
