# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap4\\sourcecode")
# 以dataframe形式存储
dataf <- data.frame(
    x = c(
        0.31, 0.45, 0.46, 0.43, 0.82, 1.10, 0.88, 0.72, 0.43, 0.45,
        0.63, 0.76, 0.45, 0.71, 0.66, 0.62, 0.38, 0.29, 0.40, 0.23,
        0.92, 0.61, 0.49, 1.24, 0.44, 0.35, 0.31, 0.40, 0.56, 1.02,
        0.71, 0.38, 0.22, 0.21, 0.18, 0.23, 0.30, 0.37, 0.38, 0.29,
        0.23, 0.25, 0.24, 0.22, 0.30, 0.36, 0.31, 0.33
    ),
    C1 = gl(3, 16, 48, labels = c("I", "II", "III")),
    C2 = gl(4, 4, 48, labels = c("A", "B", "C", "D"))
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf", width = 10)
# 绘制两个子图
par(mfrow = c(1, 2))
# 箱线图
plot(x ~ C1 + C2, data = dataf)
# 关闭图形
dev.off()
# 关闭文件
dev.off()

# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf", width = 10)
# 交互作用图
with(
    dataf, # 数据集
    interaction.plot(
        C1, # 因子变量
        C2, # 跟踪变脸
        x, # 响应变量
        fun = mean, # 以平均值聚合
        trace.label = "C2" # 跟踪变量的列名
    )
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R11.RData")
