CREATE DATABASE `ManagerSupplies`;

USE `ManagerSupplies`;

CREATE TABLE `Supplies`(   # VAT TU 
`Supplies_id` INT AUTO_INCREMENT PRIMARY KEY,
`Supplies_code` INT NOT NULL,
`Supplies_name` VARCHAR(50) NOT NULL,
`Unit` FLOAT NOT NULL,
`Price`FLOAT NOT NULL);

CREATE TABLE `Inventory`(   # TON KHO 
`id` INT AUTO_INCREMENT PRIMARY KEY,  
`Supplies_id` INT,			# vat tu 
`initial` FLOAT NOT NULL,   # SO LUONG BAN DAU 
`total_initial` FLOAT NOT NULL,  # TONG DO LUONG NHAP 
`total_output` FLOAT NOT NULL);  # TONG SO LUONG XUAT

CREATE TABLE `supplier`(    # NHÀ CUNG CẤP 
`supplier_id` INT AUTO_INCREMENT PRIMARY KEY,
`supplier_code` INT,
`supplier_name` VARCHAR(50) NOT NULL, # TÊN NHÀ CUNG CẤP 
`address` VARCHAR(50) NOT NULL,    # ĐỊA CHỈ 
`phoneNumber` VARCHAR(50) NOT NULL); # SỐ ĐIỆN THOẠI 

CREATE TABLE `orders`( # ĐƠN ĐẶT HÀNG
`orders_id` INT AUTO_INCREMENT PRIMARY KEY,
`orders_code` INT,
`day_order` DATE NOT NULL,   # đơn hàng
`supplier_id` INT);

CREATE TABLE `billInput`( # PHIẾU NHẬP 
`bill_id` INT AUTO_INCREMENT PRIMARY KEY,
`billCoder` INT NOT NULL,
`day_input` DATE NOT NULL,
`orders_id` INT
);

