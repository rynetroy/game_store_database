# Changes from the original

The team's original files are kept unchanged in [`original/`](../original) so every change can be compared.

## Load script

| Problem | Effect | Fix |
| --- | --- | --- |
| Missing semicolon after the `customers` INSERT | Customers, transactions, sale lines, reservations and bookings never loaded (5 of 17 tables empty) | Added the semicolon |
| Script started with `DROP DATABASE` | Running it deleted any existing database of that name | Removed; schema and data now load into a database you create |
| Schema, data and a view mixed in one file | Hard to review or reuse | Split into `sql/01_schema.sql`, `02_seed.sql`, `03_views.sql` |

## Queries

| Query | Problem in the original | Fix |
| --- | --- | --- |
| All date queries | `CURDATE()` made results depend on the day you ran them. By November 2026, Q2 and Q5 returned nothing | Fixed snapshot `@as_of = '2026-04-01'` |
| 01 | Hardcoded attribute IDs 14 and 8 | Matches attributes by name |
| 03, 04 | Hardcoded feature IDs | Uses the `table_features_wide` view |
| 04 | Checked one moment (10:00) instead of 12:00 to 18:00, and never calculated cost | Checks the full window, answers per store, calculates the cost of the cheapest 3 |
| 05 | `BETWEEN` included the 1st of the next month; `TIMESTAMPDIFF(HOUR)` dropped partial hours; `LIMIT 1` hid a 5-way tie | Exclusive month end, minutes / 60, `RANK()` to show ties |
| 06 | Labeled set price as "price per die" | Divides price by number of dice |
| 07 | Summed `transaction_total` once per line item, which overcounts multi-item sales (no effect on this data, where every sale has one line) | Revenue = quantity x price, net of returns |
| 08 | Long unrounded decimals; hard to check | Rounded to cents; shows rule, modifier and peak minutes |
| 09, 11 | `NOT IN` returns nothing if the subquery contains a NULL | `NOT EXISTS` |
| 10 | Asked for each customer's top 3 categories but returned all of them | `ROW_NUMBER()` keeps the top 3 |
| 11 | `>= DATE_SUB(...) AND CURDATE()` is not a range; `AND CURDATE()` is always true | Real 30-day window |
| 13 | Missing semicolon, so the file stopped running at this query; the view was created inside a query file | Semicolon added; view moved to `sql/03_views.sql`; stock check returns units in stock |

## Known limits that remain

- Query 08 matches pricing rules by weekday name, so holiday rules (Halloween, Christmas and others) are never applied.
- Query 08 checks the peak window on the booking's start date only. No booking in this data crosses midnight.
- The data quality issues in [findings](findings.md) are reported, not prevented.
