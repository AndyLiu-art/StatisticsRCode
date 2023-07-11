# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap3\\sourcecode")
# 样本
x <- c(
    321, 266, 256, 388, 330, 329, 303, 334, 299, 221,
    365, 250, 258, 342, 343, 298, 238, 317, 354
)
y <- c(
    488, 598, 507, 428, 807, 342, 512, 350, 672, 589,
    665, 549, 451, 481, 514, 391, 366, 468
)
res <- mood.test(
    x = x, # 样本1
    y = y, # 样本2
    alternative = "two.sided" # 双边检验
)
print(res)
# 保存工作空间
save.image("R14.RData")
