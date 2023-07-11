# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap29\\sourcecode")
res <- lm(mpg ~ disp + factor(cyl), data = mtcars)
print(summary(res))
# 保存工作空间
save.image("R1.RData")
