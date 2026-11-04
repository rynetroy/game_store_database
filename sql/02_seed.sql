-- DROP IF Orphan: demo data (fictional stores, staff and customers).
-- Load after 01_schema.sql.
-- Change from the original: added the missing semicolon after the customers INSERT,
-- which stopped customers, transactions and reservations from loading.

-- Store Info
INSERT INTO `store_info` (store_id, store_name, store_address, store_email, store_phone)
VALUES
(1, 'The Dragon\'s Hoard', '123 Paladin Way, Austin, TX', 'contact@dragonshoard.com', '5125550101'), -- original store
(2, 'The Critical Hit', '456 Paladin St, Seattle, WA', 'seattle@crit-hit.com', '2065550102'), -- original store
(3, 'Mana Burn Games', '789 Sorcerer Blvd, Boston, MA', 'boston@manaburn.com', '6175550103'), -- original store
(4, 'The Goblin Market', '101 Mischief Ln, Orlando, FL', 'orlando@goblinmarket.com', '4075550104'), -- original store
(5, 'Meeple Keep', '202 Ranger Rd, Denver, CO', 'denver@meeplekeep.com', '3035550105'), -- new store
(6, 'Roll Initiative', '88 Dice Ave, Phoenix, AZ', 'phoenix@rollinitiative.com', '6025550106'), -- new store
(7, 'Critical Success', '410 Quest Dr, Chicago, IL', 'chicago@criticalsuccess.com', '3125550107'), -- new store
(8, 'Hex & Meeple', '777 Tavern Ct, Portland, OR', 'portland@hexandmeeple.com', '5035550108'); -- new store

-- Store Hours (1 = Monday, 7 = Sunday)
INSERT INTO `store_hours` (store_id, days_of_week, opening_hours, closing_hours)
VALUES
(1, 1, '10:00:00', '21:00:00'), -- store 1
(1, 2, '10:00:00', '21:00:00'), -- store 1
(1, 3, '10:00:00', '21:00:00'), -- store 1
(1, 4, '10:00:00', '21:00:00'), -- store 1
(1, 5, '10:00:00', '21:00:00'), -- store 1
(1, 6, '11:00:00', '23:00:00'), -- store 1
(1, 7, '09:00:00', '18:00:00'), -- store 1
(2, 1, '10:00:00', '21:00:00'), -- store 2
(2, 2, '10:00:00', '21:00:00'), -- store 2
(2, 3, '10:00:00', '21:00:00'), -- store 2
(2, 4, '10:00:00', '21:00:00'), -- store 2
(2, 5, '10:00:00', '21:00:00'), -- store 2
(2, 6, '11:00:00', '23:00:00'), -- store 2
(2, 7, '09:00:00', '18:00:00'), -- store 2
(3, 1, '10:00:00', '21:00:00'), -- store 3
(3, 2, '10:00:00', '21:00:00'), -- store 3
(3, 3, '10:00:00', '21:00:00'), -- store 3
(3, 4, '10:00:00', '21:00:00'), -- store 3
(3, 5, '10:00:00', '21:00:00'), -- store 3
(3, 6, '11:00:00', '23:00:00'), -- store 3
(3, 7, '09:00:00', '18:00:00'), -- store 3
(4, 1, '10:00:00', '21:00:00'), -- store 4
(4, 2, '10:00:00', '21:00:00'), -- store 4
(4, 3, '10:00:00', '21:00:00'), -- store 4
(4, 4, '10:00:00', '21:00:00'), -- store 4
(4, 5, '10:00:00', '21:00:00'), -- store 4
(4, 6, '11:00:00', '23:00:00'), -- store 4
(4, 7, '09:00:00', '18:00:00'), -- store 4
(5, 1, '10:00:00', '21:00:00'), -- store 5
(5, 2, '10:00:00', '21:00:00'), -- store 5
(5, 3, '10:00:00', '21:00:00'), -- store 5
(5, 4, '10:00:00', '21:00:00'), -- store 5
(5, 5, '10:00:00', '21:00:00'), -- store 5
(5, 6, '11:00:00', '23:00:00'), -- store 5
(5, 7, '09:00:00', '18:00:00'), -- store 5
(6, 1, '10:00:00', '21:00:00'), -- store 6
(6, 2, '10:00:00', '21:00:00'), -- store 6
(6, 3, '10:00:00', '21:00:00'), -- store 6
(6, 4, '10:00:00', '21:00:00'), -- store 6
(6, 5, '10:00:00', '21:00:00'), -- store 6
(6, 6, '11:00:00', '23:00:00'), -- store 6
(6, 7, '09:00:00', '18:00:00'), -- store 6
(7, 1, '10:00:00', '21:00:00'), -- store 7
(7, 2, '10:00:00', '21:00:00'), -- store 7
(7, 3, '10:00:00', '21:00:00'), -- store 7
(7, 4, '10:00:00', '21:00:00'), -- store 7
(7, 5, '10:00:00', '21:00:00'), -- store 7
(7, 6, '11:00:00', '23:00:00'), -- store 7
(7, 7, '09:00:00', '18:00:00'), -- store 7
(8, 1, '10:00:00', '21:00:00'), -- store 8
(8, 2, '10:00:00', '21:00:00'), -- store 8
(8, 3, '10:00:00', '21:00:00'), -- store 8
(8, 4, '10:00:00', '21:00:00'), -- store 8
(8, 5, '10:00:00', '21:00:00'), -- store 8
(8, 6, '11:00:00', '23:00:00'), -- store 8
(8, 7, '09:00:00', '18:00:00'); -- store 8

