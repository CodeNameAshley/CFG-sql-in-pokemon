CREATE DATABASE pokemonshop;

USE pokemonshop;

CREATE TABLE Customers (
    Customer_ID INT NOT NULL PRIMARY KEY auto_increment,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NULL
);

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
(008, 'Kevin', 'Gnapoor'),
(009, 'Sharon', 'Norbury'),
(010, 'Ron', 'Duvall'),
(011, 'Shane', 'Oman'),
(012, 'Trang', 'Pak'),
(013, 'Amber', "D'Alessio"),
(014, 'Bethany', 'Byrd'),
(015, 'Glen', 'Coco');

SELECT * FROM Customers;

CREATE TABLE Address (
	Customer_ID INT NOT NULL,
    House_Number VARCHAR(50),
    Street VARCHAR(50)NOT NULL,
    AddressLine2 VARCHAR(50) ,
    City VARCHAR(50),
    County VARCHAR(50),
    PostCode VARCHAR(50) NOT NULL,
    Country VARCHAR(50)
    );

INSERT INTO Address
(Customer_ID, House_Number, Street, AddressLine2, City, County, PostCode, Country)
VALUES
(001, 42, 'Laverne Close', NULL, 'Bridgwater', NULL, 'TT16 4EN', 'United Kingdom'),
(002,35, 'Blackpool Row;', NULL, 'Newtownabbey', 'Antrim', 'BT36 4QD', 'United Kingdom'),
(003, 61, 'Vicarage Avenue', NULL, 'Tonypandy', 'Glamorgan', 'CW20 1HR', 'United Kingdom'), 
(004, 250, 'Kingsvale Park', NULL, 'Belfast', 'Antrim', 'BA89 7BY', 'United Kingdom'),
(005, 160, 'Kensington Gardens', NULL, 'Bangor', 'Down', 'BK10 1QP', 'United Kingdom'), 
(006, 40, 'St Mews Road', NULL, 'Perton', 'Wolverhampton', 'WV16 7UN', 'United Kingdom'), 
(007, 81, 'Thyme Street', 'Newport Pagnell', 'Milton Keys', 'Buckinghamshire', 'MK20 8SQ', 'United Kingdom'), 
(008, 'Flat 121', '112 North Western Road', NULL, 'London', NULL, 'NW11 6UU', 'United Kingdom'), 
(009, 10, 'St Golden Road', NULL, 'Newlyn', 'Cornwall', 'TR20 9QQ', 'United Kingdom'), 
(010, 17, 'Coleman', NULL, 'London', NULL, 'NW8 8XD', 'United Kingdom'), 
(011, 12, 'Salters Street', NULL, 'Darlington', 'Durham', 'DL12 2AZ', 'United Kingdom'), 
(012, 101, 'Guestington Road', NULL, 'Great Maplestead', 'Essex', 'CO19 2RN', 'United Kingdom'), 
(013, 251, 'Tappers Close', 'Bloxwich', 'Walsall', 'West Midlands', 'WS13 3UU', 'United Kingdom'), 
(014, 93, 'Braintree Hall Crescent', NULL, 'Rotherham', 'South Yorkshire', 'S61 5EQ', 'United Kingdom'), 
(015, 72, 'Seaforth Avenue', 'Broughty Ferry', 'Dundee', 'Angues', 'DD5 1QB', 'United Kingdom');

ALTER TABLE Address
	ADD CONSTRAINT FK_Address_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID);

SELECT * FROM Address;

CREATE TABLE Items (
    Item_ID INT NOT NULL PRIMARY KEY,
    Item_Name VARCHAR(50) NOT NULL,
    Grading VARCHAR(25),
    Item_Set VARCHAR(50),
    Set_Number VARCHAR(20),
    Quantity INT NOT NULL
    );
    
INSERT INTO Items
(Item_ID, Item_Name, Grading, Item_Set, Set_Number, Quantity)
VALUES
(2287, 'Kabutops Holo Rare', 'PSA 8', 'Neo Discovery', 6, 1),
(2087, 'Machamp 1st Edition Holo', 'PSA 8', 'Base Set', 8, 1),
(1845, 'Ho-Oh Holo Rare', NULL, 'Call of Legends', 'SL5', 1),
(2695, 'Togetic 1st Edition', 'PSA 8', 'Neo Genesis', 16, 1),
(2463, 'Scyther Ex Holo Rare', 'PSA 8', 'Ruby & Sapphire', 102, 1),
(9129, 'Dark Charizard 1st Edition', 'PSA 8', 'Team Rocket', 21, 1),
(1518, 'Skarmory 1st Edition Holo Rare', 'PSA 6', 'Neo Genesis', 13, 1),
(9039, 'Charizard Holo Rare', 'PSA 7', 'Base Set 2', 4, 1),
(2800, 'Dark Magician 1st Edition', NULL, 'Legends of Blue Eyes', 005, 1),
(6534, 'Umbreon Holo Rare Japanese', 'PSA 8', 'Neo Discovery', 197, 1),
(7595, 'Raikou Holo Rare', NULL, 'Call of Legends', 'SL9', 1),
(6739, 'Blaines Arcanine Holo Rare', NULL, 'Gym Challenge', 1, 1),
(7563, 'Pikachu No Rarity Japanese', 'PSA 10', 'Base Set', 25, 1),
(4947, 'Deoxys Holo Rare', NULL, 'Call of Legends', 'SL1', 1),
(2591, 'Rayquaza Holo Rare', 'PSA 7', 'Call of Legends', 'SL10', 1);

