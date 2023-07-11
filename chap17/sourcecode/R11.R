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
# HoltWinter指数平滑
res <- HoltWinters(
    AirPassengers,
    seasonal = "multi" # 乘法模型
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code9.pdf")
# 在不同因素分解下的拟合值
plot(fitted(res), main = "三参数指数平滑对AirPassengers数据集因素分解下的预测")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R11.RData")
