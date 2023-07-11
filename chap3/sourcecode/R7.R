# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 成功的个数
success <- c(23, 25)
# 总个数
total <- c(102, 135)
res <- prop.test(
    x = success, # 试验成功的次数
    n = total, # 实验总次数
    alternative = "two.sided" # 双边检验
)
print(res)
# 保存工作空间
save.image("R7.RData")
