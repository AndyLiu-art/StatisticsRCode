# 加载决策树
library("rpart")
library("rpart.plot")
# 加载分类回归训练集包
library("caret")
# 设置工作路径
setwd("D:\\softwares\\applied statistics\\rcodelearning\\chap35\\sourcecode")
# 读取数据
dataf <- read.csv("banknote-authentication.csv")
print(head(dataf))
# 划分数据集
set.seed(10)
train_idx <- caret::createDataPartition(
    dataf$class, # 划分变量
    p = 0.7, # 训练集比例
    list = FALSE
)
# 构建分类树模型
mod <- rpart::rpart(
    class ~ ., # 公式
    data = dataf, # 数据
    subset = train_idx, # 子集
    method = "class", # 分类
    control = rpart::rpart.control(
        minsplit = 20, # 至少需要20个样本才能划分节点
        cp = 0.01 # 复杂度
    )
)
# 查看Cp
print(mod$cptable)
# 选择xerror小于等于最小的xerror与最小的xstd之和的cp
cp_opt <- mod$cptable[, "xerror"] <= (min(mod$cptable[, "xerror"])
+ min(mod$cptable[, "xstd"]))
print(cp_opt)
# 剪枝，根据CP复杂度
mod_pruned <- rpart::prune(
    mod, # 模型
    mod$cptable[6, "CP"] # 选择合适的CP
)
# 开始绘图
dev.new()
# 保存文件
pdf("../codeimage/code4.pdf")
# 创建树图
tree <- rpart.plot::prp(
    mod_pruned, # 模型
    type = 2, # 二分类的树
    extra = 104, # 显示节点中样本量相对于整个样本量的比例
    nn = TRUE, # 显示节点编号，根节点为1，第n个节点的子节点编号为2n和2n+1
    fallen.leaves = TRUE, # 显示所有的叶节点
    faclen = 4, # 分类名最大长度
    varlen = 8, # 缩减变量名
    shadow.col = "gray" # 节点阴影的颜色
)
# 关闭图形
dev.off()
# 关闭文件
dev.off()
# 保存工作空间
save.image("R5.RData")
