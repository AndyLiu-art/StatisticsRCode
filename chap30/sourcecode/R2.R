# 加载分位数回归的包
library("quantreg")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap30\\sourcecode")
# 加载数据
data(engel)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
plot(foodexp ~ income, data = engel)
abline(rq(foodexp ~ income, tau = 0.5, data = engel), col = "blue")
abline(lm(foodexp ~ income, data = engel), col = "red", lty = 2)
taus <- c(0.05, 0.1, 0.25, 0.75, 0.9, 0.95)
for (i in 1:length(taus)) {
    abline(rq(foodexp ~ income, tau = taus[i], data = engel), col = "gray")
}
dev.off()
dev.off()
# 保存工作空间
save.image("R2.RData")
