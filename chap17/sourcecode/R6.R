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
# 截取1973年以前的数据作为训练集
w1 <- window(time_dataf, end = c(1972, 12))
# 截取1973年及以后的数据作为测试集
w2 <- window(time_dataf, start = c(1973, 1))
# 自动选择的最优模型
res <- forecast::auto.arima(w1)
# 向前预测
predict_res <- forecast::forecast(res, h = 48)
print(predict_res)
# 在测试集上的预测精度
res_acu <- accuracy(predict_res, w2)
print(res_acu)
# 保存工作空间
save.image("R6.RData")
