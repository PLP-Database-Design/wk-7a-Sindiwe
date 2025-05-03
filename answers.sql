-- Create normalized table for 1NF structure
CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100)
);

-- Insert data in 1NF format (one product per row)
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Laptop');
INSERT INTO ProductDetail_1NF VALUES (101, 'John Doe', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Tablet');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Keyboard');
INSERT INTO ProductDetail_1NF VALUES (102, 'Jane Smith', 'Mouse');
INSERT INTO ProductDetail_1NF VALUES (103, 'Emily Clark', 'Phone');

-- Create Orders table to store OrderID and CustomerName
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Insert unique order and customer data
INSERT INTO Orders VALUES (101, 'John Doe');
INSERT INTO Orders VALUES (102, 'Jane Smith');
INSERT INTO Orders VALUES (103, 'Emily Clark');

-- Create OrderDetails table with only attributes that fully depend on composite key (OrderID + Product)
CREATE TABLE OrderDetails_2NF (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Insert normalized order item data
INSERT INTO OrderDetails_2NF VALUES (101, 'Laptop', 2);
INSERT INTO OrderDetails_2NF VALUES (101, 'Mouse', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Tablet', 3);
INSERT INTO OrderDetails_2NF VALUES (102, 'Keyboard', 1);
INSERT INTO OrderDetails_2NF VALUES (102, 'Mouse', 2);
INSERT INTO OrderDetails_2NF VALUES (103, 'Phone', 1);
