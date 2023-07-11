# 加载生存分析包
library("survival")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap32\\sourcecode")
# 拟合经验生存函数曲线
res <- survfit(
    Surv(time, status) ~ x, # 公式
    data = aml[aml$x == "Maintained", ] # 数据
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
plot(
    res,
    conf.int = TRUE,
    xlab = "time until relapse (in weeks)",
    ylab = "proportion",
    lab = c(10, 10, 7)
)
abline(h = 0)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
