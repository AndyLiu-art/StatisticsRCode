# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 加载ggplot2绘图包
library("ggplot2")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap19\\sourcecode")
# 生成数据
dataf <- data.frame(x = 1:3, y = 1:3)
# 字体
family <- c("sans", "serif", "mono")
# 文本内容
label <- c("刘德华", "LDH", "Andy刘")
# 指定数据，和横纵轴变量，以及几何对象
p <- ggplot(dataf, aes(x, y)) +
    geom_text(
        aes(
            label = label, # 文本标签
            family = family # 字体
        )
    )
# 保存文件
ggsave("../codeimage/code1.pdf")
# 保存工作空间
save.image("R1.RData")
