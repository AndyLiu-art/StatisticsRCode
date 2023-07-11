# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap5\\sourcecode")
res <- cor.test(
    x = women$height, # 样本
    y = women$weight, # 样本
    method = "pearson", # 计算Peason相关系数
    alternative = "two.sided", # 双边检验
    exact = TRUE # 精确分布
)
print(res)
# 保存工作空间
save.image("R1.RData")
