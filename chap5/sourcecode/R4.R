# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
x <- c(318, 910, 200, 409, 425, 502, 314, 1210, 1022, 1225)
y <- c(524, 1019, 638, 815, 913, 928, 605, 1516, 1219, 1624)
# 线性回归拟合
lmod <- lm(
    y ~ x # 默认有截距项
)
# 必须是dataframe格式
newx <- data.frame(
    x = c(415, 420, 510, 1000, 1250, 1300)
)
res_pred <- predict(
    lmod, # 模型
    newdata = newx, # 预测点
    interval = "prediction", # 预测区间
    level = 0.95 # 置信水平
)
print(res_pred)
# 保存工作空间
save.image("R4.RData")
