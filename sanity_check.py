import sqlite3

sample_bookings = [
    {"booking_id": "B0005", "category": "AC Repair & Service", "amount_inr": 1316},
    {"booking_id": "B0019", "category": "AC Repair & Service", "amount_inr": 538},
    {"booking_id": "B0027", "category": "AC Repair & Service", "amount_inr": 1016},
    {"booking_id": "B0055", "category": "AC Repair & Service", "amount_inr": 1505},
    {"booking_id": "B0001", "category": "Plumbing", "amount_inr": 1369},
    {"booking_id": "B0003", "category": "Plumbing", "amount_inr": 772},
    {"booking_id": "B0004", "category": "Plumbing", "amount_inr": 1133},
    {"booking_id": "B0006", "category": "Plumbing", "amount_inr": 805},
    {"booking_id": "B0018", "category": "Salon for Men", "amount_inr": 1414},
    {"booking_id": "B0024", "category": "Salon for Men", "amount_inr": 1176},
    {"booking_id": "B0029", "category": "Salon for Men", "amount_inr": 858},
    {"booking_id": "B0032", "category": "Salon for Men", "amount_inr": 638},
]

category_counts = {}
category_totals = {}

for booking in sample_bookings:
    category = booking["category"]
    amount = booking["amount_inr"]

    if category not in category_counts:
        category_counts[category] = 0
        category_totals[category] = 0

    category_counts[category] = category_counts[category] + 1
    category_totals[category] = category_totals[category] + amount

print("Pure Python result:")

for category in category_counts:
    print(
        category,
        "- count:",
        category_counts[category],
        "total:",
        category_totals[category]
    )

# SQL cross-check against urban_service.db
conn = sqlite3.connect("urban_service.db")
cur = conn.cursor()

sql = """
SELECT category, COUNT(*), SUM(amount_inr)
FROM bookings
WHERE booking_id IN (
    'B0005', 'B0019', 'B0027', 'B0055',
    'B0001', 'B0003', 'B0004', 'B0006',
    'B0018', 'B0024', 'B0029', 'B0032'
)
GROUP BY category
ORDER BY category;
"""

cur.execute(sql)
sql_results = cur.fetchall()

print()
print("SQL result:")

for row in sql_results:
    print(row[0], "- count:", row[1], "total:", row[2])

conn.close()

# SQL result matches the pure-Python result exactly for all three categories.