# 加载生存分析包
library("survival")
# 加载生存分析可视化包
library("survminer")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap32\\sourcecode")
# 拟合经验生存函数曲线
res <- survfit(
    Surv(time, status) ~ x, # 公式
    data = aml[aml$x == "Maintained", ] # 数据
)
gg <- ggsurvplot(
    res,
    conf.int = TRUE, # 绘制置信区间
    pval = FALSE, # 不显示log-rank检验的P值
    risk.table = FALSE, # 添加风险表
    risk.table.col = "strata", # 根据分层更改风险表颜色
    linetype = "strata", # 根据分层更改线型
    surv.median.line = "hv", # 同时显示垂直和水平参考线
    palette = "#2E9FDF" # 定义颜色
)
print(gg[1])
# 保存文件
ggsave("../codeimage/code3.pdf")
print(gg[2])
# 保存工作空间
save.image("R3.RData")
