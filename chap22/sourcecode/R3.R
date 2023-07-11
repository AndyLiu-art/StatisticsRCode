# 加载求重积分的包
library("pracma")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap22\\sourcecode")
# 定义函数
f <- function(x, y, z) {
    return(x * y * z)
}
# 求积分
res <- pracma::triplequad(
    f, # 被积函数
    0, # x积分下限
    1, # x积分上限
    0, # y积分下限
    2, # y积分上限
    0, # z积分下限
    3 # z积分上限
)
print("定积分为：")
print(res)
# 保存工作空间
save.image("R3.RData")