-- Employees
INSERT INTO `employees` (employee_id, employee_name, employee_email, employee_phone, salary, hire_date, store_id, position)
VALUES
(1, 'Alice Smith', 'alice@dragonshoard.com', '5125551001', 18.50, '2023-01-15', 1, 'Manager'), -- store 1 manager
(2, 'Bob Jones', 'bob@dragonshoard.com', '5125551002', 15.00, '2023-02-01', 1, 'Clerk'), -- store 1 clerk
(3, 'Charlie Brown', 'charlie@dragonshoard.com', '5125551003', 15.00, '2023-03-10', 1, 'Clerk'), -- store 1 clerk
(4, 'Diana Prince', 'diana@dragonshoard.com', '5125551004', 16.50, '2023-05-20', 1, 'Shift Lead'), -- store 1 shift lead
(5, 'Edward Nigma', 'edward@dragonshoard.com', '5125551005', 14.00, '2023-06-01', 1, 'Junior Clerk'), -- store 1 junior clerk
(6, 'Frank Castle', 'frank@dragonshoard.com', '5125551006', 18.00, '2023-01-10', 2, 'Manager'), -- store 2 manager
(7, 'Grace Hopper', 'grace@dragonshoard.com', '5125551007', 16.00, '2023-02-15', 2, 'Shift Lead'), -- store 2 shift lead
(8, 'Henry Cavill', 'henry@dragonshoard.com', '5125551008', 15.00, '2023-03-01', 2, 'Clerk'), -- store 2 clerk
(9, 'Ivy Pepper', 'ivy@dragonshoard.com', '5125551009', 14.50, '2023-04-12', 2, 'Junior Clerk'), -- store 2 junior clerk
(10, 'Jack Sparrow', 'jack@dragonshoard.com', '5125551010', 18.25, '2023-01-18', 3, 'Manager'), -- store 3 manager
(11, 'Karen Page', 'karen@dragonshoard.com', '5125551011', 16.25, '2023-02-20', 3, 'Shift Lead'), -- store 3 shift lead
(12, 'Luke Cage', 'luke@dragonshoard.com', '5125551012', 15.25, '2023-03-25', 3, 'Clerk'), -- store 3 clerk
(13, 'Matt Murdock', 'matt@dragonshoard.com', '5125551013', 15.00, '2023-04-30', 3, 'Clerk'), -- store 3 clerk
(14, 'Nancy Drew', 'nancy@dragonshoard.com', '5125551014', 17.50, '2023-01-05', 4, 'Manager'), -- store 4 manager
(15, 'Oscar Isaac', 'oscar@dragonshoard.com', '5125551015', 16.00, '2023-02-10', 4, 'Shift Lead'), -- store 4 shift lead
(16, 'Peter Parker', 'peter@dragonshoard.com', '5125551016', 15.00, '2023-03-15', 4, 'Clerk'), -- store 4 clerk
(17, 'Quinn Fabray', 'quinn@dragonshoard.com', '5125551017', 14.25, '2023-04-20', 4, 'Junior Clerk'), -- store 4 junior clerk
(18, 'Riley Hart', 'riley@meeplekeep.com', '3035551018', 18.25, '2023-07-01', 5, 'Manager'), -- store 5 manager
(19, 'Morgan Vale', 'morgan@meeplekeep.com', '3035551019', 16.25, '2023-07-10', 5, 'Shift Lead'), -- store 5 shift lead
(20, 'Tessa Reed', 'tessa@meeplekeep.com', '3035551020', 15.25, '2023-07-21', 5, 'Clerk'), -- store 5 clerk
(21, 'Caleb Stone', 'caleb@meeplekeep.com', '3035551021', 14.50, '2023-08-02', 5, 'Junior Clerk'), -- store 5 junior clerk
(22, 'Nina Cross', 'nina@rollinitiative.com', '6025551022', 18.00, '2023-07-05', 6, 'Manager'), -- store 6 manager
(23, 'Owen Drake', 'owen@rollinitiative.com', '6025551023', 16.00, '2023-07-18', 6, 'Shift Lead'), -- store 6 shift lead
(24, 'Paige Turner', 'paige@rollinitiative.com', '6025551024', 15.00, '2023-08-03', 6, 'Clerk'), -- store 6 clerk
(25, 'Grant Hill', 'grant@rollinitiative.com', '6025551025', 14.50, '2023-08-19', 6, 'Junior Clerk'), -- store 6 junior clerk
(26, 'Hazel Frost', 'hazel@criticalsuccess.com', '3125551026', 18.50, '2023-07-12', 7, 'Manager'), -- store 7 manager
(27, 'Isaac Rowe', 'isaac@criticalsuccess.com', '3125551027', 16.25, '2023-07-25', 7, 'Shift Lead'), -- store 7 shift lead
(28, 'Jade Rowan', 'jade@criticalsuccess.com', '3125551028', 15.25, '2023-08-08', 7, 'Clerk'), -- store 7 clerk
(29, 'Kyle Mercer', 'kyle@criticalsuccess.com', '3125551029', 14.75, '2023-08-24', 7, 'Junior Clerk'), -- store 7 junior clerk
(30, 'Lena Brooks', 'lena@hexandmeeple.com', '5035551030', 18.25, '2023-07-15', 8, 'Manager'), -- store 8 manager
(31, 'Milo Quinn', 'milo@hexandmeeple.com', '5035551031', 16.00, '2023-07-29', 8, 'Shift Lead'), -- store 8 shift lead
(32, 'Nova Lane', 'nova@hexandmeeple.com', '5035551032', 15.00, '2023-08-11', 8, 'Clerk'), -- store 8 clerk
(33, 'Silas West', 'silas@hexandmeeple.com', '5035551033', 14.50, '2023-08-23', 8, 'Junior Clerk'), -- store 8 junior clerk
(34, 'Vera Moss', 'vera@hexandmeeple.com', '5035551034', 15.25, '2023-09-02', 8, 'Clerk'); -- store 8 clerk

-- Pricing Rules
INSERT INTO `pricing_rules` (pricing_rules_id, days_of_week, start_time, end_time, modifier, peak_hours)
VALUES
(1, 'Saturday', '18:00:00', '22:00:00', 1.50, '19:00:00'), -- Saturday pricing
(2, 'Sunday', '18:00:00', '22:00:00', 1.50, '19:00:00'), -- Sunday pricing
(3, 'Anniversary', '10:00:00', '22:00:00', 0.80, '19:00:00'), -- Anniversary pricing
(4, 'Halloween', '18:00:00', '22:00:00', 1.30, '19:00:00'), -- Halloween pricing
(5, 'Christmas', '10:00:00', '22:00:00', 1.25, '19:00:00'), -- Christmas pricing
(6, 'Valentine\'s', '13:00:00', '22:00:00', 1.20, '19:00:00'), -- Valentine's pricing
(7, 'St. Patrick\'s Day', '10:00:00', '22:00:00', 0.90, '19:00:00'), -- St. Patrick's Day pricing
(8, 'Monday', '18:00:00', '21:00:00', 1.10, '19:00:00'), -- Monday pricing
(9, 'Tuesday', '18:00:00', '21:00:00', 0.95, '19:00:00'), -- Tuesday pricing
(10, 'Wednesday', '18:00:00', '21:00:00', 1.15, '19:00:00'), -- Wednesday pricing
(11, 'Thursday', '18:00:00', '22:00:00', 1.20, '19:00:00'), -- Thursday pricing
(12, 'Friday', '18:00:00', '23:00:00', 1.35, '19:00:00'); -- Friday pricing

-- Features
INSERT INTO `features` (feature_id, feature_name, price_per_hour)
VALUES
(1, 'Capacity', 2.00), -- capacity
(2, 'Cupholder', 1.50), -- cupholder
(3, 'Number of Screens', 5.00); -- number of screens

-- Tables
INSERT INTO `tables` (table_id, table_price_per_hour, pricing_rules_id, store_id)
VALUES
(1, 10.00, NULL, 1), -- store 1 table
(2, 12.00, NULL, 1), -- store 1 table
(3, 15.00, NULL, 1), -- store 1 table
(4, 10.00, NULL, 2), -- store 2 table
(5, 12.00, NULL, 2), -- store 2 table
(6, 15.00, NULL, 2), -- store 2 table
(7, 10.00, NULL, 3), -- store 3 table
(8, 12.00, NULL, 3), -- store 3 table
(9, 15.00, NULL, 3), -- store 3 table
(10, 10.00, NULL, 4), -- store 4 table
(11, 12.00, NULL, 4), -- store 4 table
(12, 15.00, NULL, 4), -- store 4 table
(13, 20.00, NULL, 4), -- store 4 table
(14, 16.00, NULL, 1), -- store 1 table
(15, 18.00, NULL, 1), -- store 1 table
(16, 11.00, NULL, 2), -- store 2 table
(17, 13.00, NULL, 2), -- store 2 table
(18, 17.00, NULL, 2), -- store 2 table
(19, 11.00, NULL, 3), -- store 3 table
(20, 16.00, NULL, 3), -- store 3 table
(21, 14.00, NULL, 3), -- store 3 table
(22, 18.00, NULL, 4), -- store 4 table
(23, 12.00, NULL, 4), -- store 4 table
(24, 15.00, NULL, 5), -- store 5 table
(25, 13.00, NULL, 6), -- store 6 table
(26, 19.00, NULL, 7); -- store 7 table

