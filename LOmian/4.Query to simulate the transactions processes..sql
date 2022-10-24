insert into PurchaseTransactionHeader values
--PurchaseTransactionID,EmployeeID,SupplierID,PurchaseTransactionDate
('PU001','EM001','SU001','2020-09-03'),
('PU002','EM002','SU002','2020-05-02'),
('PU003','EM003','SU003','2020-07-21'),
('PU004','EM004','SU004','2020-06-26'),
('PU005','EM005','SU005','2020-08-12'),
('PU006','EM006','SU006','2020-03-22'),
('PU007','EM007','SU007','2020-04-14'),
('PU008','EM008','SU008','2020-05-24'),
('PU009','EM009','SU009','2020-09-15'),
('PU010','EM010','SU010','2020-02-25'),
('PU011','EM011','SU011','2020-04-09'),
('PU012','EM012','SU012','2020-05-07'),
('PU013','EM013','SU013','2020-08-03'),
('PU014','EM014','SU014','2020-09-05'),
('PU015','EM015','SU015','2020-05-20')

select * from PurchaseTransactionHeader

insert into PurchaseTransactionDetail values
--PurchaseTransactionID,IngredientPurchasedID,QtyIngredients
('PU001' , 'IN001' , 5 ),
('PU002' , 'IN003' , 3 ),
('PU003' , 'IN005' , 4 ),
('PU004' , 'IN006' , 6 ),
('PU005' , 'IN002' , 9 ),
('PU006' , 'IN004' , 15),
('PU007' , 'IN007' , 11),
('PU008' , 'IN009' , 4 ),
('PU009' , 'IN008' , 6 ),
('PU010' , 'IN010' , 2 ),
('PU011' , 'IN011' , 9 ),
('PU012' , 'IN012' , 8 ),
('PU013' , 'IN013' , 12 ),
('PU014' , 'IN015' , 14 ),
('PU015' , 'IN014' , 6 ),
('PU002' , 'IN012' , 3 ),
('PU004' , 'IN011' , 8 ),
('PU007' , 'IN001' , 9 ),
('PU009' , 'IN003', 5 ),
('PU011' , 'IN006' , 2 ),
('PU013' , 'IN008' , 7 ),
('PU015' , 'IN009' , 10 ),
('PU001' , 'IN003' , 13 ),
('PU002' , 'IN015' , 19 ),
('PU003' , 'IN011' , 7 )

select * from PurchaseTransactionDetail

insert into SalesTransactionHeader values
--SalesTransactionID,EmployeeIDCustomerID,SalesTransactionDate
('TR001','EM001','CU001','2019-12-08'),
('TR002','EM002','CU002','2018-11-13'),
('TR003','EM003','CU003','2017-10-08'),
('TR004','EM004','CU004','2018-10-04'),
('TR005','EM005','CU005','2019-09-08'),
('TR006','EM006','CU006','2017-08-24'),
('TR007','EM007','CU007','2017-09-13'),
('TR008','EM008','CU008','2018-03-16'),
('TR009','EM009','CU009','2019-06-19'),
('TR010','EM010','CU010','2018-07-29'),
('TR011','EM011','CU011','2019-09-20'),
('TR012','EM012','CU012','2019-04-26'),
('TR013','EM013','CU013','2018-09-12'),
('TR014','EM014','CU014','2017-02-04'),
('TR015','EM015','CU015','2018-10-26')

select * from SalesTransactionHeader

insert into SalesTransactionDetail values
--SalesTransactionID,NoodleID,NoodleSold,QtyNoodlePurchased
('TR001','NO001',20,25),
('TR002','NO002',18,20),
('TR003','NO003',20,25),
('TR004','NO004',9,15),
('TR005','NO005',45,50),
('TR006','NO006',27,35),
('TR007','NO007',16,25),
('TR008','NO008',7,15),
('TR009','NO009',28,35),
('TR010','NO010',29,40),
('TR011','NO011',30,45),
('TR012','NO012',26,27),
('TR013','NO013',29,30),
('TR014','NO014',38,50),
('TR005','NO015',14,20),
('TR006','NO006',29,45),
('TR007','NO007',30,35),
('TR008','NO008',44,50),
('TR009','NO009',42,60),
('TR010','NO002',10,15),
('TR011','NO011',16,20),
('TR012','NO012',25,30),
('TR013','NO013',17,25),
('TR014','NO014',27,30),
('TR015','NO015',12,20)

select * from SalesTransactionDetail