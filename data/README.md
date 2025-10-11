# 📊 数据说明（2025 AI4S PDE）

本目录存放本题所需的训练、测试与验证数据，以及用于格式转换的辅助脚本。

---

## 🧩 数据来源

本题训练和测试数据由参赛者自行生成，主办方仅提供用于**检验模型**的数据。

- **训练与测试数据**  
  参赛者可根据自身模型训练需求，由主办方给定方程生成相应的训练与测试数据。  
  对于子任务 3，主办方直接提供方程解析的 200 组采样数据。  
  示例文件：  
  - `子任务3数据.xlsx` → 转换为 `task3_data.csv`

- **验证数据（test.xlsx）**  
  文件中包含 **两个工作表**，分别对应：
  - 子任务 1：解 \( u(x_i, y_i) \)
  - 子任务 3：参数 \( k(x_i, y_i) \)

  参赛者需将模型预测结果填入对应坐标位置。  
  示例转换文件：
  - `test.xlsx` → `task1_test.csv`, `task3_test.csv`

数据详情可参考主办方数据库：[https://aisccc.cn/database/data-details?id=195](https://aisccc.cn/database/data-details?id=195)

---

## 📂 文件结构

```bash
data/
├── make_csv.py           # Excel 转 CSV 脚本
├── task1_test.csv        # 子任务1 验证数据
├── task3_data.csv        # 子任务3 训练数据
├── task3_test.csv        # 子任务3 验证数据
├── test.xlsx             # 官方提供的验证数据（含两个 sheet）
├── 子任务3数据.xlsx       # 官方提供的子任务3原始数据
└── README.md             # 当前说明文件

