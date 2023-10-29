/*Merging File to Create a Master Table (Table Created are based on the requirements of Bank Muamalat */
CREATE TABLE bankmuamalat-403510.BankMuamalatProject.TableMasterMerged AS
SELECT
  c.CustomerEmail AS cust_email,
  c.CustomerCity AS cust_city,
  o.Date AS order_date,
  o.Quantity AS order_qty,
  p.ProdName AS product_name,
  p.Price AS product_price,
  pc.CategoryName AS category_name,
  (o.Quantity * p.Price) AS total_sales
FROM
  `bankmuamalat-403510.BankMuamalatProject.Customers` AS c
JOIN
  `bankmuamalat-403510.BankMuamalatProject.Orders` AS o
  ON c.CustomerID = o.CustomerID
JOIN
  `bankmuamalat-403510.BankMuamalatProject.Products` AS p
  ON o.ProdNumber = p.ProdNumber
JOIN
  `bankmuamalat-403510.BankMuamalatProject.ProductCategory` AS pc
  ON p.Category = pc.CategoryID;

/*Selecting the Column to sort the data based on the requirements */
SELECT
  order_date,
  category_name,
  product_name,
  product_price,
  order_qty,
  total_sales,
  cust_email,
  cust_city
FROM `bankmuamalat-403510.BankMuamalatProject.TableMasterMerged`
ORDER BY order_date; /*Date sort based on the oldest to the latest */