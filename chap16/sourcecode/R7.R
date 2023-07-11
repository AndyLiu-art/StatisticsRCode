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
samplesize <- 100
# 正态分布
x <- rnorm(samplesize)
# 日期
y <- seq(
    as.Date("2022/05/01", format = "%Y/%m/%d"),
    by = "day", # 间隔为天
    length.out = 100 # 长度
)
# 合并为dataframe
dataf <- data.frame(x, y)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code7.pdf")
# 柱状图
barplot(
    x ~ y, # 公式
    data = dataf, # 数据
    width = 0.2, # 柱子的宽度
    space = 0.05, # 柱子之间的距离
    names.arg = names(x), # 柱子的标签名称
    horiz = FALSE # 垂直柱状图
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R7.RData")
