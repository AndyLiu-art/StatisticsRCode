# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap20\\sourcecode")
# 定义目标函数
fobj <- function(x) {
    return(x^3 - x - 1)
}
# 求解最小值
res1 <- optimize(
    fobj, # 目标函数
    interval = c(-2, 2), # 搜索范围
    maximum = FALSE # 最小值
)
# 求解最大值
res2 <- optimize(
    fobj, # 目标函数
    interval = c(-2, 2), # 搜索范围
    maximum = TRUE # 最大值
)
print("最小值点为：")
print(res1$minimum)
print("最小值为")
print(res1$objective)
print("最大值点为：")
print(res2$maximum)
print("最大值为")
print(res2$objective)
# 保存工作空间
save.image("R3.RData")
