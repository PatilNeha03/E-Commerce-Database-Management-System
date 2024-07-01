#DDls

show create table Address;

CREATE TABLE `Address` (
  `userID` int NOT NULL,
  `street_name` varchar(20) NOT NULL,
  `city` varchar(20) DEFAULT NULL,
  `zip_code` varchar(20) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Consumer` (`userID`)
) ;

show create table Amazon_order;

CREATE TABLE `Amazon_order` (
  `Order_ID` int NOT NULL,
  `order_date` date DEFAULT NULL,
  `order_details` varchar(40) DEFAULT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `order_summary` varchar(40) DEFAULT NULL,
  `item_price` int NOT NULL,
  `tax` int NOT NULL,
  `grand_total` int DEFAULT NULL,
  `invoiceID` varchar(40) NOT NULL,
  `userID` int DEFAULT NULL,
  PRIMARY KEY (`Order_ID`),
  KEY `invoiceID` (`invoiceID`),
  KEY `userID` (`userID`),
  CONSTRAINT `amazon_order_ibfk_1` FOREIGN KEY (`invoiceID`) REFERENCES `Invoice` (`invoiceID`),
  CONSTRAINT `amazon_order_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `Amazon_User_Account` (`UserID`)
) ;

show create table Amazon_User_Account;

CREATE TABLE `Amazon_User_Account` (
  `UserID` int NOT NULL,
  `User_Type` varchar(12) DEFAULT NULL,
  `Password` varchar(20) DEFAULT NULL,
  `Name_User` char(30) DEFAULT NULL,
  `SubscriptionID` varchar(10) DEFAULT NULL,
  `Payment_ID` int DEFAULT NULL,
  PRIMARY KEY (`UserID`),
  KEY `SubscriptionID` (`SubscriptionID`),
  CONSTRAINT `amazon_user_account_ibfk_1` FOREIGN KEY (`SubscriptionID`) REFERENCES `SUBSCRIPTION` (`SubscriptionID`)
) ;

show create table carrier;

CREATE TABLE `carrier` (
  `Carrier_ID` int NOT NULL,
  `carrier_Name` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Carrier_ID`)
) ;

show create table consumer;

CREATE TABLE `consumer` (
  `userID` int NOT NULL,
  `Cons_password` varchar(20) NOT NULL,
  `is_prime` varchar(20) DEFAULT NULL,
  `cons_name` varchar(20) NOT NULL,
  `phone_no` bigint DEFAULT NULL,
  `Payment_ID` int DEFAULT NULL,
  PRIMARY KEY (`userID`),
  KEY `Payment_ID` (`Payment_ID`),
  CONSTRAINT `consumer_ibfk_1` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`)
) ;

show create table holds;

CREATE TABLE `holds` (
  `warehouseID` int NOT NULL,
  `ItemID` int NOT NULL,
  PRIMARY KEY (`warehouseID`,`ItemID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `holds_ibfk_1` FOREIGN KEY (`warehouseID`) REFERENCES `warehouse` (`WarehouseID`),
  CONSTRAINT `holds_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `Item` (`ItemID`)
) ;

show create table invoice;

CREATE TABLE `invoice` (
  `invoiceID` varchar(40) NOT NULL,
  `Payment_ID` int NOT NULL,
  PRIMARY KEY (`invoiceID`),
  KEY `Payment_ID` (`Payment_ID`),
  CONSTRAINT `invoice_ibfk_1` FOREIGN KEY (`Payment_ID`) REFERENCES `Payment` (`Payment_ID`)
) ;

show create table item;

CREATE TABLE `item` (
  `ItemID` int NOT NULL,
  `Item_name` varchar(40) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `item_price` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `Order_ID` int DEFAULT NULL,
  `Review_ID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `UserID` (`UserID`),
  KEY `Review_ID` (`Review_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Amazon_User_Account` (`UserID`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`Review_ID`) REFERENCES `Review` (`Review_ID`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `Amazon_Order` (`Order_ID`)
) ;

show create table Item;

CREATE TABLE `Item` (
  `ItemID` int NOT NULL,
  `Item_name` varchar(40) DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `item_price` int DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `discount` varchar(10) DEFAULT NULL,
  `Order_ID` int DEFAULT NULL,
  `Review_ID` int DEFAULT NULL,
  `UserID` int DEFAULT NULL,
  PRIMARY KEY (`ItemID`),
  KEY `UserID` (`UserID`),
  KEY `Review_ID` (`Review_ID`),
  KEY `Order_ID` (`Order_ID`),
  CONSTRAINT `item_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `Amazon_User_Account` (`UserID`),
  CONSTRAINT `item_ibfk_2` FOREIGN KEY (`Review_ID`) REFERENCES `Review` (`Review_ID`),
  CONSTRAINT `item_ibfk_3` FOREIGN KEY (`Order_ID`) REFERENCES `Amazon_Order` (`Order_ID`)
) ;

show create table item_order;

CREATE TABLE `item_order` (
  `order_ID` int NOT NULL,
  `ItemID` int NOT NULL,
  PRIMARY KEY (`order_ID`,`ItemID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `item_order_ibfk_1` FOREIGN KEY (`order_ID`) REFERENCES `Amazon_Order` (`Order_ID`),
  CONSTRAINT `item_order_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `Item` (`ItemID`)
) ;

show create table payment;

CREATE TABLE `payment` (
  `Payment_ID` int NOT NULL,
  `Payment_method` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`Payment_ID`)
) ;

show create table review;

CREATE TABLE `review` (
  `Review_ID` int NOT NULL,
  `review_date` date DEFAULT NULL,
  `rating` decimal(5,2) DEFAULT NULL,
  `userID` int NOT NULL,
  PRIMARY KEY (`Review_ID`),
  KEY `userID` (`userID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Consumer` (`userID`)
) ;

show create table seller;

CREATE TABLE `seller` (
  `UserID` int NOT NULL,
  `CompanyName` varchar(20) DEFAULT NULL,
  `SellerType` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `user_type` varchar(10) DEFAULT NULL,
  `Name_Seller` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`UserID`)
) ;

show create table shipped_by;

CREATE TABLE `shipped_by` (
  `TravelingID` int NOT NULL,
  `Order_ID` int DEFAULT NULL,
  `Carrier_ID` int DEFAULT NULL,
  `shipping_status` varchar(20) DEFAULT NULL,
  `shipping_method` varchar(40) DEFAULT NULL,
  `shipping_date` date DEFAULT NULL,
  PRIMARY KEY (`TravelingID`),
  KEY `Order_ID` (`Order_ID`),
  KEY `Carrier_ID` (`Carrier_ID`),
  CONSTRAINT `shipped_by_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `Amazon_Order` (`Order_ID`),
  CONSTRAINT `shipped_by_ibfk_2` FOREIGN KEY (`Carrier_ID`) REFERENCES `Carrier` (`Carrier_ID`)
) ;

show create table shopping_cart;

CREATE TABLE `shopping_cart` (
  `userID` int NOT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `shopping_cart_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Consumer` (`userID`)
) ;

show create table shoppingcart_item;

CREATE TABLE `shoppingcart_item` (
  `userID` int NOT NULL,
  `ItemID` int NOT NULL,
  PRIMARY KEY (`userID`,`ItemID`),
  KEY `ItemID` (`ItemID`),
  CONSTRAINT `shoppingcart_item_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Amazon_User_Account` (`UserID`),
  CONSTRAINT `shoppingcart_item_ibfk_2` FOREIGN KEY (`ItemID`) REFERENCES `Item` (`ItemID`)
) ;

show create table subscription;

CREATE TABLE `subscription` (
  `SubscriptionID` varchar(10) NOT NULL,
  `Start_Date` date DEFAULT NULL,
  `End_Date` date DEFAULT NULL,
  PRIMARY KEY (`SubscriptionID`)
) ;

show create table warehouse;

CREATE TABLE `warehouse` (
  `WarehouseID` int NOT NULL,
  `warehouse_name` varchar(40) DEFAULT NULL,
  `Location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`WarehouseID`)
) ;

