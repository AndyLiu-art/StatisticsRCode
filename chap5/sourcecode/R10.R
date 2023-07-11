# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
# 样本
y <- c(
    162, 120, 223, 131, 67, 169, 81, 192, 116, 55,
    252, 232, 144, 103, 212
)
x1 <- c(
    274, 180, 375, 205, 86, 265, 98, 330, 195, 53,
    430, 372, 236, 157, 370
)
x2 <- c(
    2450, 3250, 3802, 2838, 2347, 3782, 3008, 2450,
    2137, 2560, 4020, 4427, 2660, 2088, 2605
)
# 合并为dataframe
sales <- data.frame(y, x1, x2)
# 线性回归拟合
lmod <- lm(
    y ~ x1 + x2, # 默认有截距项
    data = sales
)
# 残差
resid_value <- residuals(lmod)
# 标准差残差
resid_standard_value <- rstandard(lmod)
# 学生化残差
resid_student_value <- rstudent(lmod)
print("回归模型的残差为：")
print(resid_value)
print("回归模型的标准化残差为：")
print(resid_standard_value)
print("回归模型的学生化残差为：")
print(resid_student_value)
# 保存工作空间
save.image("R10.RData")
