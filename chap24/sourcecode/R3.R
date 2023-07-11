# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap24\\sourcecode")
# 频数分布表
tab1 <- table(mtcars$cyl, mtcars$carb, mtcars$gear)
tab2 <- ftable(mtcars$cyl, mtcars$carb, mtcars$gear)
# 频率分布表
tab_freq1 <- prop.table(tab1)
tab_freq2 <- prop.table(tab2)
print("频数分布表如下：")
print(tab1)
print(tab2)
print("频率分布表如下：")
print(tab_freq1)
print(tab_freq2)
# 保存工作空间
save.image("R3.RData")
