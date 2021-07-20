-- This database is based on my partner's online shop that sells pokemon cards.

CREATE DATABASE pokemonshop;

USE pokemonshop;

-- Table of customers name and ID / using ID as primary key to avoid duplication - UNIQUE = 2 customers cannot have the same customer ID 
-- AUTO INCREMENT so a number isnt missed. First & Last name isnt unique or PK as 2 or more people can have the same name
CREATE TABLE Customers (
    Customer_ID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT ,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NULL
);

-- Names are not from actual buyers, these names have been taken from 'Mean Girls' movie
INSERT INTO Customers 
(customer_id, first_name, last_name) 
VALUES 
(001, 'Regina', 'George'),
(002, 'Karen', 'Smith'),
(003, 'Gretchen', 'Wieners'),
(004, 'Janis', 'Ian'),
(005, 'Cady', 'Heron'),
(006, 'Damian', 'Leigh'),
(007, 'Aaron', 'Samuels'),
(008, 'Glen', 'Coco'),
(009, 'Trang', 'Pak'),
(010, 'Ron', 'Duvall');

SELECT * FROM Customers;

-- Table for customer's address, kept separate to customers as 1 household can have multiple buyers
-- No primary key as this table will not be referenced anywhere else
CREATE TABLE Address (
	Customer_ID INT NOT NULL AUTO_INCREMENT,
    House_Number VARCHAR(50),
    Street VARCHAR(50)NOT NULL,
    AddressLine2 VARCHAR(50) ,
    City VARCHAR(50),
    County VARCHAR(50),
    PostCode VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
    );

-- Addresses have been heavily modified for data protection.
INSERT INTO Address
(Customer_ID, House_Number, Street, AddressLine2, City, County, PostCode, Country)
VALUES
(001, 42, 'Laverne Close', NULL, 'Bridgwater', NULL, 'TT16 4EN', 'United Kingdom'),
(002, 35, 'Blackpool Row;', NULL, 'Newtownabbey', 'Antrim', 'BT36 4QD', 'United Kingdom'),
(003, 61, 'Vicarage Avenue', NULL, 'Tonypandy', 'Glamorgan', 'CW20 1HR', 'United Kingdom'), 
(004, 250, 'Kingsvale Park', NULL, 'Belfast', 'Antrim', 'BA89 7BY', 'United Kingdom'),
(005, 160, 'Kensington Gardens', NULL, 'Bangor', 'Down', 'BK10 1QP', 'United Kingdom'), 
(006, 40, 'St Mews Road', NULL, 'Perton', 'Wolverhampton', 'WV16 7UN', 'United Kingdom'), 
(007, 81, 'Thyme Street', 'Newport Pagnell', 'Milton Keys', 'Buckinghamshire', 'MK20 8SQ', 'United Kingdom'), 
(008, 'Flat 121', '112 North Western Road', NULL, 'London', NULL, 'NW11 6UU', 'United Kingdom'), 
(009, 10, 'St Golden Road', NULL, 'Newlyn', 'Cornwall', 'TR20 9QQ', 'United Kingdom'), 
(010, 17, 'Coleman', NULL, 'London', NULL, 'NW8 8XD', 'United Kingdom');

-- Using customer ID as a foreign key to link the 2 tables together
ALTER TABLE Address
	ADD CONSTRAINT FK_Address_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID);

SELECT * FROM Address;

-- List of items shop currently have
-- Unique to avoid duplication / Primary Key as item will be referenced in other tables / auto increment so a id number isnt missed
CREATE TABLE Items (
    Item_ID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
    Item_Name VARCHAR(50) NOT NULL,
    Item_Price DEC (10,2) NOT NULL,
    Grading VARCHAR(25),
    Item_Set VARCHAR(50),
    Set_Number VARCHAR(20),
    Quantity INT NOT NULL
    );

