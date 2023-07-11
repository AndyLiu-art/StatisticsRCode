# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap37\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code5.pdf")
# 生成数据
my_variable <- rnorm(2000, 0, 10)
# 绘制hist图形，返回hist对象，并不会显示图形
my_hist <- hist(my_variable, breaks = 40, plot = FALSE)
# 着色
my_color <- ifelse(
    my_hist$breaks < -10,
    rgb(0.2, 0.8, 0.5, 0.5),
    ifelse(
        my_hist$breaks >= 10,
        "purple",
        rgb(0.2, 0.2, 0.2, 0.2)
    )
)
# 绘图
plot(
    my_hist,
    col = my_color, border = FALSE,
    main = "", xlab = "value of the variable",
    xlim = c(-40, 40)
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R5.RData")
