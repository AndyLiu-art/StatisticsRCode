# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# 样本量
samplesize <- 10
# 自变量
x <- seq(0, samplesize, by = 1)
# 二项分布
y1 <- dbinom(x, samplesize, 0.4)
y2 <- dbinom(x, samplesize, 0.6)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code8.pdf")
# 柱状图
barplot(
    rbind(y1, y2), # 数据
    beside = TRUE, # 柱子在旁边
    names.arg = x, # 柱子的标签名称
    horiz = FALSE # 垂直柱状图
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R8.RData")
