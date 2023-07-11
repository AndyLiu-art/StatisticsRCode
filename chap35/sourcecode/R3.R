# 加载ROC曲线包
library("ROCR")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("roc-example-1.csv")
print(head(dataf))
# 创建预测对象
pred <- ROCR::prediction(
    dataf$prob, # 预测的概率
    dataf$class # 真实类别
)
# 创建预测对象的表现
perf <- ROCR::performance(
    pred, # 预测对象
    "tpr", # Y轴的测度，真阳性率
    "fpr" # 假阳性率
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
# 绘制马赛克图
plot(perf, main = "ROC Curve")
lines(par()$usr[1:2], par()$usr[3:4])
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
