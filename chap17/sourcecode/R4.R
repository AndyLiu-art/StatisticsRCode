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
# 提取残差
resid <- residuals(res)
# 计算LB检验统计量和P值，做滞后60期
pvalue_lst <- NULL
for (i in 1:60) {
    res_test <- Box.test(resid, type = "Ljung-Box", lag = i)
    pvalue_lst <- c(pvalue_lst, res_test$p.value)
}
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 绘制子图
par(mfrow = c(2, 2))
# 残差的自相关图
acf(resid, main = "残差的自相关图")
# 残差的偏自相关图
pacf(resid, main = "残差的偏自相关图")
# 残差的序列图
plot(resid, main = "残差的时间序列线图")
# 残差的白噪声检验P值分布
plot(
    1:60,
    pvalue_lst,
    main = "白噪声检验P值分布",
    xlab = "滞后期数",
    ylab = "P值"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R4.RData")