CREATE TABLE `billOutput`( # phiếu xuất 
`billOutput_id` INT AUTO_INCREMENT PRIMARY KEY,
`billOutput_code` INT,
`day_output` DATE NOT NULL,
`customer_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `orderDetails`(     # CHI TIET DON HANG 
`orderDetails_id` INT AUTO_INCREMENT PRIMARY KEY,
`orders_id` INT,			#  ĐƠN ĐẶT HÀNG
`Supplies_id`INT,			#  VAT TU
`amount` FLOAT NOT NULL);   #  SO LUONG DAT HANG

CREATE TABLE `DetailsBillInput`(     # CHI TIET PHIEU NHAP 
`DetailsBillInput_id` INT AUTO_INCREMENT PRIMARY KEY,
`bill_id` INT,						# PHIẾU NHẬP
`Supplies_id` INT,					# VAT TU 
`amount_input` FLOAT NOT NULL,		# SO LUONG NHAP 
`input_price` FLOAT NOT NULL,		# DON GIA NHAP 
`note`TEXT NULL);					# GHI CHU 

CREATE TABLE `DetailsBillOutput`(    # CHI TIET PHIEU XUAT 
`DetailsBillOutput_id` INT AUTO_INCREMENT PRIMARY KEY,
`billOutput_id`INT,					# phieu xuat 
`Supplies_id`INT,					# vat tu 
`amount_ouput`INT,					# so luong xuat 
`price_output`FLOAT NOT NULL,					# gia xuat 
`note`TEXT NULL);								# ghi chu 

ALTER TABLE `ManagerSupplies`.`Inventory`
ADD FOREIGN KEY(`Supplies_id`)
REFERENCES `Supplies`(`Supplies_id`);

ALTER TABLE `ManagerSupplies`.`orders`
ADD FOREIGN KEY(`supplier_id`)
REFERENCES `supplier`(`supplier_id`);

ALTER TABLE `ManagerSupplies`.`billInput`
ADD FOREIGN KEY(`orders_id`)
REFERENCES `orders`(`orders_id`);

ALTER TABLE `ManagerSupplies`.`orderDetails`
ADD FOREIGN KEY(`orders_id`)
REFERENCES `orders`(`orders_id`);

ALTER TABLE `ManagerSupplies`.`orderDetails`
ADD FOREIGN KEY(`Supplies_id`)
REFERENCES `Supplies`(`Supplies_id`);

ALTER TABLE `ManagerSupplies`.`DetailsBillInput`
ADD FOREIGN KEY(`bill_id`)
REFERENCES `billInput`(`bill_id`);

ALTER TABLE `ManagerSupplies`.`DetailsBillOutput`
ADD FOREIGN KEY(`billOutput_id`)
REFERENCES `billOutput`(`billOutput_id`);

INSERT INTO `ManagerSupplies`.`Supplies` (`Supplies_id`, `Supplies_code`, `Supplies_name`, `Unit`, `Price`)
 VALUES (1, 101, 'Xi Mang', 500, 5000);
INSERT INTO `ManagerSupplies`.`Supplies` (`Supplies_id`, `Supplies_code`, `Supplies_name`, `Unit`, `Price`)
 VALUES (2, 102, 'Cat', 100, 2000);
INSERT INTO `ManagerSupplies`.`Supplies` (`Supplies_id`, `Supplies_code`, `Supplies_name`, `Unit`, `Price`) 
VALUES (3, 103, 'Da', 200, 3000);
INSERT INTO `ManagerSupplies`.`Supplies` (`Supplies_id`, `Supplies_code`, `Supplies_name`, `Unit`, `Price`)
 VALUES (4, 104, 'Dat', 11, 2000);
INSERT INTO `ManagerSupplies`.`Supplies` (`Supplies_id`, `Supplies_code`, `Supplies_name`, `Unit`, `Price`)
 VALUES (5, 105, 'Sat', 30, 5000);

INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (01, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (02, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (03, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (04, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (05, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (01, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (02, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (03, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (04, 50, 50, 20);
 INSERT INTO `ManagerSupplies`.`Inventory` (`Supplies_id`, `initial`, `total_initial`, `total_output`)
 VALUES (5, 50, 50, 20);

INSERT INTO `ManagerSupplies`.`supplier` (`supplier_id`, `supplier_code`, `supplier_name`, `address`, `phoneNumber`)
 VALUES (1, 1, 'Bac Dang', 'Ha Noi', '0901123456');
 INSERT INTO `ManagerSupplies`.`supplier` (`supplier_id`, `supplier_code`, `supplier_name`, `address`, `phoneNumber`)
 VALUES (2, 2, 'Bac Dang', 'Ha Noi', '0901123456');
 INSERT INTO `ManagerSupplies`.`supplier` (`supplier_id`, `supplier_code`, `supplier_name`, `address`, `phoneNumber`)
 VALUES (3, 3, 'Bac Dang', 'Ha Noi', '0901123456');

INSERT INTO `ManagerSupplies`.`orders` (`orders_code`, `day_order`, `supplier_id`)
 VALUES (01, '2021-02-28', 1);
 INSERT INTO `ManagerSupplies`.`orders` (`orders_code`, `day_order`, `supplier_id`)
 VALUES (02, '2021-04-28', 2);
 INSERT INTO `ManagerSupplies`.`orders` (`orders_code`, `day_order`, `supplier_id`)
 VALUES (03, '2021-06-28', 3);

INSERT INTO `ManagerSupplies`.`billInput` (`bill_id`, `billCoder`, `day_input`, `orders_id`)
 VALUES (1,1,'2020-02-20', 1);
 INSERT INTO `ManagerSupplies`.`billInput` (`bill_id`, `billCoder`, `day_input`, `orders_id`)
 VALUES (2,1,'2020-02-20', 2);
 INSERT INTO `ManagerSupplies`.`billInput` (`bill_id`, `billCoder`, `day_input`, `orders_id`)
 VALUES (3,1,'2020-02-20', 3);

INSERT INTO `ManagerSupplies`.`billOutput` (`billOutput_code`, `day_output`, `customer_name`) VALUES (1, '2021-2-22', 'NONAME');
INSERT INTO `ManagerSupplies`.`billOutput` (`billOutput_code`, `day_output`, `customer_name`) VALUES (2, '2021-12-12', 'SDF');
INSERT INTO `ManagerSupplies`.`billOutput` (`billOutput_code`, `day_output`, `customer_name`) VALUES (3, '2021-02-22', 'AFSDF');


INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (1, 1, 30000);
INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (2, 2, 30000);
INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (3, 3, 30000);
INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (4, 4, 30000);
INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (5, 5, 30000);
INSERT INTO `ManagerSupplies`.`orderDetails` (`orders_id`, `Supplies_id`, `amount`) VALUES (1, 1, 30000);

INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (1, 1, 50000, 50000, 'AJDSHFA');
INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (2, 2, 50000, 50000, 'AJDSHFA');
 INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (3, 3, 50000, 50000, 'AJDSHFA');
 INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (1, 1, 50000, 50000, 'AJDSHFA');
 INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (2, 2, 50000, 50000, 'AJDSHFA');
 INSERT INTO `ManagerSupplies`.`DetailsBillInput` (`bill_id`, `Supplies_id`, `amount_input`, `input_price`, `note`)
 VALUES (1, 1, 50000, 50000, 'AJDSHFA');

INSERT INTO `ManagerSupplies`.`DetailsBillOutput` (`billOutput_id`, `Supplies_id`, `amount_ouput`, `price_output`, `note`)
 VALUES (3, 1, 600000, 600000, 'GSFDGSFD');
 INSERT INTO `ManagerSupplies`.`DetailsBillOutput` (`billOutput_id`, `Supplies_id`, `amount_ouput`, `price_output`, `note`)
 VALUES (4, 1, 600000, 600000, 'GSFDGSFD');
 INSERT INTO `ManagerSupplies`.`DetailsBillOutput` (`billOutput_id`, `Supplies_id`, `amount_ouput`, `price_output`, `note`)
 VALUES (5, 1, 600000, 600000, 'GSFDGSFD');
 INSERT INTO `ManagerSupplies`.`DetailsBillOutput` (`billOutput_id`, `Supplies_id`, `amount_ouput`, `price_output`, `note`)
 VALUES (3, 1, 600000, 600000, 'GSFDGSFD');
 INSERT INTO `ManagerSupplies`.`DetailsBillOutput` (`billOutput_id`, `Supplies_id`, `amount_ouput`, `price_output`, `note`)
 VALUES (4, 1, 600000, 600000, 'GSFDGSFD');
 
