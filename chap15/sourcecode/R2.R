# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap15\\sourcecode")
# 样本量
samplesize <- 30
# 设置自变量取值
x <- seq(0, 10, by = 1)
# 几何分布的概率分布
y <- dgeom(x, p = 0.7)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 散点图
plot(
    y, # 数据集
    xlab = "X", # 横轴标签
    ylab = "概率值", # 纵轴标签
    bty = "n", # 不绘制边框
    type = "h", # 绘制“直方图”
    lwd = 2, # 线宽
    main = "几何分布概率值" # 图形标题
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
