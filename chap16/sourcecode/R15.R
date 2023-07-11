# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code15.pdf")
# 直方图
hist(
    co2, # 数据
    breaks = 30, # 组数
    freq = FALSE, # 密度直方图
    density = 10, # 柱子上斜线的密集程度
    main = "二氧化碳含量的密度直方图"
)
# 添加线条
lines(
    density(co2), # 核密度估计曲线
    col = "purple" # 颜色
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R15.RData")