-- These are real prices of the cards 
INSERT INTO Items
(Item_ID, Item_Name, Item_Price, Grading, Item_Set, Set_Number, Quantity)
VALUES
(2001, 'Kabutops Holo Rare', 63.00,'PSA 8', 'Neo Discovery', 6, 1),
(2002, 'Machamp 1st Edition Holo', 100.00, 'PSA 8', 'Base Set', 8, 1),
(2003, 'Ho-Oh Holo Rare', 65.00, NULL, 'Call of Legends', 'SL5', 1),
(2004, 'Togetic 1st Edition', 95.00,'PSA 8', 'Neo Genesis', 16, 1),
(2005, 'Scyther Ex Holo Rare', 92.00,'PSA 8', 'Ruby & Sapphire', 102, 1),
(2006, 'Dark Charizard 1st Edition', 210.00,'PSA 8', 'Team Rocket', 21, 1),
(2007, 'Skarmory 1st Edition Holo Rare', 60.00,'PSA 6', 'Neo Genesis', 13, 1),
(2008, 'Charizard Holo Rare',  330.00, 'PSA 7','Base Set 2', 4, 1),
(2009, 'Dark Magician 1st Edition', 115.00, NULL,'Legends of Blue Eyes', 005, 1),
(2010, 'Umbreon Holo Rare Japanese', 200.00,'PSA 8', 'Neo Discovery', 197, 1),
(2011, 'Raikou Holo Rare', 130.00, NULL, 'Call of Legends', 'SL9', 1),
(2012, 'Blaines Arcanine Holo Rare', 55.00, NULL, 'Gym Challenge', 1, 2),
(2013, 'Pikachu No Rarity Japanese', 32000.00,'PSA 10', 'Base Set', 25, 1),
(2014, 'Deoxys Holo Rare', 190.00, NULL, 'Call of Legends', 'SL1', 1),
(2015, 'Rayquaza Holo Rare', 265.00, 'PSA 7', 'Call of Legends', 'SL10', 1),
(2016, 'Pikachu Non Holo', 2.50, NULL, 'Jungle Set', 60, 3),
(2017, 'Bulbasaur Shadowless', 505.00, 'PSA 10', 'Base Set', 44, 1),
(2018, 'Shining Magikarp 1st Edition Full Holo', 649.00, 'PSA 8', 'Neo Revelation', 66, 1),
(2019, 'Sabrinas Gengar 1st Edition', 101.00,  NULL, 'Gym Challenge', 29, 1),
(2020, 'Rockets Mewtwo Holo', 285.00 , 'PSA 9', 'Gym Challenge', 14, 1);

SELECT * FROM ITEMS;

-- Table of orders made through shop
-- Unique to avoid duplication / Primary Key as item will be referenced in other tables / auto increment so a id number isnt missed
CREATE TABLE Orders (
	Order_ID INT NOT NULL UNIQUE PRIMARY KEY AUTO_INCREMENT,
	Item_ID INT NOT NULL,
    Sold_For DECIMAL(10,2) NOT NULL,
    Postage_Packaging DECIMAL (10,2),
    Total_Price DECIMAL (10,2) NOT NULL,
    Sale_Date DATE NOT NULL,
    Customer_ID INT NOT NULL
    ); 

INSERT INTO Orders
(Order_ID, Item_ID, Sold_for, Postage_Packaging, Total_Price, Sale_Date, Customer_ID)
VALUES
(3001, 2001, 63.00, NULL, 63.00, 20210712, 001),
(3002, 2002, 100, 5.57, 105.57, 20210707, 002), 
(3003, 2003, 65.00, NULL, 65.00, 20210704, 003),
(3004, 2004, 95.00, 5.57, 100.57, 20210621, 004),
(3005, 2005, 92.00, 5.57, 97.57, 20210629, 005),
(3006, 2006, 210.00, 5.57, 215.57, 20210621, 006),
(3007, 2007, 60.00, NULL, 60.00, 20210618, 007),
(3008, 2008, 330.00, 5.57, 335.57, 20210613, 008),
(3009, 2009, 115.00, 5.57, 120.57, 20210611, 009),
(3010, 2010, 200.00, 5.57, 205.57, 20210610, 010),
(3011, 2011, 130.00, 5.57, 135.57, 20210523, 003),
(3012, 2012, 55.00, NULL, 55.00, 20210521, 005),
(3013, 2013, 32000.00, NULL, 32000.00, 20210513, 010),
(3014, 2014, 190.00, 5.57, 195.57, 20210509, 007),
(3015, 2012, 55.00, NULL, 55.00, 20210429, 002),
(3016, 2016, 2.50, NULL, 2.50, 20210430, 004),
(3017, 2016, 2.50, NULL, 2.50, 20210530, 006);

-- Item ID from Items table is referenced as a foreign key so every order can be linked to an item
ALTER TABLE Orders
	ADD CONSTRAINT FK_Order_Item_ID
    FOREIGN KEY (Item_ID)
    REFERENCES Items(Item_ID);

-- Customer ID from customers is referenced as a foreign key so every order is linked to a customer
ALTER TABLE Orders
	ADD CONSTRAINT FK_Order_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID);

SELECT * FROM Orders
ORDER BY Item_ID ASC;

