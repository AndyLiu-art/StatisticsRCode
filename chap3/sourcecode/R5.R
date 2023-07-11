# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 待检验的数据
x <- c(20.5, 18.8, 19.8, 20.9, 21.5, 19.5, 21.0, 21.2)
y <- c(17.7, 20.3, 20.0, 18.8, 19.0, 20.1, 20.0, 19.1)
res <- t.test(
    x = x, # 样本
    y = y, # 样本
    paired = TRUE, # 配对样本
    alternative = "two.sided" # 双边检验
)
print(res)
# 保存工作空间
save.image("R5.RData")