-- Table Features
INSERT INTO `table_features` (table_feature_id, table_id, feature_id, value_numerical)
VALUES
(1, 1, 1, 3), -- table 1 feature 1
(2, 2, 1, 4), -- table 2 feature 1
(3, 2, 2, 2), -- table 2 feature 2
(4, 3, 1, 6), -- table 3 feature 1
(5, 3, 2, 1), -- table 3 feature 2
(6, 3, 3, 1), -- table 3 feature 3
(7, 4, 1, 3), -- table 4 feature 1
(8, 5, 1, 2), -- table 5 feature 1
(9, 5, 2, 2), -- table 5 feature 2
(10, 6, 1, 6), -- table 6 feature 1
(11, 6, 2, 2), -- table 6 feature 2
(12, 6, 3, 1), -- table 6 feature 3
(13, 7, 1, 4), -- table 7 feature 1
(14, 8, 1, 3), -- table 8 feature 1
(15, 8, 2, 2), -- table 8 feature 2
(16, 9, 1, 7), -- table 9 feature 1
(17, 9, 2, 4), -- table 9 feature 2
(18, 9, 3, 1), -- table 9 feature 3
(19, 10, 1, 2), -- table 10 feature 1
(20, 11, 1, 6), -- table 11 feature 1
(21, 11, 2, 2), -- table 11 feature 2
(22, 12, 1, 2), -- table 12 feature 1
(23, 12, 2, 2), -- table 12 feature 2
(24, 12, 3, 1), -- table 12 feature 3
(25, 13, 1, 2), -- table 13 feature 1
(26, 13, 2, 2), -- table 13 feature 2
(27, 13, 3, 3), -- table 13 feature 3
(28, 14, 1, 8), -- table 14 feature 1
(29, 14, 2, 4), -- table 14 feature 2
(30, 14, 3, 1), -- table 14 feature 3
(31, 15, 1, 6), -- table 15 feature 1
(32, 15, 2, 3), -- table 15 feature 2
(33, 15, 3, 2), -- table 15 feature 3
(34, 16, 1, 4), -- table 16 feature 1
(35, 16, 2, 2), -- table 16 feature 2
(36, 17, 1, 5), -- table 17 feature 1
(37, 17, 2, 2), -- table 17 feature 2
(38, 18, 1, 8), -- table 18 feature 1
(39, 18, 2, 4), -- table 18 feature 2
(40, 18, 3, 1), -- table 18 feature 3
(41, 19, 1, 4), -- table 19 feature 1
(42, 20, 1, 6), -- table 20 feature 1
(43, 20, 2, 2), -- table 20 feature 2
(44, 20, 3, 1), -- table 20 feature 3
(45, 21, 1, 5), -- table 21 feature 1
(46, 21, 2, 4), -- table 21 feature 2
(47, 22, 1, 8), -- table 22 feature 1
(48, 22, 2, 4), -- table 22 feature 2
(49, 22, 3, 2), -- table 22 feature 3
(50, 23, 1, 4), -- table 23 feature 1
(51, 23, 2, 2), -- table 23 feature 2
(52, 24, 1, 6), -- table 24 feature 1
(53, 24, 2, 3), -- table 24 feature 2
(54, 24, 3, 1), -- table 24 feature 3
(55, 25, 1, 5), -- table 25 feature 1
(56, 25, 2, 2), -- table 25 feature 2
(57, 26, 1, 10), -- table 26 feature 1
(58, 26, 2, 6), -- table 26 feature 2
(59, 26, 3, 2); -- table 26 feature 3

-- Categories
INSERT INTO `categories` (category_id, category_name)
VALUES
(1, 'Board Games'), -- board games
(2, 'Trading Cards'), -- trading cards
(3, 'Dice'), -- all dice sets
(4, 'Miniature'), -- miniatures
(5, 'Rulebook'); -- rulebooks

-- Products
INSERT INTO `products` (product_id, product_name, price, category_id)
VALUES
(1, 'Catan', 45.00, 1), -- category 1
(2, 'Betrayal at House on the Hill', 120.00, 1), -- category 1
(3, 'Magic Booster Pack', 4.99, 2), -- category 2
(4, 'Pokemon ETB', 49.99, 2), -- category 2
(5, 'D&D Player Handbook', 35.00, 5), -- category 5
(6, 'D12 Dice Set', 12.00, 3), -- category 3
(7, 'Dice Set D6', 9.00, 3), -- category 3
(8, 'Dice Set D8', 11.00, 3), -- category 3
(9, 'Dice Set D10', 13.00, 3), -- category 3
(10, 'Dice Set D20', 18.00, 3), -- category 3
(11, 'Miniature Knight', 15.00, 4), -- category 4
(12, 'Miniature Wizard', 15.00, 4), -- category 4
(13, 'Miniature Dragon', 25.00, 4), -- category 4
(14, 'Miniature Goblin', 10.00, 4), -- category 4
(15, 'Miniature Orc', 12.00, 4), -- category 4
(16, 'Ticket to Ride', 54.99, 1), -- category 1
(17, 'Gloomhaven: Jaws of the Lion', 59.99, 1), -- category 1
(18, 'Root', 69.99, 1), -- category 1
(19, 'Flesh and Blood Blitz Deck', 19.99, 2), -- category 2
(20, 'Yu-Gi-Oh Starter Deck', 14.99, 2), -- category 2
(21, 'Dice Set D6 Frost Blue', 12.00, 3), -- category 3
(22, 'Dice Set D8 Ember Red', 14.00, 3), -- category 3
(23, 'Dice Set D10 Shadow Steel', 16.00, 3), -- category 3
(24, 'Dice Set D12 Emerald Swirl', 15.00, 3), -- category 3
(25, 'Dice Set D20 Sunburst Gold', 24.00, 3), -- category 3
(26, 'Miniature Paladin', 18.00, 4), -- category 4
(27, 'Miniature Rogue', 16.00, 4), -- category 4
(28, 'Miniature Troll', 21.00, 4), -- category 4
(29, 'Pathfinder Core Rulebook', 44.99, 5), -- category 5
(30, 'Warhammer 40K Core Book', 65.00, 5); -- category 5

-- Attributes
INSERT INTO `attributes` (attribute_id, attribute_name)
VALUES
(1, 'Minimum Players'), -- attribute
(2, 'Maximum Players'), -- attribute
(3, 'Average Playtime (Min)'), -- attribute
(4, 'Minimum Age'), -- attribute
(5, 'Edition'), -- attribute
(6, 'Rarity'), -- attribute
(7, 'Language'), -- attribute
(8, 'Material'), -- attribute
(9, 'Number of Dices in Set'), -- attribute
(10, 'Sleeve Size'), -- attribute
(11, 'Width of Miniature (mm)'), -- attribute
(12, 'Height of Miniature (mm)'), -- attribute
(13, 'Depth of Miniature (mm)'), -- attribute
(14, 'Scale of Miniature (mm)'), -- attribute
(15, 'Weight of Miniature (g)'), -- attribute
(16, 'Publisher'), -- attribute
(17, 'Primary Colour'), -- attribute
(18, 'Secondary Colour'), -- attribute
(19, 'Page Count'), -- attribute
(20, 'Die Type'); -- attribute

