# HelmholtzPDE
This repository is to keep our code for solving the Helmholtz PDE.
## 子任务1：深度学习方法求解亥姆霍兹方程正问题

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

## 子任务2：亥姆霍兹方程高波数快速求解

针对 **子任务1** 中波数 $k$，开发适用高波数求解的高效算法，如求解 $k = 100, 500, 1000$ 下的解 $u(x, y)$。
