# Findings

All numbers come from the queries in this repository, run against the demo data with a snapshot date of 2026-04-01. The demo data is small (30 customers, 60 sales between 2026-02-01 and 2026-03-16, 24 reservations), so these findings describe the demo store, not a real business. Each finding follows the same pattern: what the data shows, what it means, and what to do next.

## Business findings

### 1. Board games carry over half of product revenue

- **What:** Board games earned $1,309.89, or 54.3% of product revenue. Rulebooks were next at 15.1%, and miniatures were last at 6.6% (query 07, plus a category breakdown run on the same data).
- **So what:** Revenue depends on one category. A slow board game season would hit total sales harder than a slow season for any other category.
- **Next:** Track board game sell-through separately, and test bundles that pair a board game with a lower-selling category.

### 2. Most rental tables sat unused in March

- **What:** 17 of 26 tables (65%) had no bookings in the 30 days before 2026-04-01 (query 11). Only 9 tables were booked at all.
- **So what:** Most of the table rental capacity earned nothing that month. Stores 5, 6 and 7 have one table each, and store 8 has none.
- **Next:** Compare booked hours to open hours per store before adding more tables, and consider promotions on weekday afternoons.

### 3. There is no single "busiest day"

- **What:** Five days in March tied at 6 table-hours each (query 05). The original query used `LIMIT 1`, so it returned one of them without saying the others tied.
- **So what:** Staffing decisions based on "the busiest day" would rest on an arbitrary pick.
- **Next:** Report ties, and look at busy weekdays or hours across several weeks instead of one top day.

### 4. Only one store can host a large group next Tuesday

- **What:** For 12:00 to 18:00 on Tuesday 2026-04-07, only The Dragon's Hoard (store 1) has 3 free tables that seat 6+ and have a screen. The cheapest 3 cost $294 for the six hours. Stores 2 and 3 have 2 each (query 04).
- **So what:** Large group bookings depend on store 1's inventory of big tables.
- **Next:** Check how often group requests exceed what one store can seat.

### 5. Tuesday "peak" pricing is a discount

- **What:** The Tuesday pricing rule has a modifier of 0.95, so evening bookings cost less during "peak" hours. Reservation 3 (two $15 tables, 6 peak table-hours) cost $85.50 instead of $90 (query 08).
- **So what:** Either Tuesday is meant as a promotion, or the rule was entered wrong.
- **Next:** Confirm the intent, and rename the column or rule if it is a discount.

### 6. Price per die changes which sets look expensive

- **What:** Ranked by set price, the 12-die Frost Blue set was 7th of 10. Ranked by price per die, it is the cheapest at $1.00 per die (query 06).
- **So what:** The original query labeled set price as "price per die," which would mislead a pricing review.
- **Next:** Use unit price when comparing sets of different sizes.

## Data quality findings

These come from [`tests/data_quality.sql`](../tests/data_quality.sql). The schema allows all of them, which is the real lesson: the design stores data correctly but does not stop bad bookings.

| Issue | Rows | Example |
| --- | --- | --- |
| Table bookings outside store opening hours | 18 of 35 | Weeknight bookings ending at 22:00 when stores close at 21:00 |
| Reservations with tables in more than one store | 6 of 24 | Reservation 15 books tables in Orlando, Denver and Chicago at once |
| Reservations with more guests than seats | 4 | Reservation 9: 10 guests on a table that seats 7 |
| `num_tables` does not match bookings | 1 | Reservation 15 says 2 tables but books 3 |
| Reservation paid by another customer's transaction | 7 of 8 paid | Reservation 3 (customer 2) links to customer 4's sale |
| Sale lines rung up by staff from another store | 34 of 60 | Employee and inventory belong to different stores |
| Stores with no rental tables | 1 | Store 8 (Hex & Meeple) |

**Next:** Add rules so the database rejects these on insert: a trigger that checks bookings against store hours and seat capacity, a rule that all tables in one reservation share a store, and a check that a reservation's transaction belongs to the same customer.

## The larger CSV dataset

The team also produced a larger generated dataset (1,200 customers, 13,014 transactions). It loads into the same schema, but it is not used here because:

- Its `attributes` table has 7 of the 20 attributes the queries use, so queries 01 and 06 return nothing.
- 149 table bookings overlap another booking on the same table.
- 1,262 transactions have totals that do not match their line items.

Fixing those would make the findings above far more meaningful, since 60 sales is too few to show real patterns.
