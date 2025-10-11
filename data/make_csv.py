import pandas as pd


excel_file = r"data\test.xlsx"
sheets = pd.ExcelFile(excel_file).sheet_names

# 遍历每个工作表并保存为 CSV
for sheet in sheets:
    df = pd.read_excel(excel_file, sheet_name=sheet)
    df.to_csv(f"{sheet}.csv", index=False, encoding='utf-8-sig')

print("✅ 拆分完成！每个 sheet 已保存为独立 CSV 文件。")
