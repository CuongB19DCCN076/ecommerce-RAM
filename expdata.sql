﻿--
-- Script was generated by Devart dbForge Studio for MySQL, Version 9.2.34.0
-- Product home page: http://www.devart.com/dbforge/mysql/studio
-- Script date 11/29/2023 11:08:34 AM
-- Server version: 11.2.0
-- Client version: 4.1
--


SET NAMES 'utf8';
CREATE TABLE tttn.tblproduct (
  id VARCHAR(36) NOT NULL,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(18, 4) NOT NULL,
  pin VARCHAR(255) NOT NULL,
  screen VARCHAR(50) NOT NULL,
  system VARCHAR(255) NOT NULL,
  chip VARCHAR(50) NOT NULL,
  camera VARCHAR(50) NOT NULL,
  charger VARCHAR(50) NOT NULL,
  `describe` TEXT NOT NULL,
  createAt DATETIME DEFAULT NULL,
  updateAt DATETIME DEFAULT NULL,
  quantityInStock INT(10) NOT NULL,
  status INT(10) NOT NULL,
  launchDate DATETIME DEFAULT NULL,
  quantitySold INT(10) NOT NULL,
  rating INT(10) NOT NULL,
  ram VARCHAR(255) NOT NULL,
  memory VARCHAR(255) NOT NULL,
  color VARCHAR(255) NOT NULL,
  image VARCHAR(255) NOT NULL,
  videoIntro TEXT DEFAULT NULL,
  videoReview TEXT DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1927,
CHARACTER SET utf32,
COLLATE utf32_general_ci;

INSERT INTO tttn.tbladmin(id) VALUES
('dfdded72-6c31-11ee-b528-54ab3a476a5d');
CREATE TABLE tttn.tblmember (
  id VARCHAR(36) NOT NULL,
  name VARCHAR(50) DEFAULT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  phone VARCHAR(50) DEFAULT NULL,
  address VARCHAR(255) DEFAULT NULL,
  avatar VARCHAR(255) DEFAULT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1927,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'thành viên';
ALTER TABLE tttn.tblmember 
  ADD UNIQUE INDEX email(email);

CREATE TABLE tttn.tbladmin (
  id VARCHAR(36) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'quản trị viên';

ALTER TABLE tttn.tbladmin 
  ADD CONSTRAINT FK_tbladmin_id FOREIGN KEY (id)
    REFERENCES tttn.tblmember(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tbluser (
  id VARCHAR(36) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 1170,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'người dùng';

ALTER TABLE tttn.tbluser 
  ADD CONSTRAINT FK_tbluser_id FOREIGN KEY (id)
    REFERENCES tttn.tblmember(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tblcart (
  id VARCHAR(36) NOT NULL,
  tblUserid VARCHAR(36) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2048,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'giỏ hàng';

ALTER TABLE tttn.tblcart 
  ADD UNIQUE INDEX tblUserid(tblUserid);

CREATE TABLE tttn.tblcartproduct (
  id VARCHAR(36) NOT NULL,
  tblProductid VARCHAR(36) NOT NULL,
  tblCartid VARCHAR(36) NOT NULL,
  quantity INT(10) NOT NULL,
  totalPriceCart DECIMAL(18, 4) NOT NULL,
  priceByOne DECIMAL(18, 4) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 5461,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'sản phẩm thuộc giỏ hàng nào';

ALTER TABLE tttn.tblcartproduct 
  ADD CONSTRAINT FK_tblcartproduct_tblCartid FOREIGN KEY (tblCartid)
    REFERENCES tttn.tblcart(id) ON DELETE NO ACTION;

ALTER TABLE tttn.tblcartproduct 
  ADD CONSTRAINT FK_tblcartproduct_tblProductid FOREIGN KEY (tblProductid)
    REFERENCES tttn.tblproduct(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tblorder (
  idOrder VARCHAR(36) NOT NULL,
  addressShipping VARCHAR(255) NOT NULL,
  totalPrice DECIMAL(18, 4) NOT NULL,
  phoneShipping VARCHAR(50) NOT NULL,
  tblCartid VARCHAR(36) NOT NULL,
  statusShipping VARCHAR(36) NOT NULL,
  tblUserid VARCHAR(36) NOT NULL,
  statusOrder INT(1) NOT NULL,
  createAt DATETIME NOT NULL,
  updateAt DATETIME NOT NULL,
  nameShipping VARCHAR(255) NOT NULL,
  methodPayment INT(1) NOT NULL,
  PRIMARY KEY (idOrder)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 2340,
CHARACTER SET utf32,
COLLATE utf32_general_ci,
COMMENT = 'đơn hàng';

ALTER TABLE tttn.tblorder 
  ADD INDEX FK_tblorder_tblShippingid(statusShipping);

ALTER TABLE tttn.tblorder 
  ADD CONSTRAINT FK_tblorder_tblCartid FOREIGN KEY (tblCartid)
    REFERENCES tttn.tblcart(id) ON DELETE NO ACTION;

ALTER TABLE tttn.tblorder 
  ADD CONSTRAINT FK_tblorder_tblUserid FOREIGN KEY (tblUserid)
    REFERENCES tttn.tbluser(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tblorderproduct (
  tblOrderid VARCHAR(36) NOT NULL,
  tblProductid VARCHAR(36) NOT NULL,
  quantity SMALLINT(6) NOT NULL,
  totalPriceOrder DECIMAL(18, 4) NOT NULL,
  priceByOne DECIMAL(18, 4) NOT NULL
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 3276,
CHARACTER SET utf32,
COLLATE utf32_general_ci;

ALTER TABLE tttn.tblorderproduct 
  ADD INDEX FK_orderproduct_tblOrderid(tblOrderid);

ALTER TABLE tttn.tblorderproduct 
  ADD CONSTRAINT FK_orderproduct_tblProductid FOREIGN KEY (tblProductid)
    REFERENCES tttn.tblproduct(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tblregistration (
  id VARCHAR(36) NOT NULL,
  nameRe VARCHAR(50) NOT NULL,
  phone VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf32,
COLLATE utf32_general_ci;

CREATE TABLE tttn.tblregistrationproduct (
  id VARCHAR(36) NOT NULL,
  tblRegistrationid VARCHAR(36) NOT NULL,
  tblProductid VARCHAR(36) NOT NULL,
  reason TEXT DEFAULT NULL,
  statusRP INT(11) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
AVG_ROW_LENGTH = 16384,
CHARACTER SET utf32,
COLLATE utf32_general_ci;

ALTER TABLE tttn.tblregistrationproduct 
  ADD CONSTRAINT FK_tblregistrationproduct_tblProductid FOREIGN KEY (tblProductid)
    REFERENCES tttn.tblproduct(id) ON DELETE NO ACTION;

ALTER TABLE tttn.tblregistrationproduct 
  ADD CONSTRAINT FK_tblregistrationproduct_tblRegistrationid FOREIGN KEY (tblRegistrationid)
    REFERENCES tttn.tblregistration(id) ON DELETE NO ACTION;

CREATE TABLE tttn.tblwarranty (
  id VARCHAR(36) NOT NULL,
  startDate DATE NOT NULL,
  endDate DATE NOT NULL,
  status INT(11) NOT NULL,
  tblUserid VARCHAR(36) NOT NULL,
  tblProductid VARCHAR(36) NOT NULL,
  tblOrderid VARCHAR(36) NOT NULL,
  codeProduct VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
)
ENGINE = INNODB,
CHARACTER SET utf32,
COLLATE utf32_general_ci;

ALTER TABLE tttn.tblwarranty 
  ADD CONSTRAINT FK_tblwarranty_tblOrderid FOREIGN KEY (tblOrderid)
    REFERENCES tttn.tblorder(idOrder) ON DELETE NO ACTION;

ALTER TABLE tttn.tblwarranty 
  ADD CONSTRAINT FK_tblwarranty_tblProductid FOREIGN KEY (tblProductid)
    REFERENCES tttn.tblproduct(id) ON DELETE NO ACTION;

ALTER TABLE tttn.tblwarranty 
  ADD CONSTRAINT FK_tblwarranty_tblUserid FOREIGN KEY (tblUserid)
    REFERENCES tttn.tbluser(id) ON DELETE NO ACTION;

INSERT INTO tttn.tblcart(id, tblUserid) VALUES
('546bf220-2f2d-4d50-b7e3-109091b1271a', '21954e35-bdef-430b-9eda-abd7bb370733');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('1993cde2-dad2-4cce-a21e-c608a9acfb14', '3fa85f64-5717-4562-b3fc-2c963f66afa6');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('c28c6d9b-02b7-484f-b881-1476d023c3ab', '4d3ff8d8-1916-4a57-b0d4-bd178982e825');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('aba9f880-c9cf-44a2-b7df-950a935a6801', '76780b8e-68f2-40a2-8c44-d32596db3393');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('20b17f61-01ff-47ce-a0da-001046969dd6', '785303b1-6d6f-4063-802e-7ac6ae6cf661');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('4ef8352c-55fe-499c-b4d0-9d79af9d8144', '7a6cf58b-e598-4e37-9bb1-cb8b5214687c');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('77bed403-ad9d-430f-b767-93a534834ae2', '9dcce638-4ffc-4cf5-a350-3ddcc8ccde73');

INSERT INTO tttn.tblcart(id, tblUserid) VALUES('46eaf9b8-2b37-492e-8ad0-332104b1d844', 'd92cd829-75bf-4ebd-89eb-f274af9ffaea');


INSERT INTO tttn.tblcartproduct(id, tblProductid, tblCartid, quantity, totalPriceCart, priceByOne) VALUES
('079d22bc-87f2-4299-8868-96479c3fd0e4', '40bb5d57-fc98-4cb8-8403-35a82304fabd', '4ef8352c-55fe-499c-b4d0-9d79af9d8144', 2, 22222222.0000, 11111111.0000);

INSERT INTO tttn.tblcartproduct(id, tblProductid, tblCartid, quantity, totalPriceCart, priceByOne) VALUES('8e632539-bd88-44f1-a1ae-bfdabc1dcd70', '2eab2867-c23d-4c2f-bc99-b232a137a36b', '77bed403-ad9d-430f-b767-93a534834ae2', 2, 20000000.0000, 10000000.0000);

INSERT INTO tttn.tblcartproduct(id, tblProductid, tblCartid, quantity, totalPriceCart, priceByOne) VALUES('c231332e-0a86-4efd-b4ab-75424ebac6e3', '8750b396-dd90-4bda-92e0-c51a743363c4', '4ef8352c-55fe-499c-b4d0-9d79af9d8144', 2, 15180000.0000, 7590000.0000);


INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES
('027c386e-f348-44c6-ae5e-55786d05cb3b', 'nvcuong', 'nvcuong19042001@gmail.com', '123456', '0966644237', '123431eddsd', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2F027c386e-f348-44c6-ae5e-55786d05cb3b?alt=media&token=abbfb2a5-2a25-4197-926f-34ab15b76245');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('1389a829-c48c-4f3b-9ce2-47b0457044b4', '', 'cuongchamchi1904@gmail.com', '123456', '', '', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2Fcuongchamchi1904%40gmail.com?alt=media&token=aac07d8c-4eb8-44bc-adea-f61a9160568d');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('21954e35-bdef-430b-9eda-abd7bb370733', '', 'nvc4@gmail.com', '123456', '', '', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2Fnvc4%40gmail.com?alt=media&token=5eb68eab-3951-4ac2-8ccd-406b8934c01f');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('4d3ff8d8-1916-4a57-b0d4-bd178982e825', NULL, 'cuongchamchi1905@gmail.com', '123456', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('64880725-435a-49d6-95df-9cc334ae61d2', NULL, '1111string', '111string', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('65f04b04-979c-4d2b-924b-2f6c55c2577b', NULL, 'cuongchamchi14@gmail.com', '12346', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('76780b8e-68f2-40a2-8c44-d32596db3393', NULL, 'nvcuong19041904@gmail.com', '123456', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('785303b1-6d6f-4063-802e-7ac6ae6cf661', 'string', 'nvcuonga@gmail.com', '123456', 'string', 'string', 'string');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('7a6cf58b-e598-4e37-9bb1-cb8b5214687c', '', 'hihihaha@gmail.com', 'asdfgh', '', '', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2F7a6cf58b-e598-4e37-9bb1-cb8b5214687c?alt=media&token=54feafec-115c-474a-97a4-17a5e002d247');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('7ea36709-40e5-4ba3-a810-504e87d19635', NULL, 'cuongci1141@gmail.com', '12346', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('90cc9f05-df2f-4089-9327-65142fd14601', NULL, 'string', 'string', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('9dcce638-4ffc-4cf5-a350-3ddcc8ccde73', 'nvcuong', 'nvc3@gmail.com', '123456', '0932232122', 'Hà Đông - Hà Nội', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2F9dcce638-4ffc-4cf5-a350-3ddcc8ccde73?alt=media&token=dc4238f5-9797-4a23-b183-0cdc3612849e');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('a73028ff-c6d5-4938-b4f4-bb58d7ba73a8', NULL, 'nvc2@gmail.com', '123456', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('b3865a8c-98aa-4983-abac-20d89ff272a3', 'string', 'string@gmail.com', 'string', 'string', 'string', 'string');

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('d2004a86-5020-4fc8-b087-60c02dea844d', NULL, 'cuongchamchi1914@gmail.com', '12346', NULL, NULL, NULL);

INSERT INTO tttn.tblmember(id, name, email, password, phone, address, avatar) VALUES('dfdded72-6c31-11ee-b528-54ab3a476a5d', 'phuongxinhgai', 'admin@gmail.com', 'admin', '0966644237', 'Ha Dong', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2Fadmin%40gmail.com?alt=media&token=8c6be1a9-a230-4c8e-b806-b49a4ad9b7f1');


INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES
('37a772f1-69b9-4616-8a63-406216448849', 'sdfbfa', 105605555.0000, 'cvcbvc', '77bed403-ad9d-430f-b767-93a534834ae2', '0', '9dcce638-4ffc-4cf5-a350-3ddcc8ccde73', 4, '2023-09-09 16:00:58', '2023-11-24 15:56:52', 'xcvzcxvc', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('3903a7f8-3289-4e1f-b4ee-76ef0deafcea', 'sb', 42272222.0000, '0966644237', '77bed403-ad9d-430f-b767-93a534834ae2', '0', '9dcce638-4ffc-4cf5-a350-3ddcc8ccde73', 3, '2023-11-09 15:59:41', '2023-11-12 17:18:33', 'Cương Nguyễn', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('479d4863-8a2c-4a25-ab66-57c6e418f091', 'Hà NỘI', 21640000.0000, '01222222222', '4ef8352c-55fe-499c-b4d0-9d79af9d8144', '0', '7a6cf58b-e598-4e37-9bb1-cb8b5214687c', 4, '2023-11-24 15:19:17', '2023-11-24 16:03:48', 'Cương Nguyễn', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('5e8fc1bb-7209-4559-8c6b-7b8eeee4554b', 'vbv', 33383333.0000, '0966644237', '77bed403-ad9d-430f-b767-93a534834ae2', '0', '9dcce638-4ffc-4cf5-a350-3ddcc8ccde73', 4, '2023-11-09 16:00:16', '2023-11-23 21:29:10', 'Cương Nguyễn', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('6b2153db-0413-4bbc-8b42-2f032fc439e5', 'ddva', 21161111.0000, '0966644237', '77bed403-ad9d-430f-b767-93a534834ae2', '0', '9dcce638-4ffc-4cf5-a350-3ddcc8ccde73', 1, '2023-11-09 15:59:16', '2023-11-17 23:44:09', 'Cương Nguyễn', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('871a909c-16d8-49b3-8492-b6d31a707656', 'Hà nỘI', 14050000.0000, '0966644237', '4ef8352c-55fe-499c-b4d0-9d79af9d8144', '0', '7a6cf58b-e598-4e37-9bb1-cb8b5214687c', 4, '2023-11-23 18:03:16', '2023-11-24 15:57:05', 'Cương Nguyễn', 1);

INSERT INTO tttn.tblorder(idOrder, addressShipping, totalPrice, phoneShipping, tblCartid, statusShipping, tblUserid, statusOrder, createAt, updateAt, nameShipping, methodPayment) VALUES('eb9c29ff-142a-492d-8e5f-70d65b10651c', 'sds', 50000.0000, '0966644237', '4ef8352c-55fe-499c-b4d0-9d79af9d8144', '0', '7a6cf58b-e598-4e37-9bb1-cb8b5214687c', 1, '2023-11-24 21:56:29', '2023-11-24 21:56:29', 'Cương Nguyễn', 1);


INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES
('6b2153db-0413-4bbc-8b42-2f032fc439e5', '40bb5d57-fc98-4cb8-8403-35a82304fabd', 1, 11111111.0000, 11111111.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('6b2153db-0413-4bbc-8b42-2f032fc439e5', '2eab2867-c23d-4c2f-bc99-b232a137a36b', 1, 10000000.0000, 10000000.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('3903a7f8-3289-4e1f-b4ee-76ef0deafcea', '40bb5d57-fc98-4cb8-8403-35a82304fabd', 2, 22222222.0000, 11111111.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('3903a7f8-3289-4e1f-b4ee-76ef0deafcea', '2eab2867-c23d-4c2f-bc99-b232a137a36b', 2, 20000000.0000, 10000000.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('5e8fc1bb-7209-4559-8c6b-7b8eeee4554b', '40bb5d57-fc98-4cb8-8403-35a82304fabd', 3, 33333333.0000, 11111111.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('37a772f1-69b9-4616-8a63-406216448849', '40bb5d57-fc98-4cb8-8403-35a82304fabd', 5, 55555555.0000, 11111111.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('37a772f1-69b9-4616-8a63-406216448849', '2eab2867-c23d-4c2f-bc99-b232a137a36b', 5, 50000000.0000, 10000000.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('871a909c-16d8-49b3-8492-b6d31a707656', 'fed92903-2ce3-4beb-835b-ba0ba11d7fdf', 1, 14000000.0000, 14000000.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('479d4863-8a2c-4a25-ab66-57c6e418f091', 'fed92903-2ce3-4beb-835b-ba0ba11d7fdf', 1, 14000000.0000, 14000000.0000);

INSERT INTO tttn.tblorderproduct(tblOrderid, tblProductid, quantity, totalPriceOrder, priceByOne) VALUES('479d4863-8a2c-4a25-ab66-57c6e418f091', '8750b396-dd90-4bda-92e0-c51a743363c4', 1, 7590000.0000, 7590000.0000);


INSERT INTO tttn.tblproduct(id, name, price, pin, screen, `system`, chip, camera, charger, `describe`, createAt, updateAt, quantityInStock, status, launchDate, quantitySold, rating, ram, memory, color, image, videoIntro, videoReview) VALUES
('10598866-a586-4093-b783-4a51fcf28609', 'Xiaomi 9', 3000000.0000, '3300 mAh', 'Super AMOLED6.39"Full HD+', 'Android 9 (Pie)', 'Snapdragon 855', 'Chính 48 MP & Phụ 16 MP, 12 MP', '32W', 'không có', '2023-10-31 09:00:45', '2023-10-31 09:00:45', 70, 1, '2023-11-08 00:00:00', 0, 5, '2GB', '64GB', 'Đỏ', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2FXiaomi%2094GB?alt=media&token=73d8f53e-8afa-4cbc-af6f-2ae1693354a5', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y');

INSERT INTO tttn.tblproduct(id, name, price, pin, screen, `system`, chip, camera, charger, `describe`, createAt, updateAt, quantityInStock, status, launchDate, quantitySold, rating, ram, memory, color, image, videoIntro, videoReview) VALUES('2eab2867-c23d-4c2f-bc99-b232a137a36b', 'xiaomi13ee', 10000000.0000, '5000 mAh', 'Super AMOLED6.39"Full HD+', 'Android 12 (Pie)', ' Snapdragon 870', '84MP', '52w', 'string', '2023-10-31 09:00:45', '2023-10-31 09:00:45', 992, 1, '2023-11-24 00:00:00', 8, 0, '4GB', '256GB', 'Trắng', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2Fxiaomi13eestring?alt=media&token=dd9c420a-ad50-4898-97f1-580c9564c7c6', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y');

INSERT INTO tttn.tblproduct(id, name, price, pin, screen, `system`, chip, camera, charger, `describe`, createAt, updateAt, quantityInStock, status, launchDate, quantitySold, rating, ram, memory, color, image, videoIntro, videoReview) VALUES('40bb5d57-fc98-4cb8-8403-35a82304fabd', 'Reamwqi q11', 11111111.0000, '5000A', '122px', 'android 12', 'snap 870', '512MP', '52W', '12rfedfdsf', '2023-10-31 09:00:45', '2023-10-31 09:00:45', 89, 3, '2023-10-19 00:00:00', 11, 5, '8GB', '512GB', 'Đỏ', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2FReamwqi%20q118GB?alt=media&token=d5a5a870-b645-4ef3-abd9-2f7a3defec9e', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y');

INSERT INTO tttn.tblproduct(id, name, price, pin, screen, `system`, chip, camera, charger, `describe`, createAt, updateAt, quantityInStock, status, launchDate, quantitySold, rating, ram, memory, color, image, videoIntro, videoReview) VALUES('86453915-1be3-42c5-8fc7-56563e2feb24', 'xiaomi13', 10000000.0000, '5000A', '5In', 'android 12', 'snap 870', '32MP', '32W', 'fghjjgfadsfdgf', '2023-10-31 09:00:45', '2023-10-31 09:00:45', 100, 2, '2023-11-01 00:00:00', 0, 3, '8GB', '64GB', 'Trắng', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2Fxiaomi138GB?alt=media&token=f05b5fde-b66d-482e-8039-ffa4a028dee5', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y', 'https://www.youtube.com/embed/srGgnLB7tc4?si=SXNaFGgaILqZ0U9y');

INSERT INTO tttn.tblproduct(id, name, price, pin, screen, `system`, chip, camera, charger, `describe`, createAt, updateAt, quantityInStock, status, launchDate, quantitySold, rating, ram, memory, color, image, videoIntro, videoReview) VALUES('8750b396-dd90-4bda-92e0-c51a743363c4', 'Xiaomi 11 Lite 5G', 7590000.0000, '5000A', 'Màn hình AMOLED 6,55"', 'android 10', 'amos 14', '52MP', '32W', 'csaaa', '2023-10-31 09:00:45', '2023-10-31 09:00:45', 44, 1, '2023-11-10 00:00:00', 1, 4, '6GB', '128GB', 'Đỏ', 'https://firebasestorage.googleapis.com/v0/b/ecommerce-mern-2d22f.appspot.com/o/images%2FXiaomi%2011%20Lite%205G6GB?alt=media&token=d07d8a62-929a-47ac-a4ce-b54f21863c9d', 'https://www.youtube.com/embed/L4kdGvW7Di0?si=DQabkl1bJpivy6Q5', 'https://www.youtube.com/embed/kBItuTTlwp8?si=He5F8jaW5c5i3V7V');