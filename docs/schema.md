# Schema

17 tables, defined in [`sql/01_schema.sql`](../sql/01_schema.sql). The diagram is in [`images/erd.png`](../images/erd.png), and the editable source is [`erd.drawio`](erd.drawio) (open it at diagrams.net).

![ERD](../images/erd.png)

## Tables by area

| Area | Tables | Notes |
| --- | --- | --- |
| Stores | `store_info`, `store_hours`, `employees` | Hours are stored per store and weekday (1 = Monday, 7 = Sunday) |
| Products | `categories`, `products`, `attributes`, `product_attributes`, `inventory` | Product details use an entity-attribute-value (EAV) design |
| Sales | `customers`, `transactions`, `transaction_records` | One transaction has one or more line items, each tied to a store's inventory row |
| Table rentals | `tables`, `features`, `table_features`, `pricing_rules`, `reservations`, `table_reservations` | One reservation can book several tables, each with its own time window |

## Design choices worth knowing

**Entity-attribute-value for products.** A board game has player counts and playtime; a miniature has scale and material; a dice set has a die count. Instead of one wide table with mostly empty columns, each product stores only the attributes it has, as rows in `product_attributes`. The cost is that filtering on two attributes needs the table joined to itself twice (queries 01 and 06).

**The same pattern for rental tables.** `table_features` stores seats, cupholders and screens as rows. The view `table_features_wide` turns them back into columns so queries 03, 04 and 13 can filter with plain `WHERE` clauses.

**Inventory is per store.** A sale line points to an inventory row, not a product, so every sale is tied to the store whose stock it came from.

## Rules the schema does not enforce

Primary keys, foreign keys and unique constraints are in place. The schema does not check that bookings fall within store hours, that guests fit the seats, or that one reservation's tables are in one store. [`tests/data_quality.sql`](../tests/data_quality.sql) shows how often that happens in the demo data.
