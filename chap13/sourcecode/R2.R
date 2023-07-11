# 加载Bootstrap包
library("bootstrap")
# 加载做Bootstrap的包
library("boot")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# 重复抽样的次数
B <- 1000
# 每次抽样的大小
samplesize <- nrow(law)
r <- function(dataf, i) {
    return(
        cor(dataf[i, 1], dataf[i, 2])
    )
}
res <- boot::boot(law, statistic = r, R = B, stype = "i")
print(res)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code2.pdf", width = 8, height = 8)
# 直方图和正态QQ图
plot(res)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R2.RData")