-- Product Attributes
INSERT INTO `product_attributes` (product_id, attribute_id, value_numerical, value_categorical)
VALUES
(1, 1, 3, NULL), -- Catan minimum players 3
(1, 2, 4, NULL), -- Catan maximum players 4
(1, 3, 90, NULL), -- Catan average playtime 90
(1, 4, 10, NULL), -- Catan minimum age 10
(1, 5, NULL, 'Base Game'), -- Catan edition Base Game
(1, 16, NULL, 'Catan Studio'), -- Catan publisher Catan Studio

(2, 1, 3, NULL), -- Betrayal minimum players 3
(2, 2, 6, NULL), -- Betrayal maximum players 6
(2, 3, 120, NULL), -- Betrayal average playtime 120
(2, 4, 12, NULL), -- Betrayal minimum age 12
(2, 5, NULL, 'Third Edition'), -- Betrayal edition Third Edition
(2, 16, NULL, 'Avalon Hill'), -- Betrayal publisher Avalon Hill

(16, 1, 2, NULL), -- Ticket to Ride minimum players 2
(16, 2, 5, NULL), -- Ticket to Ride maximum players 5
(16, 3, 60, NULL), -- Ticket to Ride average playtime 60
(16, 4, 8, NULL), -- Ticket to Ride minimum age 8
(16, 5, NULL, 'Base Game'), -- Ticket to Ride edition Base Game
(16, 16, NULL, 'Days of Wonder'), -- Ticket to Ride publisher Days of Wonder

(17, 1, 1, NULL), -- Gloomhaven JOTL minimum players 1
(17, 2, 4, NULL), -- Gloomhaven JOTL maximum players 4
(17, 3, 120, NULL), -- Gloomhaven JOTL average playtime 120
(17, 4, 14, NULL), -- Gloomhaven JOTL minimum age 14
(17, 5, NULL, 'Standalone Campaign'), -- Gloomhaven JOTL edition Standalone Campaign
(17, 16, NULL, 'Cephalofair Games'), -- Gloomhaven JOTL publisher Cephalofair Games

(18, 1, 2, NULL), -- Root minimum players 2
(18, 2, 4, NULL), -- Root maximum players 4
(18, 3, 90, NULL), -- Root average playtime 90
(18, 4, 10, NULL), -- Root minimum age 10
(18, 5, NULL, 'Base Game'), -- Root edition Base Game
(18, 16, NULL, 'Leder Games'), -- Root publisher Leder Games

(3, 5, NULL, 'Modern Horizons'), -- Magic Booster Pack edition Modern Horizons
(3, 6, NULL, 'Rare'), -- Magic Booster Pack rarity Rare
(3, 7, NULL, 'English'), -- Magic Booster Pack language English
(4, 5, NULL, 'Elite Trainer Box'), -- Pokemon ETB edition Elite Trainer Box
(4, 7, NULL, 'English'), -- Pokemon ETB language English

(19, 5, NULL, 'Blitz Deck'), -- Flesh and Blood Blitz Deck edition Blitz Deck
(19, 6, NULL, 'Rare'), -- Flesh and Blood Blitz Deck rarity Rare
(19, 7, NULL, 'English'), -- Flesh and Blood Blitz Deck language English

(20, 5, NULL, 'Starter Deck'), -- Yu-Gi-Oh Starter Deck edition Starter Deck
(20, 7, NULL, 'English'), -- Yu-Gi-Oh Starter Deck language English

(5, 5, NULL, 'Fifth Edition'), -- D&D Player Handbook edition Fifth Edition
(5, 7, NULL, 'English'), -- D&D Player Handbook language English
(5, 8, NULL, 'Hardcover'), -- D&D Player Handbook material Hardcover
(5, 16, NULL, 'Wizards of the Coast'), -- D&D Player Handbook publisher Wizards of the Coast
(5, 19, 384, NULL), -- D&D Player Handbook page count 384

(29, 5, NULL, 'Second Edition'), -- Pathfinder Core Rulebook edition Second Edition
(29, 7, NULL, 'English'), -- Pathfinder Core Rulebook language English
(29, 8, NULL, 'Hardcover'), -- Pathfinder Core Rulebook material Hardcover
(29, 16, NULL, 'Paizo'), -- Pathfinder Core Rulebook publisher Paizo
(29, 19, 640, NULL), -- Pathfinder Core Rulebook page count 640

(30, 5, NULL, 'Tenth Edition'), -- Warhammer 40K Core Book edition Tenth Edition
(30, 7, NULL, 'English'), -- Warhammer 40K Core Book language English
(30, 8, NULL, 'Hardcover'), -- Warhammer 40K Core Book material Hardcover
(30, 16, NULL, 'Games Workshop'), -- Warhammer 40K Core Book publisher Games Workshop
(30, 19, 280, NULL), -- Warhammer 40K Core Book page count 280

(6, 8, NULL, 'Metal'), -- D12 Dice Set material Metal
(6, 9, 7, NULL), -- D12 Dice Set number of dices in set 7
(6, 17, NULL, 'Purple'), -- D12 Dice Set primary colour Purple
(6, 18, NULL, 'Silver'), -- D12 Dice Set secondary colour Silver
(6, 20, NULL, 'D12'), -- D12 Dice Set die type D12

(7, 8, NULL, 'Metal'), -- Dice Set D6 material Metal
(7, 9, 7, NULL), -- Dice Set D6 number of dices in set 7
(7, 17, NULL, 'Green'), -- Dice Set D6 primary colour Green
(7, 18, NULL, 'Black'), -- Dice Set D6 secondary colour Black
(7, 20, NULL, 'D6'), -- Dice Set D6 die type D6

(8, 8, NULL, 'Metal'), -- Dice Set D8 material Metal
(8, 9, 7, NULL), -- Dice Set D8 number of dices in set 7
(8, 17, NULL, 'Pink'), -- Dice Set D8 primary colour Pink
(8, 18, NULL, 'Silver'), -- Dice Set D8 secondary colour Silver
(8, 20, NULL, 'D8'), -- Dice Set D8 die type D8

(9, 8, NULL, 'Metal'), -- Dice Set D10 material Metal
(9, 9, 7, NULL), -- Dice Set D10 number of dices in set 7
(9, 17, NULL, 'Blue'), -- Dice Set D10 primary colour Blue
(9, 18, NULL, 'Silver'), -- Dice Set D10 secondary colour Silver
(9, 20, NULL, 'D10'), -- Dice Set D10 die type D10

(10, 8, NULL, 'Metal'), -- Dice Set D20 material Metal
(10, 9, 7, NULL), -- Dice Set D20 number of dices in set 7
(10, 17, NULL, 'Black'), -- Dice Set D20 primary colour Black
(10, 18, NULL, 'Gold'), -- Dice Set D20 secondary colour Gold
(10, 20, NULL, 'D20'), -- Dice Set D20 die type D20

(21, 8, NULL, 'Acrylic'), -- Dice Set D6 Frost Blue material Acrylic
(21, 9, 12, NULL), -- Dice Set D6 Frost Blue number of dices in set 12
(21, 17, NULL, 'Blue'), -- Dice Set D6 Frost Blue primary colour Blue
(21, 18, NULL, 'White'), -- Dice Set D6 Frost Blue secondary colour White
(21, 20, NULL, 'D6'), -- Dice Set D6 Frost Blue die type D6

