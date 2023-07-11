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
pdf("../codeimage/code1.pdf")
# 饼图
pie(
    tab, # 数据
    col = rainbow(length(x)), # 颜色
    density = 30, # 线条阴影
    radius = 1.05, # 饼的半径
    main = "水果数量的饼图",
    clockwise = TRUE, # 顺时针绘图
    edge = 200 # 切分圆周的多边形的数量，数字越大，圆越圆
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
