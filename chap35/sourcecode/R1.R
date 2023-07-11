# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("college-perf.csv")
# 转为因子
dataf$Perf <- ordered(dataf$Perf, levels = c("Low", "Medium", "High"))
dataf$Pred <- ordered(dataf$Pred, levels = c("Low", "Medium", "High"))
# 分类的混淆矩阵
tab <- table(dataf$Perf, dataf$Pred)
# 转为比例
tab_prop <- round(prop.table(tab, 1) * 100, 1)
print(tab)
print(tab_prop)
# 保存工作空间
save.image("R1.RData")