(22, 8, NULL, 'Resin'), -- Dice Set D8 Ember Red material Resin
(22, 9, 8, NULL), -- Dice Set D8 Ember Red number of dices in set 8
(22, 17, NULL, 'Red'), -- Dice Set D8 Ember Red primary colour Red
(22, 18, NULL, 'Black'), -- Dice Set D8 Ember Red secondary colour Black
(22, 20, NULL, 'D8'), -- Dice Set D8 Ember Red die type D8

(23, 8, NULL, 'Metal'), -- Dice Set D10 Shadow Steel material Metal
(23, 9, 10, NULL), -- Dice Set D10 Shadow Steel number of dices in set 10
(23, 17, NULL, 'Gunmetal'), -- Dice Set D10 Shadow Steel primary colour Gunmetal
(23, 18, NULL, 'Silver'), -- Dice Set D10 Shadow Steel secondary colour Silver
(23, 20, NULL, 'D10'), -- Dice Set D10 Shadow Steel die type D10

(24, 8, NULL, 'Acrylic'), -- Dice Set D12 Emerald Swirl material Acrylic
(24, 9, 7, NULL), -- Dice Set D12 Emerald Swirl number of dices in set 7
(24, 17, NULL, 'Green'), -- Dice Set D12 Emerald Swirl primary colour Green
(24, 18, NULL, 'White'), -- Dice Set D12 Emerald Swirl secondary colour White
(24, 20, NULL, 'D12'), -- Dice Set D12 Emerald Swirl die type D12

(25, 8, NULL, 'Metal'), -- Dice Set D20 Sunburst Gold material Metal
(25, 9, 9, NULL), -- Dice Set D20 Sunburst Gold number of dices in set 9
(25, 17, NULL, 'Gold'), -- Dice Set D20 Sunburst Gold primary colour Gold
(25, 18, NULL, 'Orange'), -- Dice Set D20 Sunburst Gold secondary colour Orange
(25, 20, NULL, 'D20'), -- Dice Set D20 Sunburst Gold die type D20

(11, 8, NULL, 'PLA Plastic'), -- Miniature Knight material PLA Plastic
(11, 11, 30, NULL), -- Miniature Knight width mm 30
(11, 12, 60, NULL), -- Miniature Knight height mm 60
(11, 13, 15, NULL), -- Miniature Knight depth mm 15
(11, 14, 38, NULL), -- Miniature Knight scale mm 38
(11, 15, 9, NULL), -- Miniature Knight weight g 9
(11, 17, NULL, 'Grey'), -- Miniature Knight primary colour Grey
(11, 18, NULL, 'Blue'), -- Miniature Knight secondary colour Blue

(12, 8, NULL, 'Metal'), -- Miniature Wizard material Metal
(12, 11, 25, NULL), -- Miniature Wizard width mm 25
(12, 12, 65, NULL), -- Miniature Wizard height mm 65
(12, 13, 20, NULL), -- Miniature Wizard depth mm 20
(12, 14, 32, NULL), -- Miniature Wizard scale mm 32
(12, 15, 8, NULL), -- Miniature Wizard weight g 8
(12, 17, NULL, 'Silver'), -- Miniature Wizard primary colour Silver
(12, 18, NULL, 'Blue'), -- Miniature Wizard secondary colour Blue

(13, 8, NULL, 'PETG Plastic'), -- Miniature Dragon material PETG Plastic
(13, 11, 30, NULL), -- Miniature Dragon width mm 30
(13, 12, 55, NULL), -- Miniature Dragon height mm 55
(13, 13, 15, NULL), -- Miniature Dragon depth mm 15
(13, 14, 30, NULL), -- Miniature Dragon scale mm 30
(13, 15, 10, NULL), -- Miniature Dragon weight g 10
(13, 17, NULL, 'Red'), -- Miniature Dragon primary colour Red
(13, 18, NULL, 'Black'), -- Miniature Dragon secondary colour Black

(14, 8, NULL, 'Metal'), -- Miniature Goblin material Metal
(14, 11, 20, NULL), -- Miniature Goblin width mm 20
(14, 12, 50, NULL), -- Miniature Goblin height mm 50
(14, 13, 15, NULL), -- Miniature Goblin depth mm 15
(14, 14, 35, NULL), -- Miniature Goblin scale mm 35
(14, 15, 8, NULL), -- Miniature Goblin weight g 8
(14, 17, NULL, 'Green'), -- Miniature Goblin primary colour Green
(14, 18, NULL, 'Bronze'), -- Miniature Goblin secondary colour Bronze

(15, 8, NULL, 'Metal'), -- Miniature Orc material Metal
(15, 11, 25, NULL), -- Miniature Orc width mm 25
(15, 12, 60, NULL), -- Miniature Orc height mm 60
(15, 13, 20, NULL), -- Miniature Orc depth mm 20
(15, 14, 32, NULL), -- Miniature Orc scale mm 32
(15, 15, 9, NULL), -- Miniature Orc weight g 9
(15, 17, NULL, 'Green'), -- Miniature Orc primary colour Green
(15, 18, NULL, 'Silver'), -- Miniature Orc secondary colour Silver

(26, 8, NULL, 'Resin'), -- Miniature Paladin material Resin
(26, 11, 28, NULL), -- Miniature Paladin width mm 28
(26, 12, 62, NULL), -- Miniature Paladin height mm 62
(26, 13, 18, NULL), -- Miniature Paladin depth mm 18
(26, 14, 32, NULL), -- Miniature Paladin scale mm 32
(26, 15, 10, NULL), -- Miniature Paladin weight g 10
(26, 17, NULL, 'Silver'), -- Miniature Paladin primary colour Silver
(26, 18, NULL, 'White'), -- Miniature Paladin secondary colour White

(27, 8, NULL, 'Resin'), -- Miniature Rogue material Resin
(27, 11, 24, NULL), -- Miniature Rogue width mm 24
(27, 12, 58, NULL), -- Miniature Rogue height mm 58
(27, 13, 16, NULL), -- Miniature Rogue depth mm 16
(27, 14, 32, NULL), -- Miniature Rogue scale mm 32
(27, 15, 8, NULL), -- Miniature Rogue weight g 8
(27, 17, NULL, 'Black'), -- Miniature Rogue primary colour Black
(27, 18, NULL, 'Purple'), -- Miniature Rogue secondary colour Purple

(28, 8, NULL, 'PVC'), -- Miniature Troll material PVC
(28, 11, 40, NULL), -- Miniature Troll width mm 40
(28, 12, 78, NULL), -- Miniature Troll height mm 78
(28, 13, 30, NULL), -- Miniature Troll depth mm 30
(28, 14, 50, NULL), -- Miniature Troll scale mm 50
(28, 15, 18, NULL), -- Miniature Troll weight g 18
(28, 17, NULL, 'Brown'), -- Miniature Troll primary colour Brown
(28, 18, NULL, 'Grey'); -- Miniature Troll secondary colour Grey

