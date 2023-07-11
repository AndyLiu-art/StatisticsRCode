# 加载中文字体
library("showtext")
# 设置支持中文的字体微软雅黑
font_add("myfont", "C:/Windows/Fonts/SimHei.ttf")
# 自动选择字体
showtext_auto()
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap17\\sourcecode")
# HoltWinter简单指数平滑
res <- HoltWinters(co2)
print(res)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code6.pdf")
plot(res, main = "三参数指数平滑对co2数据集的拟合")
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R8.RData")
