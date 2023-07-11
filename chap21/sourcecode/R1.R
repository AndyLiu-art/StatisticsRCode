# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap21\\sourcecode")
# 定义函数
f <- function(x) {
    return(x^2 * sin(x) - x + 1)
}
res <- uniroot(
    f, # 函数
    interval = c(-10, 10) # 搜索范围
)
# 根
root <- res$root
print("函数的零点为：")
print(root)
# 保存工作空间
save.image("R1.RData")
