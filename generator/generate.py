import csv
import random
import os
import sys

NUM_ROWS = 100

COLUMNS = ["ID_КОТИКА", "ЧАСЫ_СНА", "УРОВЕНЬ_ВРЕДНОСТИ", "ПОРОДА"]

def generate_row():
    return {
        "ID_КОТИКА": random.randint(1000, 9999),
        "ЧАСЫ_СНА": random.randint(8, 20),
        "УРОВЕНЬ_ВРЕДНОСТИ": random.randint(1, 10),
        "ПОРОДА": random.choice([
            "Мейн-кун",
            "Сфинкс",
            "Британец",
            "Сиамский",
            "Дворовый",
            "Персидский"
        ]),
    }

OUTPUT_DIR = sys.argv[1] if len(sys.argv) > 1 else "/data"
OUTPUT_FILE = os.path.join(OUTPUT_DIR, "data.csv")

os.makedirs(OUTPUT_DIR, exist_ok=True)

rows = [generate_row() for _ in range(NUM_ROWS)]

with open(OUTPUT_FILE, "w", newline="", encoding="utf-8") as f:
    writer = csv.DictWriter(f, fieldnames=COLUMNS)
    writer.writeheader()
    writer.writerows(rows)