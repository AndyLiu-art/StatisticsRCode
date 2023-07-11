# 加载Bootstrap包
library("bootstrap")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# 每次抽样的大小
samplesize <- nrow(law)
# 存储结果的向量
r_lst <- NULL
for (i in 1:samplesize) {
    # 缺一抽样的样本1
    LSAT <- law$LSAT[-i]
    # 缺一抽样的样本2
    GPA <- law$GPA[-i]
    # 计算相关系数
    r <- cor(LSAT, GPA)
    # 存储到向量中
    r_lst <- c(r_lst, r)
}
res <- sqrt(var(r_lst) * (samplesize - 1)^2 / samplesize)
print(res)
# 保存工作空间
save.image("R5.RData")