-- Inventory
INSERT INTO `inventory` (inventory_id, product_id, stock, store_id)
VALUES
(1, 1, 10, 1), -- Catan store 1
(2, 2, 5, 1), -- Betrayal store 1
(3, 3, 100, 1), -- Magic Booster Pack store 1
(4, 4, 20, 2), -- Pokemon ETB store 2
(5, 5, 15, 2), -- D&D Player Handbook store 2
(6, 6, 50, 3), -- D12 Dice Set store 3
(7, 7, 200, 3), -- Dice Set D6 store 3
(8, 8, 150, 4), -- Dice Set D8 store 4
(9, 9, 80, 4), -- Dice Set D10 store 4
(10, 10, 12, 4), -- Dice Set D20 store 4
(11, 11, 24, 1), -- Miniature Knight store 1
(12, 12, 18, 1), -- Miniature Wizard store 1
(13, 13, 10, 2), -- Miniature Dragon store 2
(14, 14, 32, 2), -- Miniature Goblin store 2
(15, 15, 22, 3), -- Miniature Orc store 3
(16, 16, 14, 1), -- Ticket to Ride store 1
(17, 17, 9, 2), -- Gloomhaven JOTL store 2
(18, 18, 11, 3), -- Root store 3
(19, 19, 40, 4), -- Flesh and Blood Blitz Deck store 4
(20, 20, 35, 4), -- Yu-Gi-Oh Starter Deck store 4
(21, 21, 120, 5), -- Dice Set D6 Frost Blue store 5
(22, 22, 90, 5), -- Dice Set D8 Ember Red store 5
(23, 23, 60, 6), -- Dice Set D10 Shadow Steel store 6
(24, 24, 75, 6), -- Dice Set D12 Emerald Swirl store 6
(25, 25, 30, 7), -- Dice Set D20 Sunburst Gold store 7
(26, 26, 16, 7), -- Miniature Paladin store 7
(27, 27, 18, 8), -- Miniature Rogue store 8
(28, 28, 9, 8), -- Miniature Troll store 8
(29, 29, 12, 5), -- Pathfinder Core Rulebook store 5
(30, 30, 8, 6), -- Warhammer 40K Core Book store 6
(31, 1, 20, 5), -- Catan store 5
(32, 2, 8, 6), -- Betrayal store 6
(33, 5, 16, 7), -- D&D Player Handbook store 7
(34, 16, 10, 8), -- Ticket to Ride store 8
(35, 18, 7, 1); -- Root store 1

-- Customers
INSERT INTO `customers` (customer_id, customer_name, customer_email, date_registered)
VALUES
(1, 'John Doe', 'john@gmail.com', '2026-01-01 10:47:12'), -- customer
(2, 'Jane Doe', 'jane@gmail.com', '2026-01-02 18:22:45'), -- customer
(3, 'Sam Smith', 'sam@outlook.com', '2026-01-05 13:11:03'), -- customer
(4, 'Bilbo B.', 'shire@middle.earth', '2026-01-06 11:32:58'), -- customer
(5, 'Frodo B.', 'ringbearer@middle.earth', '2026-01-06 14:14:27'), -- customer
(6, 'Gandalf G.', 'wizard@middle.earth', '2026-01-06 21:55:09'), -- customer
(7, 'Aragorn E.', 'king@gondor.gov', '2026-01-07 11:43:36'), -- customer
(8, 'Legolas G.', 'elf@mirkwood.com', '2026-01-07 16:08:51'), -- customer
(9, 'Gimli G.', 'axe@lonelymtn.com', '2026-01-07 17:27:14'), -- customer
(10, 'Boromir G.', 'one-does-not-simply@gondor.gov', '2026-01-07 17:59:59'), -- customer
(11, 'Merry B.', 'brandybuck@shire.com', '2026-01-08 14:36:22'), -- customer
(12, 'Pippin T.', 'took@shire.com', '2026-01-08 17:49:05'), -- customer
(13, 'Sauron E.', 'eye@mordor.net', '2026-01-09 10:17:44'), -- customer
(14, 'Galadriel E.', 'mirror@lothlorien.com', '2026-01-10 12:58:11'), -- customer
(15, 'Elrond P.', 'rivendell@council.com', '2026-01-11 19:26:33'), -- customer
(16, 'Eowyn R.', 'shieldmaiden@rohan.net', '2026-01-12 09:18:01'), -- customer
(17, 'Faramir G.', 'captain@ithilien.org', '2026-01-12 13:22:47'), -- customer
(18, 'Arwen U.', 'evenstar@rivendell.net', '2026-01-13 15:44:09'), -- customer
(19, 'Treebeard E.', 'fangorn@ents.org', '2026-01-14 08:05:15'), -- customer
(20, 'Theoden K.', 'king@rohan.gov', '2026-01-14 17:31:00'), -- customer
(21, 'Denethor S.', 'steward@gondor.gov', '2026-01-15 12:14:36'), -- customer
(22, 'Rosie C.', 'rosie@shire.com', '2026-01-16 10:28:52'), -- customer
(23, 'Thorin O.', 'oakenshield@erebor.org', '2026-01-17 11:47:19'), -- customer
(24, 'Balin D.', 'balin@khazad.net', '2026-01-18 16:42:03'), -- customer
(25, 'Dwalin D.', 'dwalin@khazad.net', '2026-01-19 09:36:54'), -- customer
(26, 'Tauriel G.', 'tauriel@mirkwood.com', '2026-01-20 14:20:11'), -- customer
(27, 'Bard A.', 'bard@laketown.gov', '2026-01-21 18:09:28'), -- customer
(28, 'Radagast B.', 'radagast@rhosgobel.net', '2026-01-22 07:57:40'), -- customer
(29, 'Beorn S.', 'beorn@carrock.org', '2026-01-23 13:03:22'), -- customer
(30, 'Tom B.', 'tom@oldforest.net', '2026-01-24 11:11:11'); -- customer

