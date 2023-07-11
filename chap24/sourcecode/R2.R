# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap24\\sourcecode")
# 频数分布表
tab <- table(mtcars$cyl, mtcars$carb)
# 频率分布表
tab_freq <- prop.table(tab)
print("频数分布表如下：")
print(tab)
print("频率分布表如下：")
print(tab_freq)
# 保存工作空间
save.image("R2.RData")
