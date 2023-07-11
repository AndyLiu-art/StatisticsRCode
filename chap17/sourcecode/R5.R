# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加载时间序列拟合预测包
library("forecast")
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
# 自动选择的最优模型
res <- forecast::auto.arima(time_dataf)
# 向前预测
predict_res <- forecast::forecast(res, h = 40)
print(predict_res)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf")
plot(predict_res, main = "ARIMA模型的预测")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R5.RData")
