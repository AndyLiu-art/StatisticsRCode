# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap15\\sourcecode")
# 设置随机数种子
set.seed(1)
# 样本量
samplesize <- 50
# 二项分布随机数，转为因子
x <- factor(
    rbinom(samplesize, 4, p = 0.7) # 数据
)
# 修改因子水平
levels(x) <- c("香蕉", "橘子", "苹果", "西瓜", "芒果")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 散点图
plot(
    x, # 数据集
    xlab = "水果", # 横轴标签
    ylab = "数量(个)", # 纵轴标签
    bty = "n", # 不绘制边框
    main = "因子变量柱状图" # 图形标题
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