-- Transactions
INSERT INTO `transactions` (transaction_id, transaction_date, employee_id, transaction_total, customer_id)
VALUES
(1, '2026-02-01 12:00:00', 2, 45.00, 1), -- customer 1 employee 2
(2, '2026-02-01 13:00:00', 3, 12.00, 2), -- customer 2 employee 3
(3, '2026-02-02 14:00:00', 2, 120.00, 3), -- customer 3 employee 2
(4, '2026-02-03 18:00:00', 4, 35.00, 4), -- customer 4 employee 4
(5, '2026-02-04 19:30:00', 1, 9.00, 5), -- customer 5 employee 1
(6, '2026-02-05 20:00:00', 5, 49.99, 6), -- customer 6 employee 5
(7, '2026-02-06 21:00:00', 3, 11.00, 7), -- customer 7 employee 3
(8, '2026-02-07 12:30:00', 2, 54.99, 8), -- customer 8 employee 2
(9, '2026-02-08 13:45:00', 4, 15.00, 9), -- customer 9 employee 4
(10, '2026-02-09 14:15:00', 1, 44.99, 10), -- customer 10 employee 1
(11, '2026-02-10 15:00:00', 5, 16.00, 11), -- customer 11 employee 5
(12, '2026-02-11 16:30:00', 2, 69.99, 12), -- customer 12 employee 2
(13, '2026-02-12 17:45:00', 3, 29.98, 13), -- customer 13 employee 3
(14, '2026-02-13 18:20:00', 4, 12.00, 14), -- customer 14 employee 4
(15, '2026-02-14 19:00:00', 1, 24.00, 15), -- customer 15 employee 1
(16, '2026-02-15 20:30:00', 5, 15.00, 1), -- customer 1 employee 5
(17, '2026-02-16 21:15:00', 2, 59.99, 2), -- customer 2 employee 2
(18, '2026-02-17 12:45:00', 3, 20.00, 3), -- customer 3 employee 3
(19, '2026-02-18 13:30:00', 4, 13.00, 4), -- customer 4 employee 4
(20, '2026-02-19 14:10:00', 1, 19.99, 5), -- customer 5 employee 1
(21, '2026-02-20 15:20:00', 5, 14.00, 6), -- customer 6 employee 5
(22, '2026-02-21 16:40:00', 2, 45.00, 7), -- customer 7 employee 2
(23, '2026-02-22 17:55:00', 3, 25.00, 8), -- customer 8 employee 3
(24, '2026-02-23 18:30:00', 4, 65.00, 9), -- customer 9 employee 4
(25, '2026-02-24 19:15:00', 1, 14.97, 10), -- customer 10 employee 1
(26, '2026-02-25 20:45:00', 5, 15.00, 11), -- customer 11 employee 5
(27, '2026-02-26 21:30:00', 2, 18.00, 12), -- customer 12 employee 2
(28, '2026-02-27 12:50:00', 3, 54.99, 13), -- customer 13 employee 3
(29, '2026-02-28 13:15:00', 4, 12.00, 14), -- customer 14 employee 4
(30, '2026-02-28 21:00:00', 5, 120.00, 15), -- customer 15 employee 5
(31, '2026-03-01 11:10:00', 2, 69.99, 1), -- customer 1 employee 2
(32, '2026-03-01 14:25:00', 1, 18.00, 2), -- customer 2 employee 1
(33, '2026-03-02 13:40:00', 18, 44.99, 3), -- customer 3 employee 18
(34, '2026-03-02 16:00:00', 6, 18.00, 4), -- customer 4 employee 6
(35, '2026-03-03 12:20:00', 18, 69.99, 5), -- customer 5 employee 18
(36, '2026-03-03 17:45:00', 7, 59.99, 1), -- customer 1 employee 7
(37, '2026-03-04 15:30:00', 22, 65.00, 6), -- customer 6 employee 22
(38, '2026-03-04 18:10:00', 10, 15.00, 7), -- customer 7 employee 10
(39, '2026-03-05 13:50:00', 3, 15.00, 8), -- customer 8 employee 3
(40, '2026-03-05 19:05:00', 8, 25.00, 9), -- customer 9 employee 8
(41, '2026-03-06 12:15:00', 9, 18.00, 10), -- customer 10 employee 9
(42, '2026-03-06 16:55:00', 12, 12.00, 11), -- customer 11 employee 12
(43, '2026-03-07 11:25:00', 14, 59.97, 12), -- customer 12 employee 14
(44, '2026-03-07 14:40:00', 15, 29.98, 13), -- customer 13 employee 15
(45, '2026-03-08 12:35:00', 19, 14.00, 14), -- customer 14 employee 19
(46, '2026-03-08 17:20:00', 23, 16.00, 15), -- customer 15 employee 23
(47, '2026-03-09 13:05:00', 24, 30.00, 16), -- customer 16 employee 24
(48, '2026-03-09 18:30:00', 26, 24.00, 17), -- customer 17 employee 26
(49, '2026-03-10 11:50:00', 20, 45.00, 18), -- customer 18 employee 20
(50, '2026-03-10 15:45:00', 22, 120.00, 19), -- customer 19 employee 22
(51, '2026-03-11 12:00:00', 27, 69.99, 20), -- customer 20 employee 27
(52, '2026-03-11 17:10:00', 30, 54.99, 21), -- customer 21 employee 30
(53, '2026-03-12 13:25:00', 11, 69.99, 22), -- customer 22 employee 11
(54, '2026-03-12 19:15:00', 18, 44.99, 23), -- customer 23 employee 18
(55, '2026-03-13 14:05:00', 23, 65.00, 24), -- customer 24 employee 23
(56, '2026-03-14 12:45:00', 2, 29.94, 25), -- customer 25 employee 2
(57, '2026-03-14 16:40:00', 8, 49.99, 26), -- customer 26 employee 8
(58, '2026-03-15 13:35:00', 12, 18.00, 27), -- customer 27 employee 12
(59, '2026-03-15 18:50:00', 7, 59.99, 28), -- customer 28 employee 7
(60, '2026-03-16 15:15:00', 1, 120.00, 29); -- customer 29 employee 1

-- Transaction Records
INSERT INTO `transaction_records` (transaction_id, inventory_id, item_quantity, returned_quantity)
VALUES
(1, 1, 1, 0), -- inventory 1 qty 1
(2, 6, 1, 0), -- inventory 6 qty 1
(3, 2, 1, 0), -- inventory 2 qty 1
(4, 5, 1, 0), -- inventory 5 qty 1
(5, 7, 1, 0), -- inventory 7 qty 1
(6, 4, 1, 0), -- inventory 4 qty 1
(7, 8, 1, 0), -- inventory 8 qty 1
(8, 16, 1, 0), -- inventory 16 qty 1
(9, 11, 1, 0), -- inventory 11 qty 1
(10, 29, 1, 0), -- inventory 29 qty 1
(11, 23, 1, 0), -- inventory 23 qty 1
(12, 18, 1, 0), -- inventory 18 qty 1
(13, 20, 2, 0), -- inventory 20 qty 2
(14, 21, 1, 0), -- inventory 21 qty 1
(15, 25, 1, 0), -- inventory 25 qty 1
(16, 12, 1, 0), -- inventory 12 qty 1
(17, 17, 1, 0), -- inventory 17 qty 1
(18, 14, 2, 0), -- inventory 14 qty 2
(19, 9, 1, 0), -- inventory 9 qty 1
(20, 19, 1, 0), -- inventory 19 qty 1
(21, 22, 1, 0), -- inventory 22 qty 1
(22, 31, 1, 0), -- inventory 31 qty 1
(23, 13, 1, 0), -- inventory 13 qty 1
(24, 30, 1, 0), -- inventory 30 qty 1
(25, 3, 3, 0), -- inventory 3 qty 3
(26, 24, 1, 0), -- inventory 24 qty 1
(27, 26, 1, 0), -- inventory 26 qty 1
(28, 34, 1, 0), -- inventory 34 qty 1
(29, 15, 1, 0), -- inventory 15 qty 1
(30, 32, 1, 0), -- inventory 32 qty 1
(31, 35, 1, 0), -- inventory 35 qty 1
(32, 10, 1, 0), -- inventory 10 qty 1
(33, 29, 1, 0), -- inventory 29 qty 1
(34, 7, 2, 0), -- inventory 7 qty 2
(35, 18, 1, 0), -- inventory 18 qty 1
(36, 17, 1, 0), -- inventory 17 qty 1
(37, 30, 1, 0), -- inventory 30 qty 1
(38, 11, 1, 0), -- inventory 11 qty 1
(39, 12, 1, 0), -- inventory 12 qty 1
(40, 13, 1, 0), -- inventory 13 qty 1
(41, 10, 1, 0), -- inventory 10 qty 1
(42, 6, 1, 0), -- inventory 6 qty 1
(43, 19, 3, 0), -- inventory 19 qty 3
(44, 20, 2, 0), -- inventory 20 qty 2
(45, 22, 1, 0), -- inventory 22 qty 1
(46, 23, 1, 0), -- inventory 23 qty 1
(47, 24, 2, 0), -- inventory 24 qty 2
(48, 25, 1, 0), -- inventory 25 qty 1
(49, 1, 1, 0), -- inventory 1 qty 1
(50, 2, 1, 0), -- inventory 2 qty 1
(51, 18, 1, 0), -- inventory 18 qty 1
(52, 34, 1, 0), -- inventory 34 qty 1
(53, 35, 1, 0), -- inventory 35 qty 1
(54, 29, 1, 0), -- inventory 29 qty 1
(55, 30, 1, 0), -- inventory 30 qty 1
(56, 3, 6, 0), -- inventory 3 qty 6
(57, 4, 1, 0), -- inventory 4 qty 1
(58, 7, 2, 0), -- inventory 7 qty 2
(59, 17, 1, 0), -- inventory 17 qty 1
(60, 32, 1, 0); -- inventory 32 qty 1

