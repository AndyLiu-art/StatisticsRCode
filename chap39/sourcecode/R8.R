# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap39\\sourcecode")
# 写入剪切板数据
dataf <- write.table(tail(iris), "clipboard")
# 按下ctrl+V就可以得到数据了
# 保存工作空间
save.image("R8.RData")
