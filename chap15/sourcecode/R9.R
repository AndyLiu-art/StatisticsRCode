# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap15\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code9.pdf")
tab <- table(mtcars$cyl, mtcars$vs)
# 设置列名
colnames(tab) <- c("V型", "直型")
# 散点图
plot(
    tab, # 数据集
    xlab = "气缸数", # 横轴标签
    ylab = "发动机", # 纵轴标签
    color = TRUE, # 添加颜色
    main = "二维列联表马赛克图" # 图形标题
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R9.RData")