show create table wishlist;

CREATE TABLE `wishlist` (
  `userID` int NOT NULL,
  `date_added` date DEFAULT NULL,
  PRIMARY KEY (`userID`),
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `Consumer` (`userID`)
) ;

#DMLs
#1
select i.item_name, Count(io.Itemid) as orderCount
from item as i
left join item_order as io on i.itemid = io.itemid
group by i.item_name
order by ordercount desc
limit 10;

#2
SELECT
  s.UserID AS SellerID,
  s.CompanyName,
  s.SellerType,
  COUNT(i.ItemID) AS ItemsSold,
  SUM(i.quantity) AS TotalQuantitySold
FROM
  seller s
LEFT JOIN
  item i ON s.UserID = i.UserID
WHERE
  i.Order_ID IS NOT NULL 
GROUP BY
  s.UserID, s.CompanyName, s.SellerType
ORDER BY
  ItemsSold DESC
  limit 10;
  
  #3
  Select
  u.userID,
  u.Name_User as UserName,
  u.user_type as user_type,
  c.is_prime as IsPrimeMember,
  s.subscriptionID,
  s.start_date as subscriptionStartDate,
  s.end_date as subscriptionEndDate
  from
  Amazon_User_Account u
  left join
  subscription s on u.subscriptionID = s.subscriptionID
  left join
  consumer c on u.userID = c.userID
  where u.subscriptionID is not null
  order by
  u.userID
  limit 10;
  
  #4
  select
  c.userID as consumerID,
  c.cons_name as consumerName,
  count(o.order_ID) as TotalOrders,
  min(o.order_date) as FirstOrderDate,
  max(o.order_date) as LatestOrderDate,
  datediff(max(o.order_date),min(o.order_date)) as DaysBetweenFirstAndLast
  from consumer c
  join
  amazon_order o on c.userID = o.userID
  group by
  c.userID,c.cons_name
  order by
  totalorders desc
  limit 10;
  
  #5
  SELECT
  a.userID AS UserID,
  a.street_name,
  a.city,
  a.zip_code,
  a.state,
  o.Order_ID,
  o.order_date,
  o.order_details,
  o.payment_method,
  o.order_summary,
  o.item_price,
  o.tax,
  o.grand_total,
  u.User_Type,
  u.Name_User,
  u.SubscriptionID
FROM
  (SELECT
    c.userID,
    c.street_name,
    c.city,
    c.zip_code,
    c.state
  FROM
    Address c) AS a
JOIN
  (SELECT
    o.Order_ID,
    o.order_date,
    o.order_details,
    o.payment_method,
    o.order_summary,
    o.item_price,
    o.tax,
    o.grand_total,
    o.userID
  FROM
    Amazon_Order o) AS o ON a.userID = o.userID
JOIN
  (SELECT
    u.UserID,
    u.User_Type,
    u.Name_User,
    u.SubscriptionID
  FROM
    Amazon_User_Account u) AS u ON o.userID = u.UserID
    limit 10;
    
    #6
    Select
    ao.Order_ID,
    ao.order_date,
    ao.order_details,
    ao.payment_method,
    ao.order_summary,
    ao.item_price,
    ao.tax,
    ao.grand_total,
    ao.invoiceID,
    ao.userID,
    (
		select avg(ao1.grand_total)
		from amazon_order ao1
		where ao1.userID=ao.userID
    ) as avg_grand_total
from
amazon_order ao
limit 10;

  
  
