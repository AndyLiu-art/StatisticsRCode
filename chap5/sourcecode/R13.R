# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 线性回归拟合
old_lmod <- lm(
    mpg ~ disp + hp + wt + qsec, # 默认有截距项
    data = mtcars
)
print(summary(old_lmod))
new_lmod1 <- update(old_lmod, . ~ . - disp)
print(summary(new_lmod1))
new_lmod2 <- update(new_lmod1, . ~ . - hp)
print(summary(new_lmod2))
# 保存工作空间
save.image("R13.RData")
