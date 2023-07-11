# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap22\\sourcecode")
# 定义函数
f <- function(x) {
    return(x^2 - x + 3)
}
# 求积分
res <- integrate(
    f, # 被积函数
    1, # 积分下限
    2 # 积分上限
)
# 积分值
I <- res$value
print("定积分为：")
print(I)
# 保存工作空间
save.image("R1.RData")
