## AI4S赛题

### 子任务1：深度学习方法求解亥姆霍兹方程正问题

亥姆霍兹（Helmholtz）方程是一个描述电磁波的椭圆偏微分方程，经常出现在物理学中的电磁辐射、地震学、声学研究等领域，因此求解 Helmholtz 方程是非常重要的。考虑对如下 Helmholtz 方程进行求解：

$$
\begin{cases}
-\Delta u(x, y) - k^2 u(x, y) = q(x, y), & (x, y) \in \Omega := [-1,1] \times [-1,1], \\
u(x, y) = 0, & (x, y) \in \partial \Omega,
\end{cases}
\tag{1}
$$

其中 $\Delta$ 为拉普拉斯算子，**源项** $q(x, y)$ 为：

$$
q(x, y) = -(a_1 \pi)^2 \sin(a_1 \pi x)\sin(a_2 \pi y)
          - (a_2 \pi)^2 \sin(a_1 \pi x)\sin(a_2 \pi y)
          - k^2 \sin(a_1 \pi x)\sin(a_2 \pi y).
$$

在这个子任务中，对 $a_1 = 1, a_2 = 3, k = 4$，参赛者需要设计和实现深度学习方法对 Helmholtz 方程（1）求解 $u(x, y)$。
> 显然真解为 $u^*(x, y) = \sin(\pi x) \sin(3 \pi y)$.

### 子任务2：亥姆霍兹方程高波数快速求解

针对 **子任务1** 中波数 $k$，开发适用高波数求解的高效算法，如求解 $k = 100, 500, 1000$ 下的解 $u(x, y)$。

### 子任务 3：PINN 求解泊松方程参数识别反问题

泊松（Poisson）方程是一个常见于静电学、机械工程和理论物理的偏微分方程。  
考虑如下 Poisson 方程：

$$
\begin{cases}
-\nabla \cdot (k(x,y) \nabla u(x,y)) = f(x,y), & (x,y) \in \Omega := [-1,1] \times [-1,1], \\
u(x,y) = 0, & (x,y) \in \partial \Omega,
\end{cases}
\tag{2}
$$

其中 $u(x,y)$ 分别是待求解的方程数值解和待识别的参数 $k(x,y)$。  
源项 $f(x,y)$ 为：

$$
f(x,y)= \frac{\pi^2}{2}(1+x^2+y^2) \sin\left( \frac{\pi}{2} x \right) \cos\left( \frac{\pi}{2}y \right) - \pi x \cos\left( \frac{\pi}{2} x \right) \cos\left( \frac{\pi}{2} y \right) + \pi y \sin\left( \frac{\pi}{2} x \right) \sin\left( \frac{\pi}{2} y \right)
$$

在这个子任务中，参赛者需要设计和实现深度学习方法，对 Poisson 方程（2）在给定源项  
$f(x,y)$ 的表达式和方程解 $u(x,y)$ 的 200 个采样数据条件下，识别参数 $k(x,y)$。

### 数据来源

本题训练和测试数据由参赛者自行生成，主办方提供用于检验模型的数据。

训练和测试数据：对子任务1和任务2，参赛者可根据自身模型训练要求由方程（1）生成相应训练和测试数据。对子任务3，主办方提供方程（2）解的200个采样数据（附件中名为“子任务2数据.xlsx”）进行模型训练和测试。

检验数据：附件中名为“test.xlsx”的Excel文件中包含两张表，每张表分别提供了对应于两个子任务的200组坐标数据 $(x_i,y_i)$ ，需由参赛者利用所生成的模型预测对应这些坐标数据的解 $u(x_i,y_i)$（子任务1和2）和参数 $k(x_i,y_i)$（子任务3），并填写在excel文件对应表格位置中.

数据详情及文件下载链接：[http://aisccc.cn/database/data-details?id=195](http://aisccc.cn/database/data-details?id=195)

### 评价标准

本赛题将根据以下评价标准对参赛者提交内容进行评估打分：
1. 数据生成质量：考察训练和测试数据的生成策略及其合理性。
2. 预测准确性：考察模型在数据预测的准确性，比赛过程中将提供验证数据，参与者需提交预测结果，其准确性将纳入评分。
3. 计算效率：考察模型的训练和预测速度，并考虑其是否能推广到更复杂情形。
4. 可解释性：模型和代码的透明度和可理解性也是我们评价的重要因素。应在说明文档中清晰地解释模型及其预测过程，并注释代码增加代码可读性。
5. 创新性：我们鼓励模型和算法设计等方面的创新思路和方法。


赛题讨论小组：[http://aisccc.cn/task/task-details?id=179](http://aisccc.cn/task/task-details?id=179)  
培训回放：[http://aisccc.cn/course/course-details?id=144](http://aisccc.cn/course/course-details?id=144)

