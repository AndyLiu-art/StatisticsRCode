# 加载筛选变量的包
library("leaps")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 自变量
x <- mtcars[, c("disp", "hp", "drat", "wt", "qsec")]
# 因变量
y <- mtcars$mpg
res <- leaps::leaps(
    x = x, # 自变量
    y = y, # 因变量
    names = c("disp", "hp", "drat", "wt", "qsec"),
    method = "Cp" # 以Cp统计量作为选择标准
)
print("选择哪几个变量？")
print(res$which[which(res$Cp == min(res$Cp)), ])
print("变量选择的具体结果")
print(res)
# 保存工作空间
save.image("R7.RData")
