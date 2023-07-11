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
samplesize <- 50
# 二项分布随机数，转为因子
x <- factor(
    rbinom(samplesize, 4, p = 0.7) # 数据
)
# 修改因子水平
levels(x) <- c("香蕉", "橘子", "苹果", "西瓜", "芒果")
# 生成频数分布表
tab <- table(x)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf", height = 8, width=7)
# 绘制子图
par(mfrow = c(2, 1))
# 柱状图
barplot(
    tab, # 数据
    width = 0.6, # 柱子的宽度
    space = 1, # 柱子之间的距离
    names.arg = names(tab), # 柱子的标签名称
    horiz = FALSE # 垂直柱状图
)
# 条形图
barplot(
    tab, # 数据
    width = 0.9, # 柱子的宽度
    space = 0.3, # 柱子之间的距离
    names.arg = names(tab), # 柱子的标签名称
    horiz = TRUE # 水平条形图
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R6.RData")
