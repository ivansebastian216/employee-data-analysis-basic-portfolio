import pandas as pd
from sqlalchemy import create_engine

# =========================
# 1. FILE PATH
# =========================
file_path = "C:/..(Your path)../Employees_Data.xlsx"

# =========================
# 2. LOAD EXCEL (NO CLEANING)
# =========================
df = pd.read_excel(file_path)

print("Preview data:")
print(df.head())

print("\nData info:")
print(df.info())

# =========================
# 3. MYSQL CONNECTION
# =========================
username = "your_username"
password = "your_password"
host = "your_MySQL_ip"   # e.g. 192.168.1.10
port = "your =_port"
database = "your_database"

engine = create_engine(
    f"mysql+pymysql://{username}:{password}@{host}:{port}/{database}"
)

# =========================
# 4. TEST CONNECTION
# =========================
try:
    with engine.connect() as conn:
        print("\n✅ Connected to MySQL successfully!")
except Exception as e:
    print("\n❌ Connection failed:", e)
    exit()

# =========================
# 5. EXPORT TO MYSQL (RAW TABLE)
# =========================
table_name = "employees_raw"

try:
    df.to_sql(
        name=table_name,
        con=engine,
        if_exists="replace",   # ⚠️ replaces table if exists
        index=False
    )
    print(f"\n✅ Data successfully uploaded to table '{table_name}'")

except Exception as e:
    print("\n❌ Upload failed:", e)
