# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加在时间序列预测包
library("forecast")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap17\\sourcecode")
# 加载数据集
data(nporg, package = "urca")
# 提取变量，并删除缺失值
w <- na.omit(nporg[, c(5, 8, 9, 10)])
# 将变量转为时间序列对象
tsw <- ts(w, start = 1909)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code12.pdf")
# 在不同因素分解下的拟合值
plot(tsw, main = "美国经济序列中部分变量的时间序列线图")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R14.RData")
