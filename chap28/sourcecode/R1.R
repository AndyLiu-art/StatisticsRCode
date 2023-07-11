# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap28\\sourcecode")
# 设置随机数
set.seed(1)
# 设置样本量
samplesize <- 100
# 生成x
x <- rnorm(samplesize)
# 经验函数值
res <- ecdf(x)
print(res)
print("==============================")
print(summary(res))
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 绘制散点图
plot(
    res, # 经验分布函数之
    verticals = TRUE, # 阶梯形
    do.p = FALSE # 不绘制散点
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
