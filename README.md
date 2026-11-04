# DROP IF Orphan: Game Store Database

A relational database for a fictional chain of game stores that sells board games, dice, miniatures, trading cards and rulebooks, and rents gaming tables by the hour.

**17 tables · 8 stores · 13 business queries · 19 validation checks**

Built as a five-person team capstone (April 2026). This portfolio edition makes the project runnable: the schema, demo data and queries are in plain SQL files, the queries are debugged, and the results are documented.

Presentation site: https://rynetroy.github.io/game_store_database/

## What it shows

- A 17-table design with primary keys, foreign keys and junction tables.
- An entity-attribute-value (EAV) model for products with different properties, and the self-joins needed to query it.
- Time-overlap logic for table bookings and for pricing that applies only to peak hours.
- Window functions (`ROW_NUMBER`, `RANK`) for top-N and tie handling.
- Validation checks and a data quality report that surfaces problems the schema allows.

## Run it

Requires **MariaDB 10.11+** (tested on 10.11.14) or **MySQL 8.0+** (not separately tested). Open a terminal in the repository root:

```sh
git clone https://github.com/rynetroy/game_store_database.git
cd game_store_database
mariadb -u root -p
```

At the database prompt:

```sql
CREATE DATABASE game_store;
USE game_store;
SOURCE sql/01_schema.sql;
SOURCE sql/02_seed.sql;
SOURCE sql/03_views.sql;
SOURCE tests/validate.sql;
SOURCE run_reports.sql;
```

All 19 validation rows should say `PASS`. The scripts do not drop any database. `SOURCE` is a command-line client command; in a SQL editor, open and run each file in the same order.

Queries that depend on dates use a fixed snapshot, `SET @as_of = '2026-04-01';`, at the top of the file. Change it to `CURDATE()` for live results.

## Queries

| # | Business question | Author | Main SQL concepts |
| --- | --- | --- | --- |
| [01](queries/01_metal_32mm_miniatures.sql) | Average price of 32mm metal miniatures | Ronald | EAV self-join |
| [02](queries/02_top_board_game_customer.sql) | Top board game customer, last 6 months | Czanel | 6-table join, CTE, ties |
| [03](queries/03_large_tables_with_screen.sql) | Tables that seat 6+ and have a screen | Ronald | View over EAV features |
| [04](queries/04_book_three_tables.sql) | Can a group book 3 of those tables next Tuesday, and at what cost? | Team | Overlap check, `ROW_NUMBER` |
| [05](queries/05_busiest_rental_day.sql) | Busiest rental day last month, by table-hours | Troy | Date ranges, `RANK` |
| [06](queries/06_dice_sets_price_per_die.sql) | Dice sets of 7+, by price per die | Team | EAV filter, unit price |
| [07](queries/07_top_revenue_category.sql) | Top revenue category, last 12 months | Team | Multi-join aggregation |
| [08](queries/08_peak_pricing_cost.sql) | Cost of reservations overlapping peak hours | Troy | `GREATEST` / `LEAST` time overlap |
| [09](queries/09_rulebook_buyers_no_tables.sql) | Rulebook buyers who never booked a table | Team | `NOT EXISTS` |
| [10](queries/10_top_customers_top_categories.sql) | Top 3 customers and their top 3 categories | Sebastian | Nested ranking with window functions |
| [11](queries/11_unused_tables.sql) | Tables with no bookings in 30 days | Luka | `NOT EXISTS`, date window |
| [12](queries/12_products_per_category.sql) | Products per category | Czanel | `LEFT JOIN`, `GROUP BY` |
| [13](queries/13_game_night_table_search.sql) | Free tables for a 5-player game, given its playtime | Sebastian | Stock check, playtime from EAV |

Authors follow the team's original query file. Example result, query 04:

| Store | Tables free | Can book 3 | Cost, cheapest 3 for 6 hours |
| --- | --- | --- | --- |
| The Dragon's Hoard | 3 | Yes | $294.00 |
| The Critical Hit | 2 | No | |
| Mana Burn Games | 2 | No | |

See [sample results](docs/sample-results.md) for every query's output.

## Findings

From the demo data (see [findings](docs/findings.md) for detail and next steps):

- Board games earned 54.3% of product revenue.
- 17 of 26 rental tables had no bookings in the 30 days before the snapshot.
- Five days tied for "busiest day" in March; the original query silently picked one.
- Tuesday's peak-hour rule is a 5% discount, not a surcharge.
- The schema allows bookings outside store hours (18 of 35), reservations spread across several stores (6 of 24), and more guests than seats (4).

The demo data is small (30 customers, 60 sales), so these describe the demo store, not real buying patterns.

## Repository layout

```text
sql/                 Schema, demo data and one view
queries/             13 standalone business queries
tests/validate.sql   Integrity checks (all PASS)
tests/data_quality.sql  Known data issues, reported not failed
docs/                Schema notes, findings, changes, sample results, ERD source
original/            The team's original SQL files, unchanged
images/, index.html  Presentation site
run_reports.sql      Runs all 13 queries
```

## Team and credit

Team: Ronald, Czanel, Luka, Troy and Sebastian. The schema, demo data and original queries were team work; individual query authors are listed above. My own queries are 05 and 08.

This portfolio edition (file structure, bug fixes, validation, data quality checks and documentation) was done by Troy Dela Rosa with AI-assisted code review. Every change is listed in [changes](docs/changes.md), and the team's original files are in [`original/`](original).

Note: the presentation site (`index.html`) still shows the original query code.
