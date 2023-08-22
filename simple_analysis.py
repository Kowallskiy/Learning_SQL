import pandas as pd

africa_path = 'Data_Africa.csv'
africa_data = pd.read_csv(africa_path)

print(africa_data.dtypes)
print(africa_data.columns)
