BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "AXIOLOGHSH" (
	"vathmologia"	integer,
	"sxolia"	text,
	"kwd_katask"	integer,
	"kwd_krathshs"	varchar,
	FOREIGN KEY("kwd_krathshs") REFERENCES "KRATHSH"("kwd_krathshs") ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY("kwd_katask") REFERENCES "KATASKHNWTHS"("kwd_katask") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "YPHRESIA" (
	"kwd_yphresias"	varchar,
	"typos"	varchar,
	"kostos"	integer,
	PRIMARY KEY("kwd_yphresias")
);
CREATE TABLE IF NOT EXISTS "KRAT_EPILE_YPHR" (
	"kwd_krathshs"	varchar,
	"kwd_yphresias"	varchar DEFAULT NULL,
	PRIMARY KEY("kwd_krathshs","kwd_yphresias"),
	FOREIGN KEY("kwd_yphresias") REFERENCES "YPHRESIA"("kwd_yphresias") ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY("kwd_krathshs") REFERENCES "KRATHSH"("kwd_krathshs") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "PLHRWMH" (
	"kwd_plhrwmhs"	varchar,
	"kwd_katask"	integer,
	"kwd_krathshs"	varchar,
	"oliko_poso"	INTEGER DEFAULT NULL,
	PRIMARY KEY("kwd_plhrwmhs"),
	FOREIGN KEY("kwd_katask") REFERENCES "KATASKHNWTHS"("kwd_katask") ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY("kwd_krathshs") REFERENCES "KRATHSH"("kwd_krathshs") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "KRATHSH" (
	"kwd_krathshs"	varchar,
	"hmer_afixhs"	date,
	"hmer_anaxwrhshs"	date,
	"hmer_krathshs"	date,
	"kwd_katask"	integer,
	"arithmos_paidiwn"	integer,
	"arithmos_enhlikwn"	integer,
	PRIMARY KEY("kwd_krathshs"),
	FOREIGN KEY("kwd_katask") REFERENCES "KATASKHNWTHS"("kwd_katask") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "KATALYMA" (
	"kwd_katal"	varchar,
	PRIMARY KEY("kwd_katal")
);
CREATE TABLE IF NOT EXISTS "XWROS_KATASKHNWSHS" (
	"kwd_katal"	varchar,
	"xwrhtikothta"	INTEGER,
	"kostos"	INTEGER,
	PRIMARY KEY("kwd_katal"),
	FOREIGN KEY("kwd_katal") REFERENCES "KATALYMA"("kwd_katal") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "KRAT_PERILAMB_KATALYM" (
	"kwd_krathshs"	varchar,
	"kwd_katal"	varchar,
	PRIMARY KEY("kwd_krathshs","kwd_katal"),
	FOREIGN KEY("kwd_krathshs") REFERENCES "KRATHSH"("kwd_krathshs") ON UPDATE RESTRICT ON DELETE RESTRICT,
	FOREIGN KEY("kwd_katal") REFERENCES "KATALYMA"("kwd_katal") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "KATASKHNWTHS" (
	"kwd_katask"	integer,
	"fname"	string,
	"lname"	varchar,
	"email"	varchar UNIQUE,
	"id_number"	varchar UNIQUE,
	"thlefwno"	varchar,
	PRIMARY KEY("kwd_katask"),
	CHECK(length("id_number") >= 5),
	CHECK(length("thlefwno") >= 10)
);
CREATE TABLE IF NOT EXISTS "RV" (
	"kwd_katal"	varchar,
	"xwrhtikothta"	INTEGER,
	"kostos"	INTEGER,
	PRIMARY KEY("kwd_katal"),
	FOREIGN KEY("kwd_katal") REFERENCES "KATALYMA"("kwd_katal") ON UPDATE RESTRICT ON DELETE RESTRICT
);
CREATE TABLE IF NOT EXISTS "DWMATIO" (
	"kwd_katal"	varchar,
	"xwrhtikothta"	INTEGER,
	"kostos"	INTEGER,
	PRIMARY KEY("kwd_katal"),
	FOREIGN KEY("kwd_katal") REFERENCES "KATALYMA"("kwd_katal") ON UPDATE RESTRICT ON DELETE RESTRICT
);
INSERT INTO "AXIOLOGHSH" ("vathmologia","sxolia","kwd_katask","kwd_krathshs") VALUES (5,'Nice Accomodation!',1,'KR001'),
 (4,'Nice Accomodation!',1,'KR001'),
 (3,'Average experience.',3,'KR003'),
 (5,'Nice Accomodation!',1,'KR001'),
 (2,'Expensive accommodation.',7,'KR009'),
 (4,'Nice Accomodation!',1,'KR001'),
 (2,'Poor Breakfast.',6,'KR039'),
 (3,'Decent stay!',12,'KR017'),
 (4,'Nice Accomodation!',1,'KR001'),
 (3,'Poor breakfast...',20,'KR010'),
 (1,'Poor Breakfast.',6,'KR039'),
 (5,'Nice Accomodation!',1,'KR001'),
 (1,'awful camping!',26,'KR056'),
 (5,'Great stay!',25,'KR055');
INSERT INTO "YPHRESIA" ("kwd_yphresias","typos","kostos") VALUES ('Y001','Parking',10),
 ('Y002','Breakfast',5),
 ('Y003','Electricity supply',3);
INSERT INTO "KRAT_EPILE_YPHR" ("kwd_krathshs","kwd_yphresias") VALUES ('KR001','Y002'),
 ('KR002','Y003'),
 ('KR003','Y003'),
 ('KR004','Y003'),
 ('KR004','Y001'),
 ('KR052','Y001'),
 ('KR053','Y001'),
 ('KR054','Y001'),
 ('KR054','Y002'),
 ('KR054','Y003'),
 ('KR055','Y001'),
 ('KR055','Y002'),
 ('KR055','Y003'),
 ('KR056','Y001'),
 ('KR056','Y002'),
 ('KR056','Y003'),
 ('KR057','Y001'),
 ('KR057','Y002'),
 ('KR057','Y003'),
 ('KR058','Y001'),
 ('KR058','Y002'),
 ('KR059','Y001');
INSERT INTO "PLHRWMH" ("kwd_plhrwmhs","kwd_katask","kwd_krathshs","oliko_poso") VALUES ('P001',1,'KR001',NULL),
 ('P002',2,'KR002',NULL),
 ('P003',22,'KR052',248),
 ('P004',23,'KR053',366),
 ('P005',24,'KR054',606),
 ('P006',25,'KR055',763),
 ('P007',26,'KR056',471),
 ('P008',27,'KR057',228),
 ('P009',28,'KR058',348),
 ('P0010',29,'KR059',544);
INSERT INTO "KRATHSH" ("kwd_krathshs","hmer_afixhs","hmer_anaxwrhshs","hmer_krathshs","kwd_katask","arithmos_paidiwn","arithmos_enhlikwn") VALUES ('KR001','2024-01-01','2024-01-05','2023-12-20',1,2,2),
 ('KR002','2024-02-01','2024-02-10','2023-12-25',2,0,3),
 ('KR003','2024-03-15','2024-03-20','2023-12-30',3,0,4),
 ('KR004','2024-04-10','2024-04-15','2024-01-05',4,0,2),
 ('KR005','2024-05-01','2024-05-10','2024-01-10',5,1,1),
 ('KR006','2025-01-01','2025-01-05','2024-12-20',1,2,2),
 ('KR007','2025-02-01','2025-02-10','2024-12-25',2,0,3),
 ('KR008','2023-01-15','2023-01-20','2022-12-15',14,2,3),
 ('KR009','2022-03-20','2022-04-02','2022-02-20',7,1,4),
 ('KR010','2023-12-10','2023-12-15','2023-11-10',20,0,2),
 ('KR011','2024-04-05','2024-04-09','2024-03-05',20,3,1),
 ('KR012','2022-06-11','2022-06-18','2022-05-11',18,2,3),
 ('KR013','2024-02-22','2024-03-01','2024-01-22',20,4,2),
 ('KR014','2023-08-01','2023-08-10','2023-07-01',9,1,4),
 ('KR015','2022-10-30','2022-11-08','2022-09-30',20,0,1),
 ('KR016','2024-01-10','2024-01-15','2023-12-10',20,2,3),
 ('KR017','2023-05-14','2023-05-20','2023-04-14',12,3,2),
 ('KR018','2022-07-08','2022-07-14','2022-06-08',20,1,4),
 ('KR019','2023-09-18','2023-09-25','2023-08-18',20,4,2),
 ('KR020','2024-03-25','2024-04-05','2024-02-25',8,2,1),
 ('KR021','2023-02-02','2023-02-10','2023-01-02',17,3,4),
 ('KR022','2022-04-18','2022-04-22','2022-03-18',20,2,3),
 ('KR023','2023-11-12','2023-11-17','2023-10-12',16,1,2),
 ('KR024','2024-07-22','2024-07-28','2024-06-22',20,0,3),
 ('KR025','2023-03-17','2023-03-25','2023-02-17',5,4,1),
 ('KR026','2022-05-25','2022-06-02','2022-04-25',3,2,4),
 ('KR027','2023-06-08','2023-06-15','2023-05-08',20,0,3),
 ('KR028','2022-09-13','2022-09-20','2022-08-13',20,3,1),
 ('KR029','2024-02-15','2024-02-25','2024-01-15',12,1,4),
 ('KR030','2023-07-12','2023-07-16','2023-06-12',20,2,2),
 ('KR031','2024-01-27','2024-02-05','2023-12-27',20,0,3),
 ('KR032','2022-11-23','2022-12-01','2022-10-23',18,4,2),
 ('KR033','2023-10-05','2023-10-12','2023-09-05',20,3,4),
 ('KR034','2024-06-19','2024-06-25','2024-05-19',20,1,3),
 ('KR035','2023-08-22','2023-08-30','2023-07-22',14,2,1),
 ('KR036','2022-12-04','2022-12-15','2022-11-04',9,3,4),
 ('KR037','2023-04-10','2023-04-17','2023-03-10',20,0,2),
 ('KR038','2024-05-05','2024-05-10','2024-04-05',20,1,3),
 ('KR039','2023-01-28','2023-02-05','2022-12-28',6,2,1),
 ('KR040','2022-08-03','2022-08-08','2022-07-03',10,3,2),
 ('KR041','2024-04-14','2024-04-18','2024-03-14',13,4,1),
 ('KR042','2023-11-05','2023-11-10','2023-10-05',20,1,3),
 ('KR043','2022-02-15','2022-02-20','2022-01-15',20,2,4),
 ('KR044','2023-03-01','2023-03-06','2023-02-01',19,0,2),
 ('KR045','2024-08-10','2024-08-15','2024-07-10',20,1,4),
 ('KR046','2023-12-02','2023-12-10','2023-11-02',20,3,1),
 ('KR047','2022-06-20','2022-06-25','2022-05-20',2,4,3),
 ('KR048','2024-09-18','2024-09-25','2024-08-18',20,0,2),
 ('KR049','2023-10-30','2023-11-05','2023-09-30',11,3,4),
 ('KR050','2022-04-08','2022-04-14','2022-03-08',20,2,1),
 ('KR051','2024-12-26','2024-12-26','2024-12-26',21,2,10),
 ('KR052','2025-01-04','2025-01-06','2025-01-03',22,3,2),
 ('KR053','2025-01-03','2025-01-06','2025-01-03',23,2,2),
 ('KR054','2025-01-20','2025-01-26','2025-01-03',24,0,2),
 ('KR055','2025-01-25','2025-02-01','2025-01-03',25,0,4),
 ('KR056','2025-03-11','2025-03-14','2025-01-03',26,4,4),
 ('KR057','2025-05-01','2025-05-04','2025-01-03',27,0,2),
 ('KR058','2025-03-03','2025-03-06','2025-01-03',28,0,4),
 ('KR059','2025-05-31','2025-06-08','2025-01-03',29,0,2);
INSERT INTO "KATALYMA" ("kwd_katal") VALUES ('A1'),
 ('A2'),
 ('A3'),
 ('A4'),
 ('A5'),
 ('A6'),
 ('A7'),
 ('A8'),
 ('A9'),
 ('A10'),
 ('B1'),
 ('B2'),
 ('B3'),
 ('B4'),
 ('B5'),
 ('B6'),
 ('B7'),
 ('B8'),
 ('B9'),
 ('B10'),
 ('B11'),
 ('B12'),
 ('B13'),
 ('B14'),
 ('B15'),
 ('B16'),
 ('B17'),
 ('B18'),
 ('B19'),
 ('B20'),
 ('B21'),
 ('B22'),
 ('B23'),
 ('B24'),
 ('B25'),
 ('B26'),
 ('B27'),
 ('B28'),
 ('B29'),
 ('B30'),
 ('B31'),
 ('B32'),
 ('B33'),
 ('B34'),
 ('B35'),
 ('B36'),
 ('B37'),
 ('B38'),
 ('B39'),
 ('B40'),
 ('B41'),
 ('B42'),
 ('B43'),
 ('B44'),
 ('B45'),
 ('B46'),
 ('B47'),
 ('B48'),
 ('B49'),
 ('B50'),
 ('C1'),
 ('C2'),
 ('C3'),
 ('C4'),
 ('C5'),
 ('C6'),
 ('C7'),
 ('C8'),
 ('C9'),
 ('C10');
INSERT INTO "XWROS_KATASKHNWSHS" ("kwd_katal","xwrhtikothta","kostos") VALUES ('B1',3,12),
 ('B2',2,10),
 ('B3',2,10),
 ('B4',2,10),
 ('B5',3,12),
 ('B6',4,15),
 ('B7',1,7),
 ('B8',2,10),
 ('B9',3,12),
 ('B10',4,15),
 ('B11',1,7),
 ('B12',2,10),
 ('B13',3,12),
 ('B14',4,15),
 ('B15',1,7),
 ('B16',2,10),
 ('B17',3,12),
 ('B18',4,15),
 ('B19',1,7),
 ('B20',2,10),
 ('B21',3,12),
 ('B22',4,15),
 ('B23',1,7),
 ('B24',2,10),
 ('B25',3,12),
 ('B26',4,15),
 ('B27',1,7),
 ('B28',2,10),
 ('B29',3,12),
 ('B30',4,15),
 ('B31',1,7),
 ('B32',2,10),
 ('B33',3,12),
 ('B34',4,15),
 ('B35',1,7),
 ('B36',2,10),
 ('B37',3,12),
 ('B38',4,15),
 ('B39',1,7),
 ('B40',2,10),
 ('B41',3,12),
 ('B42',4,15),
 ('B43',1,7),
 ('B44',2,10),
 ('B45',3,12),
 ('B46',4,15),
 ('B47',1,7),
 ('B48',2,10),
 ('B49',3,12),
 ('B50',4,15);
INSERT INTO "KRAT_PERILAMB_KATALYM" ("kwd_krathshs","kwd_katal") VALUES ('KR001','A1'),
 ('KR002','A3'),
 ('KR003','A5'),
 ('KR004','A10'),
 ('KR005','A2'),
 ('KR006','A9'),
 ('KR007','A7'),
 ('KR010','A6'),
 ('KR015','A4'),
 ('KR011','B10'),
 ('KR020','B1'),
 ('KR023','B13'),
 ('KR024','B17'),
 ('KR027','B21'),
 ('KR028','B14'),
 ('KR030','B18'),
 ('KR031','B25'),
 ('KR034','B22'),
 ('KR035','B29'),
 ('KR037','B12'),
 ('KR038','B26'),
 ('KR039','B33'),
 ('KR042','B30'),
 ('KR044','B16'),
 ('KR046','B34'),
 ('KR048','B2'),
 ('KR050','B37'),
 ('KR013','C4'),
 ('KR019','C5'),
 ('KR026','C9'),
 ('KR008','B1'),
 ('KR008','B2'),
 ('KR009','A8'),
 ('KR009','C1'),
 ('KR012','C2'),
 ('KR012','B7'),
 ('KR014','C3'),
 ('KR014','B11'),
 ('KR016','C8'),
 ('KR016','B15'),
 ('KR017','B3'),
 ('KR017','B5'),
 ('KR018','B4'),
 ('KR018','B9'),
 ('KR021','B6'),
 ('KR021','B41'),
 ('KR022','B8'),
 ('KR025','B19'),
 ('KR025','B38'),
 ('KR029','B20'),
 ('KR029','B49'),
 ('KR032','B24'),
 ('KR032','B42'),
 ('KR033','B23'),
 ('KR033','B28'),
 ('KR033','B46'),
 ('KR036','B27'),
 ('KR036','B32'),
 ('KR036','B50'),
 ('KR040','B31'),
 ('KR040','B36'),
 ('KR040','B40'),
 ('KR041','B35'),
 ('KR041','B44'),
 ('KR041','B48'),
 ('KR051','A1'),
 ('KR051','C1'),
 ('KR051','B6'),
 ('KR052','C4'),
 ('KR053','A1'),
 ('KR054','C1'),
 ('KR055','C1'),
 ('KR056','A1'),
 ('KR056','B6'),
 ('KR057','A2'),
 ('KR058','C1'),
 ('KR058','B2'),
 ('KR059','A2');
INSERT INTO "KATASKHNWTHS" ("kwd_katask","fname","lname","email","id_number","thlefwno") VALUES (1,'John','Doe','john.doe@example.com','ID001','1234567890'),
 (2,'Jane','Smith','jane.smith@example.com','ID002','0987654321'),
 (3,'Alice','Brown','alice.brown@example.com','ID003','1122334455'),
 (4,'Bob','Johnson','bob.johnson@example.com','ID004','2233445566'),
 (5,'Eve','Davis','eve.davis@example.com','ID005','3344556677'),
 (6,'Natalia','Rouska','natalia@gmail.com','AN356','6897545678'),
 (7,'Michael','Johnson','michael.johnson@example.com','ID007','1230984567'),
 (8,'Sophia','Williams','sophia.williams@example.com','ID008','9876543210'),
 (9,'David','Martinez','david.martinez@example.com','ID009','1122339988'),
 (10,'Emily','Garcia','emily.garcia@example.com','ID010','3344556677'),
 (11,'James','Davis','james.davis@example.com','ID011','5566778899'),
 (12,'Olivia','Lopez','olivia.lopez@example.com','ID012','6677889900'),
 (13,'Daniel','Hernandez','daniel.hernandez@example.com','ID013','7899001122'),
 (14,'Isabella','Miller','isabella.miller@example.com','ID014','8001122333'),
 (15,'Lucas','Gonzalez','lucas.gonzalez@example.com','ID015','9011234455'),
 (16,'Charlotte','Taylor','charlotte.taylor@example.com','ID016','1122336677'),
 (17,'Ethan','Wilson','ethan.wilson@example.com','ID017','2233447788'),
 (18,'Ava','Moore','ava.moore@example.com','ID018','3344558899'),
 (19,'William','Jackson','william.jackson@example.com','ID019','4455669900'),
 (20,'Mason','White','mason.white@example.com','ID020','5566771122'),
 (21,'nat','rsk','nat@ex.com','ID234','6738393937'),
 (22,'panos','solomonidis','pansol@gmail.com','AE320','6943568711'),
 (23,'eleni','mathaiou','elmathaiou@gmail.com','AR431','6943225566'),
 (24,'nikos','portokaloglou','nikporto@gmail.com','AD131','6944332255'),
 (25,'tryfwnas','samaras','tryfsam@gmail.com','AI130','6911224356'),
 (26,'matina','mantarinaki','matina@gmail.com','AI133','6911085677'),
 (27,'xrhstos','mastoras','mastoras@yahoo.com','AI999','6932457891'),
 (28,'athanasia','manali','athmanali@yahoo.com','AI923','6943678891'),
 (29,'aggelos','rouskas','aggrouskas@gmail.com','AI881','6954887632');
INSERT INTO "RV" ("kwd_katal","xwrhtikothta","kostos") VALUES ('C1',4,75),
 ('C2',4,75),
 ('C3',4,75),
 ('C4',6,100),
 ('C5',6,100),
 ('C6',8,125),
 ('C7',8,125),
 ('C8',4,75),
 ('C9',6,100),
 ('C10',8,125);
INSERT INTO "DWMATIO" ("kwd_katal","xwrhtikothta","kostos") VALUES ('A1',4,100),
 ('A2',2,50),
 ('A3',3,75),
 ('A4',1,25),
 ('A5',4,120),
 ('A6',2,60),
 ('A7',3,80),
 ('A8',1,30),
 ('A9',4,150),
 ('A10',2,70);
COMMIT;
