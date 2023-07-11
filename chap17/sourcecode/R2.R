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
print(res)
# 预测精度结果
res_acu <- accuracy(res)
print(res_acu)
# 保存工作空间
save.image("R2.RData")
