# 加载Bootstrap包
library("bootstrap")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap13\\sourcecode")
# 重复抽样的次数
B <- 2000
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
# 样本标准差
sd_value <- sd(r_lst)
print("相关系数的标准差估计值为：")
print(sd_value)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code1.pdf")
# 直方图
hist(r_lst)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R1.RData")
