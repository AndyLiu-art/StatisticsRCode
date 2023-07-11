# 加载分位数回归的包
library("quantreg")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap30\\sourcecode")
# 加载数据
data(engel)
# 分位数回归
res <- quantreg::rq(
    foodexp ~ income, # 公式
    data = engel, # 数据集
    tau = 0.5 # 分位点
)
# se的取值可以是iid,boot,ker,rank
print(summary(res, se = "nid"))
print("回归系数")
print(coef(res))
# 保存工作空间
save.image("R1.RData")
