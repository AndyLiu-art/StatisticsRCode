# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap17\\sourcecode")
# 读取数据
dataf <- read.csv("month-milk-production-pounds-p.csv")
# 转为时间序列对象
time_dataf <- ts(
    dataf[, 2], # 数据
    start = c(1962, 1), # 起始日期
    frequency = 12 # 月份
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
plot(
    time_dataf, # 数据
    main = "澳大利亚1962年到1975年每头奶牛月平均产量"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
