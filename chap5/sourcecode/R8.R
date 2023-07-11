# 加载筛选变量的包
library("leaps")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
res <- leaps::regsubsets(
    mpg ~ disp + hp + drat + wt + qsec, # 公式
    data = mtcars, # 数据集
    method = "exhaustive" # 以Cp统计量作为选择标准
)
res_out <- summary(res)
print("变量选择的具体结果")
print(res_out)
print("回归模型汇总：")
print(res_out$which)
print("回归模型的R方")
print(res_out$rsq)
print("回归模型的调整的R方")
print(res_out$adjr2)
print("回归模型的bic")
print(res_out$bic)
print("回归模型的Cp")
print(res_out$cp)
# 保存工作空间
save.image("R8.RData")
