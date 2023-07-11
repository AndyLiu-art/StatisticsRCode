# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap23\\sourcecode")
# 定义函数
f <- expression(y * sin(x) + x * cos(y))
# 一阶导数
diffone <- deriv(f, c("x", "y"), func = TRUE)
print("求导结果：")
print(diffone)
print("原函数和一阶导函数在x=1处的函数值为：")
print(diffone(1, 1))
# 保存工作空间
save.image("R2.RData")