-- Transactions table separate from orders and items / this gives an overview of when an item is paid, dispatched, and delivery service used
CREATE TABLE Transactions (
	Transaction_ID INT NOT NULL UNIQUE, 
	Order_ID INT NOT NULL, 
    Item_ID INT NOT NULL,
    Customer_ID INT NOT NULL, 
    Paid_on_date DATE NOT NULL,
    Post_by_date DATE,
    Dispatch_date DATE NOT NULL,
    Delivery_Service VARCHAR (50),
    Tracking_Number VARCHAR (50),
    Paypal BOOL
    ); 

INSERT INTO Transactions
(Transaction_ID, Order_ID, Item_ID, Customer_ID, Paid_on_Date, Post_by_Date, Dispatch_date, Delivery_Service, Tracking_Number, Paypal)
VALUES 
(101, 3001, 2001, 001, 20210712, 20210714, 20210713, 'Royal Mail 2nd Class', NULL, 1),
(102, 3002, 2002, 002, 20210707, 20210709, 20210708, 'Royal Mail 1st Class', 'SE130661', 1),
(103, 3003, 2003, 003, 20210704, 20210706, 20210706, 'Royal Mail 2nd Class', NULL, 1),
(104, 3004, 2004, 004, 20210630, 20210702, 20210701, 'Royal Mail 1st Class', 'SE130589', 0),
(105, 3005, 2005, 005, 20210620, 20210701, 20210630, 'Royal Mail 1st Class', 'SE130577', 0),
(106, 3006, 2006, 006, 20210623, 20210625, 20210624, 'Royal Mail 1st Class', 'SE130518', 1),
(107, 3007, 2007, 007, 20210618, 20210622, 20210621, 'Royal Mail 2nd Class', NULL, 0),
(108, 3008, 2008, 008, 20210614, 20210616, 20210614, 'Special Delivery', 'SE130419', 0),
(109, 3009, 2009, 009, 20210612, 20210615, 20210614, 'Royal Mail 1st Class', 'SE130418', 0),
(110, 3010, 2010, 010, 20210610, 20210614, 20210610, 'Royal Mail 1st Class', 'SE130397', 1),
(111, 3011, 2011, 003, 20210523, 20210525, 20210521, 'Royal Mail 1st Class', 'SE130221', 0),
(112, 3012, 2012, 005, 20210521, 20210521, 20210523, 'Royal Mail 2nd Class', NULL, 0),
(113, 3013, 2013, 010, 20210521, 20210517, 20210514, 'Special Delivery', 'KB125649', 1),
(114, 3014, 2014, 007, 20210509, 20210511, 20210511, 'Royal Mail 1st Class', 'SE130108', 1),
(115, 3015, 2012, 002, 20210429, 20210504, 20210430, 'Special Delivery', 'SE129988', 1),
(116, 3016, 2016, 004, 20210430, 20210505, 20210501, 'Royal Mail 2nd Class', NULL, 1),
(117, 2017, 2016, 006, 20210530, 20210604, 20210531, 'Royal Mail 2nd Class', NULL, 0);

-- stops an error appearing when adding more than 1 FK
SET foreign_key_checks = 0;

-- Order ID from Orders is referenced as a FK to link values in transaction table to a specific Order ID 
-- for example to find when an Order was paid for and when that order was dispatched
ALTER TABLE Transactions
	ADD CONSTRAINT FK_Transactions_Order_ID
    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID);

-- Item ID from Items is referenced as a FK to link values in transaction table to a specific Order ID
-- for example to find when a certain pokemon card was sold and what delivery service was used / to see patterns if any high value items are lost using a certain delivery service.
ALTER TABLE Transactions
	ADD CONSTRAINT FK_Transactions_Item_ID
    FOREIGN KEY (Item_ID)
    REFERENCES Items(Item_ID);

-- Item ID from Items is referenced as a FK to link values in transaction table to a specific Order ID
-- for example to find when a customer uses paypal for transactions / when postage was made to a person / address (for delivery disputes)
ALTER TABLE Transactions
	ADD CONSTRAINT FK_Transactions_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID);

SELECT * FROM Transactions;

-- Using Inner Join Clause to find customers and their address uding Customer_ID
SELECT Customers.Customer_ID, 
Customers.first_name, 
Customers.last_name, 
Address.House_Number, 
Address.Street, 
Address.City, 
Address.County, 
Address.Postcode 
FROM customers
INNER JOIN Address on Address.Customer_ID = Customers.Customer_ID;

