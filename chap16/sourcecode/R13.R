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
pdf("../codeimage/code13.pdf")
# 散点连接图
plot(
    co2[50:80], # 数据
    type = "o", # 线图
    col = "green", # 线条颜色
    xlab = "时间", # 横轴标签
    ylab = "二氧化碳含量", # 纵轴标签
    bty = "n", # 不绘制边框
    main = "大气二氧化碳浓度时间序列线图"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R13.RData")
