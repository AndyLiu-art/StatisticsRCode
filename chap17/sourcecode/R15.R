# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加在时间序列预测包
library("forecast")
# 加载时间序列分布滞后模型的包
library("dynlm")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap17\\sourcecode")
# 加载数据集
data(nporg, package = "urca")
# 提取变量，并删除缺失值
w <- na.omit(nporg[, c(5, 8, 9, 10)])
# 将变量转为时间序列对象
tsw <- ts(w, start = 1909)
# 建立分布滞后模型
lag_mod <- dynlm::dynlm(
    cpi ~ L(ip, 3) + L(gnp.p, c(0, 3)) + L(wg.n, c(3, 4)) + time(tsw), # 公式
    data = tsw # 数据
)
print(summary(lag_mod))
# 保存工作空间
save.image("R15.RData")