-- Reservations
INSERT INTO `reservations` (reservation_id, customer_id, num_guests, reservation_date_time, num_tables, transaction_id)
VALUES
(1, 1, 4, '2026-03-01 18:00:00', 1, 1), -- customer 1 4 guests
(2, 7, 2, '2026-03-02 19:00:00', 1, NULL), -- customer 7 2 guests
(3, 2, 6, '2026-03-03 18:00:00', 2, 4), -- customer 3 6 guests
(4, 5, 8, '2026-03-04 19:00:00', 2, 7), -- customer 5 8 guests
(5, 2, 3, '2026-03-05 18:00:00', 1, 12), -- customer 2 3 guests
(6, 9, 5, '2026-03-06 19:00:00', 1, 11), -- customer 9 5 guests
(7, 4, 7, '2026-03-07 18:00:00', 2, 9), -- customer 4 7 guests
(8, 6, 4, '2026-03-08 19:00:00', 2, 3), -- customer 6 4 guests
(9, 8, 10, '2026-03-09 18:00:00', 1, NULL), -- customer 8 10 guests
(10, 11, 6, '2026-03-10 19:00:00', 2, 15), -- customer 10 6 guests
(11, 16, 5, '2026-04-01 13:00:00', 1, NULL), -- customer 16 5 guests
(12, 17, 8, '2026-04-01 18:00:00', 2, NULL), -- customer 17 8 guests
(13, 18, 6, '2026-04-03 19:00:00', 1, NULL), -- customer 18 6 guests
(14, 19, 4, '2026-04-05 17:00:00', 1, NULL), -- customer 19 4 guests
(15, 20, 12, '2026-04-07 18:30:00', 2, NULL), -- customer 20 12 guests
(16, 21, 7, '2026-04-09 18:00:00', 1, NULL), -- customer 21 7 guests
(17, 22, 5, '2026-04-12 14:00:00', 1, NULL), -- customer 22 5 guests
(18, 22, 9, '2026-04-15 12:00:00', 2, NULL), -- customer 23 9 guests
(19, 24, 4, '2026-04-18 13:00:00', 1, NULL), -- customer 24 4 guests
(20, 25, 10, '2026-04-22 19:00:00', 2, NULL), -- customer 25 10 guests
(21, 26, 6, '2026-05-01 18:00:00', 1, NULL), -- customer 26 6 guests
(22, 27, 3, '2026-05-10 15:00:00', 1, NULL), -- customer 27 3 guests
(23, 28, 8, '2026-05-17 12:00:00', 2, NULL), -- customer 28 8 guests
(24, 29, 5, '2026-06-01 18:00:00', 1, NULL); -- customer 29 5 guests

-- Table Reservations
INSERT INTO `table_reservations` (table_reservations_id, reservation_id, table_id, reservation_start, reservation_end)
VALUES
(1, 1, 1, '2026-03-01 18:00:00', '2026-03-01 21:00:00'), -- reservation 1 table 1
(2, 2, 2, '2026-03-02 19:00:00', '2026-03-02 22:00:00'), -- reservation 2 table 2
(3, 3, 3, '2026-03-03 18:00:00', '2026-03-03 21:00:00'), -- reservation 3 table 3
(4, 3, 6, '2026-03-03 18:00:00', '2026-03-03 21:00:00'), -- reservation 3 table 6
(5, 4, 4, '2026-03-04 19:00:00', '2026-03-04 22:00:00'), -- reservation 4 table 4
(6, 4, 5, '2026-03-04 19:00:00', '2026-03-04 22:00:00'), -- reservation 4 table 5
(7, 5, 1, '2026-03-05 18:00:00', '2026-03-05 21:00:00'), -- reservation 5 table 1
(8, 6, 2, '2026-03-06 19:00:00', '2026-03-06 22:00:00'), -- reservation 6 table 2
(9, 7, 3, '2026-03-07 18:00:00', '2026-03-07 21:00:00'), -- reservation 7 table 3
(10, 7, 6, '2026-03-07 18:00:00', '2026-03-07 21:00:00'), -- reservation 7 table 6
(11, 8, 4, '2026-03-08 19:00:00', '2026-03-08 22:00:00'), -- reservation 8 table 4
(12, 8, 5, '2026-03-08 19:00:00', '2026-03-08 22:00:00'), -- reservation 8 table 5
(13, 9, 9, '2026-03-09 18:00:00', '2026-03-09 21:00:00'), -- reservation 9 table 9
(14, 10, 10, '2026-03-10 19:00:00', '2026-03-10 22:00:00'), -- reservation 10 table 10
(15, 10, 11, '2026-03-10 19:00:00', '2026-03-10 22:00:00'), -- reservation 10 table 11
(16, 11, 3, '2026-04-01 13:00:00', '2026-04-01 17:00:00'), -- reservation 11 table 3
(17, 12, 14, '2026-04-01 18:00:00', '2026-04-01 22:00:00'), -- reservation 12 table 14
(18, 12, 15, '2026-04-01 18:00:00', '2026-04-01 22:00:00'), -- reservation 12 table 15
(19, 13, 6, '2026-04-03 19:00:00', '2026-04-03 22:00:00'), -- reservation 13 table 6
(20, 14, 21, '2026-04-05 17:00:00', '2026-04-05 20:00:00'), -- reservation 14 table 21
(21, 15, 22, '2026-04-07 09:00:00', '2026-04-07 12:30:00'), -- reservation 15 table 22
(22, 15, 24, '2026-04-07 09:00:00', '2026-04-07 12:30:00'), -- reservation 15 table 22
(23, 15, 26, '2026-04-07 09:00:00', '2026-04-07 12:30:00'), -- reservation 15 table 26
(24, 16, 9, '2026-04-09 18:00:00', '2026-04-09 21:00:00'), -- reservation 16 table 9
(25, 17, 11, '2026-04-12 14:00:00', '2026-04-12 17:00:00'), -- reservation 17 table 11
(26, 18, 18, '2026-04-15 12:00:00', '2026-04-15 18:00:00'), -- reservation 18 table 18
(27, 18, 20, '2026-04-15 12:00:00', '2026-04-15 18:00:00'), -- reservation 18 table 20
(28, 19, 23, '2026-04-18 13:00:00', '2026-04-18 16:00:00'), -- reservation 19 table 23
(29, 20, 24, '2026-04-22 19:00:00', '2026-04-22 23:00:00'), -- reservation 20 table 24
(30, 20, 25, '2026-04-22 19:00:00', '2026-04-22 23:00:00'), -- reservation 20 table 25
(31, 21, 14, '2026-05-01 18:00:00', '2026-05-01 21:00:00'), -- reservation 21 table 14
(32, 22, 2, '2026-05-10 15:00:00', '2026-05-10 17:00:00'), -- reservation 22 table 2
(33, 23, 3, '2026-05-17 12:00:00', '2026-05-17 18:00:00'), -- reservation 23 table 3
(34, 23, 6, '2026-05-17 12:00:00', '2026-05-17 18:00:00'), -- reservation 23 table 6
(35, 24, 22, '2026-06-01 18:00:00', '2026-06-01 21:00:00'); -- reservation 24 table 22
