-- Create the database
CREATE DATABASE VehicleSale

-- Use the database which created
USE VehicleSale

-- Create Vehicles Table
CREATE TABLE Vehicles(
    vehicleId INT PRIMARY KEY IDENTITY,
    model VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(30) NOT NULL,
    price MONEY,
    fuelType VARCHAR(10) CONSTRAINT ck_fuelType CHECK(fuelType in ('dizel', 'benzin', 'lpg', 'elektrik')),
    color VARCHAR(20),
    gearboxType VARCHAR(20) CONSTRAINT ck_gearboxType CHECK(gearboxType in ('manuel vites', 'otomatik vites', 'triptonik vites', 'yari otomatik vites')),
    vehicleClass VARCHAR(20) CONSTRAINT ck_vehicleClass CHECK(vehicleClass in ('sedan', 'hatchback', 'station wagon', 'cabrio', 'pick up', 'suv', 'coupe', 'convertible', 'roadster', 'cuv', 'mpv', 'kamyonet', 'minivan', 'panelvan')),
    vehicleYear DATE,
    licansePlate VARCHAR(20),
    vin VARCHAR(50) NOT NULL
)

-- Create Customers Table
CREATE TABLE Customers(
    customerID INT PRIMARY KEY IDENTITY,
    customerName VARCHAR(30) NOT NULL,
    customersurname VARCHAR(30) NOT NULL,
    phoneNumber VARCHAR(11) NOT NULL,
    emailAdress VARCHAR(30),
    adress VARCHAR(60),
    city VARCHAR(30),
    postCode VARCHAR(5)
)

--Create Sales Table
CREATE TABLE Sales(
    saleID INT PRIMARY KEY IDENTITY,
    saleDate date CONSTRAINT df_saleDate DEFAULT GETDATE(),
    paymentMethod VARCHAR(20) CONSTRAINT ck_paymentMethod CHECK(paymentMethod in ('nakit', 'taksit', 'senet', 'kredi karti', 'banka karti', 'sonra ode')),
    customerID INT CONSTRAINT fk_customerID FOREIGN KEY (customerID) REFERENCES Customers(customerID),
    vehicleID INT UNIQUE CONSTRAINT fk_vehicleID FOREIGN KEY (vehicleID) REFERENCES Vehicles(vehicleID)
)

-- Create Services Table
CREATE TABLE Services(
    serviceID INT PRIMARY KEY IDENTITY,
    serviceCode VARCHAR(20),
    serviceDescription text,
    serviceDate date CONSTRAINT df_serviceDate DEFAULT GETDATE(),
    mileage INT,
    cost MONEY,
    note text,
    vehicleID INT CONSTRAINT fk_vehicleID2 FOREIGN KEY (vehicleID) REFERENCES Vehicles(vehicleID)
)