-- Left Join Clause to show which items have sold. The data is ordered by sale date starting from most recent sale.
SELECT Items.Item_ID,
Items.Item_Name,
Items.Item_Price,
Orders.Item_ID,
Orders.Sold_For,
Orders.Sale_Date
FROM Items
LEFT JOIN Orders on Items.Item_ID = Orders.Item_ID
ORDER BY Orders.Sale_Date DESC;

-- To see results run code below
SELECT
Customer_ID,
Sold_For,
Order_ID,
Item_ID,
Sale_Date,
Spendinglevel(Sold_For)
from Orders;

-- Stored Function that puts a customer in membership levels depending on amount spent in shop. (For targeted ads or sale promos)
DELIMITER $$
CREATE FUNCTION SpendingLevel(
    Sold_For decimal(10,2)
)
RETURNS VARCHAR(30)
DETERMINISTIC
BEGIN
    DECLARE SpendingLevel VARCHAR(30);
    IF Sold_For > 1000 THEN
        SET Spendinglevel = 'High Value Spender';
    ELSEIF (Sold_For >= 100 AND
            Sold_For <= 999) THEN
        SET Spendinglevel = 'High-Mid Value Spender';
	ELSEIF (Sold_For >= 50 AND
			Sold_For <= 99) THEN
		SET SpendingLevel = 'Low-Mid Value Spender';
    ELSEIF Sold_For <= 49  THEN
        SET SpendingLevel = 'Low Value spender';
    END IF;
    RETURN (Spendinglevel);
END $$ Sold_For
DELIMITER ;

-- To see results run code below
SELECT
Customer_ID,
Sold_For,
Order_ID,
Item_ID,
Sale_Date,
Spendinglevel(Sold_For)
from Orders;

-- * QUERY *
-- Query to find out when each item's paid on date, post-by date, and dispatch date. Useful for seeing if dispatch dates are within target
SELECT Paid_on_date, post_by_date, dispatch_date FROM TRANSACTIONS;


-- * SUBQUERIES *
-- Subqueries for finding how many customers bought an item over a certain amount. 
SELECT DISTINCT
Sold_For AS Orders_Sold_for, 
Item_ID AS Orders_Item_ID,
Customer_ID AS Orders_Customer_ID
FROM Orders WHERE (Sold_For) >= 200.00
ORDER BY Sold_For DESC;

-- Subqueries for finding which pokemon cards are holo, ordered by the highest grade at top
SELECT * 
FROM Items
WHERE Item_Name LIKE '%holo%'
ORDER BY Grading DESC; 

-- Group by query - finding the amount of item sold, and the sum of amount sold.
SELECT Items.Item_Name, items.item_price, orders.postage_packaging, orders.total_price,
count(orders.sold_for) AS Total_Item_Sold,
sum(orders.sold_for) AS Total_Amount_Sold
FROM orders
LEFT JOIN items on orders.item_id = items.item_id
GROUP BY items.item_name
ORDER BY sold_for ASC;

-- Procedure to find non holo sales sold for more than 50GBP and joining 3 tables to get a result of item name, item price, sold price, dispatch details
DELIMITER $$
CREATE PROCEDURE NonHoloSales()
BEGIN
	SELECT items.item_id, item_name, item_price, grading, item_set, set_number, quantity, sold_for, postage_packaging, total_price, sale_date, paid_on_date, post_by_date, dispatch_date, delivery_service
    FROM  items
    INNER JOIN Orders on orders.item_id = items.item_id 
    INNER JOIN transactions on transactions.item_ID =items.item_id 
    WHERE sold_for >= 50 AND item_name NOT LIKE '%holo%'
    order by item_price;
END $$
delimiter ; 

CALL NonHoloSales();

-- To show procedure works
SELECT * FROM orders INNER JOIN items ON items.item_id = orders.item_id INNER JOIN transactions ON transactions.item_id = orders.item_id WHERE item_name NOT LIKE '%holo%';

-- Attempt to create a view of items sold by joining 4 tables - but not including sensitive data like name and address.
-- Table likely to be used for tax purposes
CREATE VIEW vwitems_sold AS
SELECT DISTINCT i.item_name, i.item_Price, o.sold_For, o.total_price, o.sale_date, c.customer_ID, t.paid_on_date, t.dispatch_date
FROM items i, Orders o, customers c, transactions t
WHERE c.customer_ID = t.customer_ID and i.item_ID = o.item_ID and i.item_ID = t.item_ID and o.customer_ID = c.customer_ID
ORDER BY o.sale_date;

SELECT * FROM vwitems_sold;

-- end of code