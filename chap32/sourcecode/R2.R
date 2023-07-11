# 加载生存分析包
library("survival")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap32\\sourcecode")
# 构造生存分析的对象
Stime_obj <- Surv(aml$time, aml$status)
print(Stime_obj)
# KM估计生存函数
km_fit <- survfit(
    Surv(time, status) ~ x, # 生存分析对象
    type = "kaplan-meier", # KM估计方法
    data = aml # 数据集
)
# KM估计的生存函数查看
print(summary(km_fit))
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf")
plot(
    km_fit,
    conf.int = FALSE,
    xlab = "time until relapse (in weeks)",
    ylab = "proportion in remission",
    lab = c(10, 10, 7)
)
abline(h = 0) # Figure 2.3 is now complete.
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
