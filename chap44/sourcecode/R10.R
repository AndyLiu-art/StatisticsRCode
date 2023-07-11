# 加载带有惩罚项的广义线性模型
library("glmnet")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap44\\sourcecode")
# 生成数据
set.seed(1010)
x <- matrix(rnorm(100 * 20), 100, 20)
y <- sample(1:4, 100, replace = TRUE)
fit <- glmnet(x, y, family = "multinomial")
fita <- glmnet(x, y, family = "multinomial", type.multinomial = "grouped")
dev.new()
pdf("../codeimage/code6.pdf")
par(mfrow = c(1, 2))
plot(fit)
title("Multinomial Family", line = 2.5)
plot(fita)
title("Multinomial Family type=grouped", line = 2.5)
dev.off()
dev.off()
# 保存工作空间
save.image("R10.RData")
