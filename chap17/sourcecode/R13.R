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
# STL季节性分解
res <- stl(
    nottem, # 数据
    s.window = 7, # 基数且至少为7
    t.jump = 1
)
pred <- forecast::forecast(res, h = 10)
print(pred)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code11.pdf")
# 在不同因素分解下的拟合值
plot(pred, main = "使用LOESS对nottem数据集做预测")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R13.RData")
