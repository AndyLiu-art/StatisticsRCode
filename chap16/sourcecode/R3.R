# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap16\\sourcecode")
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code3.pdf")
# 箱线图
boxplot(
    mpg ~ factor(cyl) + factor(gear), # 公式
    data = mtcars, # 数据
    main = "每加仑英里数关于气缸数和前进档数的箱线图"
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R3.RData")
