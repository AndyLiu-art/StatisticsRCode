# 加载Bootstrap包
library("bootstrap")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# 重复抽样的次数
B <- 1000
# 每次抽样的大小
samplesize <- nrow(law)
# 存储结果的向量
r_lst <- NULL
for (i in 1:B) {
    # 抽样单位的索引
    index <- sample(1:samplesize, size = samplesize, replace = TRUE)
    # 重抽样的样本1
    LSAT <- law$LSAT[index]
    # 重抽样的样本2
    GPA <- law$GPA[index]
    # 计算相关系数
    r <- cor(LSAT, GPA)
    # 存储到向量中
    r_lst <- c(r_lst, r)
}
res <- mean(r_lst) - cor(law$LSAT, law$GPA)
print(res)
# 保存工作空间
save.image("R3.RData")
