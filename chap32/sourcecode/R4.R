# 加载生存分析包
library("survival")
# 加在生存分析可视化包
library("survminer")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap32\\sourcecode")
# KM估计生存函数
km_fit <- survfit(
    Surv(time, status) ~ x, # 生存分析对象
    type = "kaplan-meier", # KM估计方法
    data = aml # 数据集
)
# 绘图
gg <- ggsurvplot(
    km_fit,
    conf.int = TRUE, # 绘制置信区间
    pval = FALSE, # 不显示log-rank检验的P值
    risk.table = FALSE, # 添加风险表
    risk.table.col = "strata", # 根据分层更改风险表颜色
    linetype = "strata", # 根据分层更改线型
    surv.median.line = "hv", # 同时显示垂直和水平参考线
    palette = c("#2E9FDF","#a3db59") # 定义颜色
)
print(gg[1])
# 保存文件
ggsave("../codeimage/code4.pdf")
print(gg[2])
# 保存工作空间
save.image("R4.RData")