-- Create Vehicle in Vehicles Table (13)
INSERT INTO Vehicles VALUES('Egea', 'Fiat', '355900', 'dizel', 'beyaz', 'manuel vites', 'sedan', '2022', '34 AB 1639', '4Y1SL65848Z411439')
INSERT INTO Vehicles VALUES('Clio', 'Renault', '373000', 'dizel', 'turuncu', 'manuel vites', 'hatchback', '2021', '81 ACC 16', 'IXX91U4NOJZMPZBSC')
INSERT INTO Vehicles VALUES('Corolla', 'Toyota', '607050', 'benzin', 'gri', 'otomatik vites', 'sedan', '2022', '35 TP 491', 'R913ISRK5DJWBHNVC')
INSERT INTO Vehicles VALUES('Duster', 'Dacia', '466000', 'dizel', 'kirmizi', 'manuel vites', 'suv', '2021', '54 DY 2052', '475JB5XV2898UACWB')
INSERT INTO Vehicles VALUES('i20', 'Hyundai', '512500', 'dizel', 'yesil', 'manuel vites', 'hatchback', '2022', '34 KLL 4128', 'WQC8XQQAB76DDMWLO')
INSERT INTO Vehicles VALUES('Crossland', 'Opel', '560000', 'benzin', 'kirmizi', 'manuel vites', 'hatchback', '2022', '41 NO 493', 'XK4P613E3XSK98I5X')
INSERT INTO Vehicles VALUES('3008', 'Peugeot', '815000', 'benzin', 'yesil', 'otomatik vites', 'suv', '2022', '34 MN 19', 'Z8OQ6QU6WAF9VZUWL')
INSERT INTO Vehicles VALUES('C3', 'Citroen', '493000', 'lpg', 'beyaz', 'yari otomatik vites', 'hatchback', '2021', '16 SSP 543', 'Z8OQ6QU6WAF9VZUWL')
INSERT INTO Vehicles VALUES('City', 'Honda', '657250', 'dizel', 'beyaz', 'otomatik vites', 'sedan', '2022', '34 UYF 1578', 'JPOLC8TFHA0C87500')
INSERT INTO Vehicles VALUES('C serisi', 'Mercedes-Benz', '990000', 'benzin', 'siyah', 'otomatik vites', 'sedan', '2022', '14 CV 4192', '6F87W9GZ71GKGXODY')
INSERT INTO Vehicles VALUES('Stonic', 'Kia', '665760', 'lpg', 'sari', 'manuel vites', 'suv', '2022', '34 EZ 1012', 'DLELD6HGIFA06VDRK')
INSERT INTO Vehicles VALUES('Superb', 'Skoda', '895000', 'dizel', 'beyaz', 'otomatik vites', 'sedan', '2022', '06 RE 921', 'ZM78498R0UZI8NP06')
INSERT INTO Vehicles VALUES('3 Serisi', 'BMW', '995000', 'benzin', 'siyah', 'otomatik vites', 'sedan', '2022', '34 JJ 319', 'YYNLJAHU5E6M2V00F')

-- Create Customer in Customers Table (6)
INSERT INTO Customers VALUES('Ali', 'Deniz', '05058561316', 'alideniz09@gmail.com', 'Nazilli', 'Aydin', '09800')
INSERT INTO Customers VALUES('Veli', 'Tur', '05056583162', 'veli_tur@gmail.com', 'Karasu', 'Sakarya', '54500')
INSERT INTO Customers VALUES('Zeynep', 'Yildiz', '05511005437', 'zeyyildiz@gmail.com', 'Kartepe', 'Kocaeli', '41180')
INSERT INTO Customers VALUES('Burak', 'Yildirim', '05367811900', 'burakyildirim14@gmail.com', 'Kadikoy', 'Istanbul', '34734')
INSERT INTO Customers VALUES('Ozlem', 'Ozdemir', '05556127161', 'ozlemozd3m1r@gmail.com', 'Cankaya', 'Ankara', '06530')
INSERT INTO Customers VALUES('Yusuf', 'Harman', '05319124001', 'yusufharman@gmail.com', 'Esenler', 'Istanbul', '34220')

-- Create Sale in Sales (4)
INSERT INTO Sales VALUES('2022-01-19', 'nakit', 1, 6)
INSERT INTO Sales VALUES('2022-06-30', 'taksit', 2, 2)
INSERT INTO Sales VALUES('2022-09-24', 'nakit', 3, 12)
INSERT INTO Sales VALUES('2022-02-14', 'taksit', 6, 9)

-- Create Service in Services (3)
INSERT INTO Services VALUES('A110', 'Triger degistirildi', '2022-12-01', 21000, 6500, '4000 kilometre sonra yag degisimi', 9)
INSERT INTO Services VALUES('A210', 'Buji tamiri', '2021-01-12', 100000, 1250, 'Pistonlarda asinma var', 6)
INSERT INTO Services(serviceCode, serviceDescription, mileage, cost, note, vehicleID) VALUES('A110', 'Sanjiman degisti', 2250, 6900, 'Ses kontrol edilecek.', 12)

-- Show All Entries (4)
SELECT * FROM Vehicles
SELECT * FROM Customers
SELECT * FROM Sales
SELECT * FROM Services

------------------------------------------------------------------------------------------------------------------------

