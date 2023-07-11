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
pdf("../codeimage/code14.pdf")
# 散点连接图
plot(
    women$height, # 横轴变量
    women$weight, # 纵轴变量
    type = "b", # 连线散点图
    bty = "n", # 不绘制边框
    main = "身高体重散点图", # 主标题
    sub = "来自women数据集", # 副标题
    xlab = "身高", # X轴标签
    ylab = "体重", # Y轴标签
    col.main = "red", # 主标题的颜色
    col.sub = "yellow", # 副标题的颜色
    col.lab = "cyan", # 轴标签的颜色
    col.axis = "green", # 轴刻度标签的颜色
    cex.main = 1, # 主标题的大小
    cex.sub = 0.9, # 副标题的大小
    cex.lab = 0.7, # 轴标签的大小
    cex.axis = 1.5, # 轴刻度的大小
    font.main = 1, # 主标题字体
    font.sub = 2, # 副标题字体
    font.lab = 3, # 轴标签字体
    font.axis = 4, # 轴刻度字体
    fg = "pink", # 图形前景色
    bg = "gray", # 背景颜色，似乎没用，因为有fg参数
    lty = 3, # 线条样式
    lwd = 2, # 线条粗细
    pch = 3, # 散点样式
    col = "purple" # 线条散点颜色
)
# 回归拟合
lmod <- lm(weight ~ height, data = women)
# 回归方程直线
abline(lmod, col = "yellow")
# 文本标注
text(
    62, # 文本坐标X
    150, # 文本坐标Y
    "回归方程拟合线" # 文本
)
# 箭头
arrows(
    63, # 箭头起始位置的X
    148, # 箭头起始位置的Y
    67, # 箭头结束位置的X
    145 # 箭头结束位置的Y
)
# 图例
legend(
    "topleft", # 图例的位置，也可以是x, y坐标
    legend = c("回归方程拟合线", "样本散点连线"), # 图例内容
    lty = c(1, 3), # 线条样式
    col = c("yellow", "purple") # 线条颜色
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R14.RData")