SELECT * FROM ITEMS;

CREATE TABLE Orders (
	Order_ID INT NOT NULL PRIMARY KEY,
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
(230490, 2287, 63.00, 5.57, 68.57, 20210712, 001),
(230329, 2087, 100, 5.57, 105.57, 20210707, 002), 
(230236, 1845, 65.00, 5.57, 70.57, 20210704, 003),
(230130, 2695, 95.00, 5.57, 100.57, 20210621, 004),
(230081, 2463, 92.00, 5.57, 97.57, 20210629, 005),
(229900, 9129, 210.00, 5.57, 215.57, 20210621, 006),
(229733, 1518, 60.00, 5.57, 65.57, 20210618, 007),
(229529, 9039, 330.00, 5.57, 335.57, 20210613, 008),
(229490, 2800, 115.00, 5.57, 120.57, 20210611, 009),
(229477, 6534, 200.00, 0.00, 200.00, 20210610, 010),
(228844, 7595, 130.00, 5.57, 135.57, 20210523, 011),
(228780, 6739, 55.00, 2.25, 57.25, 20210521, 012),
(228481, 7563, 32000.00, 0.00, 32000.00, 20210513, 013),
(228340, 4947, 190.00, 5.57, 195.57, 20210509, 014),
(227951, 2591, 265.00, 5.57, 270.57, 20210429, 015);

ALTER TABLE Orders
	ADD CONSTRAINT FK_Order_Item_ID
    FOREIGN KEY (Item_ID)
    REFERENCES Items(Item_ID);

ALTER TABLE Orders
	ADD CONSTRAINT FK_Order_Customer_ID
    FOREIGN KEY (Customer_ID)
    REFERENCES Customers(Customer_ID);

SELECT * FROM Orders
ORDER BY Customer_ID ASC;

CREATE TABLE Transactions (
	Transaction_ID INT NOT NULL, 
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
(101, 230490, 2287, 001, 20210712, 20210714, 20210713, 'Royal Mail 1st Class', 'SE130699', 1),
(102, 230329, 2087, 002, 20210707, 20210709, 20210708, 'Royal Mail 1st Class', 'SE130661', 1),
(103, 230336, 1845, 003, 20210704, 20210706, 20210706, 'Royal Mail 1st Class', 'SE130633', 1),
(104, 230130, 2695, 004, 20210630, 20210702, 20210701, 'Royal Mail 1st Class', 'SE130589', 0),
(105, 230081, 2463, 005, 20210620, 20210701, 20210630, 'Royal Mail 1st Class', 'SE130577', 0),
(106, 229900, 9129, 006, 20210623, 20210625, 20210624, 'Royal Mail 1st Class', 'SE130518', 1),
(107, 229733, 1518, 007, 20210618, 20210622, 20210621, 'Royal Mail 1st Class', 'SE130482', 0),
(108, 229529, 9039, 008, 20210614, 20210616, 20210614, 'Royal Mail 1st Class', 'SE130419', 0),
(109, 229490, 2800, 009, 20210612, 20210615, 20210614, 'Royal Mail 1st Class', 'SE130418', 0),
(110, 229477, 6534, 010, 20210610, 20210614, 20210610, 'Royal Mail 1st Class', 'SE130397', 1),
(111, 228844, 7595, 011, 20210523, 20210525, 20210521, 'Royal Mail 1st Class', 'SE130221', 0),
(112, 228780, 6739, 012, 20210521, 20210521, 20210523, 'Royal Mail 1st Class', 'KB125678', 0),
(113, 228481, 7563, 013, 20210521, 20210517, 20210514, 'Royal Mail 1st Class', 'KB125649', 1),
(114, 228340, 4947, 014, 20210509, 20210511, 20210511, 'Royal Mail 1st Class', 'SE130108', 1),
(115, 227951, 2591, 015, 20210429, 20210504, 20210430, 'Royal Mail 1st Class', 'SE129988', 1);

SET foreign_key_checks = 0;

ALTER TABLE Transactions
	ADD CONSTRAINT FK_Transactions_Order_ID
    FOREIGN KEY (Order_ID)
    REFERENCES Orders(Order_ID);

ALTER TABLE Transactions
	ADD CONSTRAINT FK_Transactions_Item_ID
    FOREIGN KEY (Item_ID)
    REFERENCES Items(Item_ID);

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

-- Inner Join Clause to find when customer bought an item ordered by date ascending
SELECT Customers.Customer_ID,
Customers.First_Name,
Customers.Last_Name,
Orders.Item_ID,
Orders.Sold_For,
Orders.Sale_Date
FROM Customers
INNER JOIN Orders on Customers.Customer_ID = Orders.Customer_ID
ORDER BY Orders.Sale_Date ASC;

-- Stored Function that puts a customer in membership levels depending on amount spent in shop
DELIMITER //
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
END// Sold_For
DELIMITER ;


SELECT
Customer_ID,
Sold_For,
Order_ID,
Item_ID,
Sale_Date,
Spendinglevel(Sold_For)
from Orders;