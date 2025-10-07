CREATE DATABASE ProductionEnterprise;
GO

USE ProductionEnterprise;
GO

CREATE TABLE Region (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Code varchar(10) NOT NULL,
    DeliveryMultiplier decimal(3,2) DEFAULT 1.0,
    IsActive bit DEFAULT 1
);

CREATE TABLE City (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    RegionID int NOT NULL FOREIGN KEY REFERENCES Region(ID),
    PostalCode varchar(6),
    Latitude decimal(9,6),
    Longitude decimal(9,6)
);

CREATE TABLE UserRole (
    ID int IDENTITY(1,1) PRIMARY KEY,
    RoleName varchar(50) NOT NULL,
    Description varchar(255),
    Permissions varchar(max)
);

CREATE TABLE Department (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Description varchar(255),
    HeadEmployeeID int,
    IsActive bit DEFAULT 1
);

CREATE TABLE Position (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(100) NOT NULL,
    Description varchar(255),
    BaseSalary decimal(10,2),
    RequiredExperience int,
    IsActive bit DEFAULT 1
);

CREATE TABLE [User] (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Login varchar(50) NOT NULL,
    PasswordHash varchar(255) NOT NULL,
    Email varchar(255),
    FirstName varchar(50),
    LastName varchar(50),
    MiddleName varchar(50),
    Phone varchar(20),
    IsActive bit DEFAULT 1,
    CreatedAt varchar(20),
    LastLoginAt varchar(20),
    FailedLoginCount int DEFAULT 0,
    UserRoleID int FOREIGN KEY REFERENCES UserRole(ID)
);

CREATE TABLE Employee (
    ID int IDENTITY(1,1) PRIMARY KEY,
    PersonalNumber varchar(20) NOT NULL,
    FirstName varchar(50) NOT NULL,
    LastName varchar(50) NOT NULL,
    MiddleName varchar(50),
    BirthDate varchar(10),
    HireDate varchar(10),
    DepartmentID int FOREIGN KEY REFERENCES Department(ID),
    PositionID int FOREIGN KEY REFERENCES Position(ID),
    UserID int FOREIGN KEY REFERENCES [User](ID),
    Phone varchar(20),
    Email varchar(255),
    HasFamily bit,
    IsActive bit DEFAULT 1
);

CREATE TABLE AccessPoint (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Location varchar(255),
    Type varchar(20),
    IsActive bit DEFAULT 1
);

CREATE TABLE NFCCard (
    ID int IDENTITY(1,1) PRIMARY KEY,
    CardNumber varchar(20) NOT NULL,
    EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employee(ID),
    IssueDate varchar(20),
    ExpiryDate varchar(20),
    IsActive bit DEFAULT 1,
    IsBlocked bit DEFAULT 0
);

CREATE TABLE AccessLog (
    ID bigint IDENTITY(1,1) PRIMARY KEY,
    EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employee(ID),
    AccessPointID int NOT NULL FOREIGN KEY REFERENCES AccessPoint(ID),
    AccessTime varchar(20) NOT NULL,
    AccessType varchar(10),
    IsSuccessful bit DEFAULT 1,
    CardNumber varchar(20)
);

CREATE TABLE Shift (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(50) NOT NULL,
    StartTime varchar(8) NOT NULL,
    EndTime varchar(8) NOT NULL,
    BreakDuration int DEFAULT 60,
    IsActive bit DEFAULT 1
);

CREATE TABLE WorkSchedule (
    ID bigint IDENTITY(1,1) PRIMARY KEY,
    EmployeeID int NOT NULL FOREIGN KEY REFERENCES Employee(ID),
    WorkDate varchar(10) NOT NULL,
    ShiftID int NOT NULL FOREIGN KEY REFERENCES Shift(ID),
    ActualStartTime varchar(20),
    ActualEndTime varchar(20),
    Status varchar(20),
    Notes varchar(255)
);

CREATE TABLE AgentType (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(50) NOT NULL,
    Image varchar(100)
);

CREATE TABLE Agent (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(150) NOT NULL,
    AgentTypeID int FOREIGN KEY REFERENCES AgentType(ID),
    Address varchar(300),
    INN varchar(12) NOT NULL,
    DirectorName varchar(100),
    Phone varchar(20) NOT NULL,
    Email varchar(255),
    Priority int NOT NULL
);

CREATE TABLE MaterialType (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(50) NOT NULL,
    DefectedPercent float NOT NULL
);

CREATE TABLE Material (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(100) NOT NULL,
    CountInPack int NOT NULL,
    Unit varchar(10) NOT NULL,
    CountInStock float,
    MinCount float NOT NULL,
    Description varchar(max),
    Cost decimal(10,2) NOT NULL,
    Image varchar(100),
    MaterialTypeID int FOREIGN KEY REFERENCES MaterialType(ID)
);

CREATE TABLE Supplier (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(150) NOT NULL,
    INN varchar(12) NOT NULL,
    StartDate varchar(10) NOT NULL,
    QualityRating int,
    SupplierType varchar(20)
);

CREATE TABLE ProductType (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(50) NOT NULL,
    DefectedPercent float NOT NULL
);

CREATE TABLE Product (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(100) NOT NULL,
    ProductTypeID int FOREIGN KEY REFERENCES ProductType(ID),
    ArticleNumber varchar(10) NOT NULL,
    Description varchar(max),
    Image varchar(100),
    ProductionPersonCount int,
    ProductionWorkshopNumber int,
    MinCostForAgent decimal(10,2) NOT NULL
);

CREATE TABLE OrderStatus (
    ID int IDENTITY(1,1) PRIMARY KEY,
    StatusName varchar(50) NOT NULL,
    Description varchar(255),
    SortOrder int,
    Color varchar(7)
);

CREATE TABLE PaymentType (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(50) NOT NULL,
    Description varchar(255),
    RequiresAdvance bit DEFAULT 0,
    AdvancePercent decimal(5,2)
);

CREATE TABLE [Order] (
    ID int IDENTITY(1,1) PRIMARY KEY,
    OrderNumber varchar(20) NOT NULL,
    AgentID int FOREIGN KEY REFERENCES Agent(ID),
    ManagerID int FOREIGN KEY REFERENCES Employee(ID),
    CreateDate varchar(20),
    OrderStatusID int FOREIGN KEY REFERENCES OrderStatus(ID),
    PaymentTypeID int FOREIGN KEY REFERENCES PaymentType(ID),
    TotalAmount decimal(15,2),
    DiscountPercent decimal(5,2) DEFAULT 0
);

CREATE TABLE OrderItem (
    ID int IDENTITY(1,1) PRIMARY KEY,
    OrderID int NOT NULL FOREIGN KEY REFERENCES [Order](ID),
    ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ID),
    Quantity int NOT NULL,
    UnitPrice decimal(10,2) NOT NULL,
    TotalPrice decimal(15,2) NOT NULL,
    QualityStatus varchar(20)
);

CREATE TABLE Workshop (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Number int NOT NULL,
    Name varchar(100),
    Description varchar(255),
    MaxCapacity int,
    IsActive bit DEFAULT 1
);

CREATE TABLE Equipment (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    SerialNumber varchar(50),
    WorkshopID int NOT NULL FOREIGN KEY REFERENCES Workshop(ID),
    InstallDate varchar(10),
    Status varchar(20)
);

CREATE TABLE ProductionTask (
    ID int IDENTITY(1,1) PRIMARY KEY,
    OrderItemID int NOT NULL FOREIGN KEY REFERENCES OrderItem(ID),
    WorkshopID int NOT NULL FOREIGN KEY REFERENCES Workshop(ID),
    ResponsibleEmployeeID int NOT NULL FOREIGN KEY REFERENCES Employee(ID),
    PlannedStartDate varchar(20) NOT NULL,
    PlannedEndDate varchar(20) NOT NULL,
    Status varchar(20),
    Priority int DEFAULT 5
);

CREATE TABLE Warehouse (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Address varchar(255),
    ResponsibleEmployeeID int FOREIGN KEY REFERENCES Employee(ID),
    IsActive bit DEFAULT 1
);

CREATE TABLE WarehouseZone (
    ID int IDENTITY(1,1) PRIMARY KEY,
    WarehouseID int NOT NULL FOREIGN KEY REFERENCES Warehouse(ID),
    ZoneName varchar(50) NOT NULL,
    Temperature decimal(4,1),
    Humidity decimal(5,2),
    IsClimateControlled bit DEFAULT 0
);

CREATE TABLE MaterialLocation (
    ID int IDENTITY(1,1) PRIMARY KEY,
    MaterialID int NOT NULL FOREIGN KEY REFERENCES Material(ID),
    WarehouseZoneID int NOT NULL FOREIGN KEY REFERENCES WarehouseZone(ID),
    Quantity decimal(10,3) NOT NULL,
    ReservedQuantity decimal(10,3) DEFAULT 0,
    LastUpdateDate varchar(20)
);

CREATE TABLE MaterialSupplier (
    MaterialID int NOT NULL FOREIGN KEY REFERENCES Material(ID),
    SupplierID int NOT NULL FOREIGN KEY REFERENCES Supplier(ID),
    PRIMARY KEY (MaterialID, SupplierID)
);

CREATE TABLE ProductMaterial (
    ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ID),
    MaterialID int NOT NULL FOREIGN KEY REFERENCES Material(ID),
    Count float,
    PRIMARY KEY (ProductID, MaterialID)
);

CREATE TABLE Shop (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Title varchar(150) NOT NULL,
    Address varchar(300),
    AgentID int NOT NULL FOREIGN KEY REFERENCES Agent(ID)
);

CREATE TABLE SystemLog (
    ID bigint IDENTITY(1,1) PRIMARY KEY,
    LogDate varchar(20),
    LogLevel varchar(10),
    UserID int FOREIGN KEY REFERENCES [User](ID),
    Action varchar(100),
    TableName varchar(50),
    RecordID int
);

CREATE TABLE NotificationTemplate (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Subject varchar(255),
    Body varchar(max),
    Type varchar(20),
    IsActive bit DEFAULT 1
);

CREATE TABLE Notification (
    ID bigint IDENTITY(1,1) PRIMARY KEY,
    TemplateID int NOT NULL FOREIGN KEY REFERENCES NotificationTemplate(ID),
    RecipientID int NOT NULL,
    Subject varchar(255),
    Body varchar(max),
    Type varchar(20),
    Status varchar(20),
    CreateDate varchar(20)
);

CREATE TABLE ReportTemplate (
    ID int IDENTITY(1,1) PRIMARY KEY,
    Name varchar(100) NOT NULL,
    Description varchar(255),
    SQLQuery varchar(max),
    Parameters varchar(max),
    CreatedBy int FOREIGN KEY REFERENCES [User](ID),
    CreatedDate varchar(20),
    IsActive bit DEFAULT 1
);

CREATE TABLE AgentSalesPlan (
    ID int IDENTITY(1,1) PRIMARY KEY,
    AgentID int NOT NULL FOREIGN KEY REFERENCES Agent(ID),
    Year int NOT NULL,
    Month int NOT NULL,
    PlannedAmount decimal(15,2),
    ActualAmount decimal(15,2) DEFAULT 0,
    BonusPercent decimal(5,2),
    CreatedDate varchar(20)
);

CREATE TABLE AgentPriorityHistory (
    ID int IDENTITY(1,1) PRIMARY KEY,
    AgentID int NOT NULL FOREIGN KEY REFERENCES Agent(ID),
    ChangeDate varchar(10) NOT NULL,
    PriorityValue int NOT NULL
);

CREATE TABLE MaterialCountHistory (
    ID int IDENTITY(1,1) PRIMARY KEY,
    MaterialID int NOT NULL FOREIGN KEY REFERENCES Material(ID),
    ChangeDate varchar(10) NOT NULL,
    CountValue float NOT NULL
);

CREATE TABLE ProductCostHistory (
    ID int IDENTITY(1,1) PRIMARY KEY,
    ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ID),
    ChangeDate varchar(10) NOT NULL,
    CostValue decimal(10,2) NOT NULL
);

CREATE TABLE ProductSale (
    ID int IDENTITY(1,1) PRIMARY KEY,
    AgentID int NOT NULL FOREIGN KEY REFERENCES Agent(ID),
    ProductID int NOT NULL FOREIGN KEY REFERENCES Product(ID),
    SaleDate varchar(10) NOT NULL,
    ProductCount int NOT NULL
);

INSERT INTO Region (Name, Code, DeliveryMultiplier, IsActive) VALUES
('Центральный федеральный округ', 'ЦФО', 1.0, 1),
('Северо-Западный федеральный округ', 'СЗФО', 1.2, 1),
('Южный федеральный округ', 'ЮФО', 1.1, 1),
('Приволжский федеральный округ', 'ПФО', 1.1, 1),
('Уральский федеральный округ', 'УФО', 1.2, 1);

INSERT INTO City (Name, RegionID, PostalCode, Latitude, Longitude) VALUES
('Москва', 1, '101000', 55.7558, 37.6176),
('Санкт-Петербург', 2, '190000', 59.9311, 30.3609),
('Ростов-на-Дону', 3, '344000', 47.2357, 39.7015),
('Казань', 4, '420000', 55.8304, 49.0661),
('Екатеринбург', 5, '620000', 56.8431, 60.6454);

INSERT INTO UserRole (RoleName, Description, Permissions) VALUES
('Администратор', 'Полный доступ к системе', '{"users": "full", "orders": "full", "reports": "full", "settings": "full"}'),
('Менеджер', 'Управление агентами и заказами', '{"agents": "full", "orders": "full", "reports": "read"}'),
('Мастер производства', 'Управление производством', '{"production": "full", "materials": "full", "equipment": "read"}'),
('Аналитик', 'Работа с отчетами и аналитикой', '{"reports": "full", "analytics": "full", "orders": "read"}'),
('Кладовщик', 'Управление складом', '{"materials": "full", "warehouse": "full", "inventory": "full"}');

INSERT INTO Department (Name, Description, IsActive) VALUES
('Управление', 'Административные функции', 1),
('Производство', 'Изготовление продукции', 1),
('Склад', 'Складские операции', 1),
('Отдел продаж', 'Работа с агентами', 1),
('Аналитический отдел', 'Анализ и планирование', 1);

INSERT INTO Position (Title, Description, BaseSalary, RequiredExperience, IsActive) VALUES
('Генеральный директор', 'Руководство компанией', 150000, 60, 1),
('Менеджер по продажам', 'Работа с агентами', 65000, 12, 1),
('Мастер производства', 'Контроль производства', 75000, 24, 1),
('Аналитик', 'Анализ данных', 55000, 6, 1),
('Кладовщик', 'Складские операции', 40000, 0, 1);

INSERT INTO [User] (Login, PasswordHash, Email, FirstName, LastName, UserRoleID, IsActive, CreatedAt) VALUES
('admin', 'hash123', 'admin@company.ru', 'Иван', 'Петров', 1, 1, '2024-01-01 10:00:00'),
('manager1', 'hash456', 'manager@company.ru', 'Мария', 'Сидорова', 2, 1, '2024-01-01 10:00:00'),
('master1', 'hash789', 'master@company.ru', 'Алексей', 'Козлов', 3, 1, '2024-01-01 10:00:00'),
('analyst1', 'hash012', 'analyst@company.ru', 'Ольга', 'Новикова', 4, 1, '2024-01-01 10:00:00'),
('storekeeper1', 'hash345', 'storekeeper@company.ru', 'Сергей', 'Васильев', 5, 1, '2024-01-01 10:00:00');

INSERT INTO Employee (PersonalNumber, FirstName, LastName, HireDate, DepartmentID, PositionID, UserID, Phone, Email, IsActive) VALUES
('EMP001', 'Иван', 'Петров', '2023-01-15', 1, 1, 1, '+79990000001', 'petrov@company.ru', 1),
('EMP002', 'Мария', 'Сидорова', '2023-02-20', 4, 2, 2, '+79990000002', 'sidorova@company.ru', 1),
('EMP003', 'Алексей', 'Козлов', '2023-03-10', 2, 3, 3, '+79990000003', 'kozlov@company.ru', 1),
('EMP004', 'Ольга', 'Новикова', '2023-04-05', 5, 4, 4, '+79990000004', 'novikova@company.ru', 1),
('EMP005', 'Сергей', 'Васильев', '2023-05-12', 3, 5, 5, '+79990000005', 'vasilev@company.ru', 1);

INSERT INTO AccessPoint (Name, Location, Type, IsActive) VALUES
('Главный вход', 'Административное здание - главный вход', 'Turnstile', 1),
('Вход в цех №1', 'Производственный корпус - цех 1', 'Door', 1),
('Склад сырья', 'Складской комплекс - входная зона', 'Door', 1),
('Административная зона', 'Офисное здание - 2 этаж', 'Door', 1),
('Парковка', 'Территория предприятия - шлагбаум', 'Gate', 1);

INSERT INTO NFCCard (CardNumber, EmployeeID, IssueDate, ExpiryDate, IsActive) VALUES
('NFC001', 1, '2024-01-01', '2025-01-01', 1),
('NFC002', 2, '2024-01-01', '2025-01-01', 1),
('NFC003', 3, '2024-01-01', '2025-01-01', 1),
('NFC004', 4, '2024-01-01', '2025-01-01', 1),
('NFC005', 5, '2024-01-01', '2025-01-01', 1);

INSERT INTO AccessLog (EmployeeID, AccessPointID, AccessTime, AccessType, IsSuccessful, CardNumber) VALUES
(1, 1, '2024-01-15 08:02:41', 'IN', 1, 'NFC001'),
(2, 1, '2024-01-15 08:15:30', 'IN', 1, 'NFC002'),
(3, 2, '2024-01-15 08:20:15', 'IN', 1, 'NFC003'),
(1, 1, '2024-01-15 17:30:00', 'OUT', 1, 'NFC001'),
(2, 1, '2024-01-15 18:00:00', 'OUT', 1, 'NFC002');

INSERT INTO Shift (Name, StartTime, EndTime, BreakDuration, IsActive) VALUES
('Дневная смена', '08:00:00', '17:00:00', 60, 1),
('Ночная смена', '20:00:00', '05:00:00', 60, 1),
('Сокращенная смена', '09:00:00', '15:00:00', 30, 1);

INSERT INTO WorkSchedule (EmployeeID, WorkDate, ShiftID, ActualStartTime, ActualEndTime, Status) VALUES
(1, '2024-01-15', 1, '2024-01-15 08:02:41', '2024-01-15 17:30:00', 'Completed'),
(2, '2024-01-15', 1, '2024-01-15 08:15:30', '2024-01-15 18:00:00', 'Completed'),
(3, '2024-01-15', 1, '2024-01-15 08:20:15', '2024-01-15 17:45:00', 'Completed');

INSERT INTO AgentType (Title, Image) VALUES
('ООО', 'company.png'),
('ИП', 'entrepreneur.png'),
('АО', 'company.png'),
('Самозанятый', 'self_employed.png');

INSERT INTO Agent (Title, AgentTypeID, Address, INN, DirectorName, Phone, Email, Priority) VALUES
('Торговый дом "Восток"', 1, 'г. Москва, ул. Ленина, 1', '123456789012', 'Иванов И.И.', '+79991112233', 'east@mail.ru', 1),
('ИП Сидоров', 2, 'г. Санкт-Петербург, Невский пр., 10', '234567890123', 'Сидоров С.С.', '+79992223344', 'sidorov@mail.ru', 2),
('АО "Северсталь"', 3, 'г. Ростов-на-Дону, ул. Садовая, 5', '345678901234', 'Петров П.П.', '+79993334455', 'sever@mail.ru', 1),
('ИП Козлова', 2, 'г. Казань, ул. Баумана, 15', '456789012345', 'Козлова О.П.', '+79994445566', 'kozlova@mail.ru', 3);

INSERT INTO MaterialType (Title, DefectedPercent) VALUES
('Краски', 2.5),
('Нитки', 1.8),
('Гранулы', 3.2),
('Ткани', 1.5);

INSERT INTO Material (Title, CountInPack, Unit, CountInStock, MinCount, Cost, MaterialTypeID) VALUES
('Краска акриловая белая', 10, 'л', 100, 20, 1500.00, 1),
('Нить хлопковая', 5, 'кг', 50, 10, 800.00, 2),
('Полимерные гранулы', 25, 'кг', 200, 50, 1200.00, 3),
('Ткань хлопковая', 1, 'м', 100, 25, 500.00, 4);

INSERT INTO Supplier (Title, INN, StartDate, QualityRating, SupplierType) VALUES
('Поставщик Красок ООО', '111222333444', '2020-01-15', 85, 'ООО'),
('ТекстильПроизводство', '222333444555', '2019-05-20', 90, 'ООО'),
('ПолимерыРус', '333444555666', '2021-03-10', 78, 'ИП');

INSERT INTO ProductType (Title, DefectedPercent) VALUES
('Текстильные изделия', 1.5),
('Строительные материалы', 2.8),
('Художественные товары', 1.2);

INSERT INTO Product (Title, ProductTypeID, ArticleNumber, MinCostForAgent) VALUES
('Ткань хлопковая', 1, 'T001', 1500.00),
('Краска акриловая', 3, 'P001', 450.00),
('Полимерные гранулы', 2, 'G001', 1200.00),
('Футболка хлопковая', 1, 'TS001', 800.00);

INSERT INTO OrderStatus (StatusName, Description, SortOrder, Color) VALUES
('Новый', 'Заявка создана', 1, '#007bff'),
('Подтвержден', 'Заявка подтверждена', 2, '#28a745'),
('В производстве', 'Продукция запущена в производство', 3, '#fd7e14'),
('Готов к отгрузке', 'Производство завершено', 4, '#20c997'),
('Отгружен', 'Продукция отгружена', 5, '#6f42c1');

INSERT INTO PaymentType (Name, Description, RequiresAdvance, AdvancePercent) VALUES
('Безналичный расчет', 'Перевод на расчетный счет', 1, 30.00),
('Наличный расчет', 'Оплата наличными при получении', 0, 0.00),
('Банковская карта', 'Оплата картой при получении', 0, 0.00),
('Рассрочка', 'Оплата в рассрочку', 1, 50.00);

INSERT INTO [Order] (OrderNumber, AgentID, ManagerID, CreateDate, OrderStatusID, PaymentTypeID, TotalAmount, DiscountPercent) VALUES
('ORD-00001', 1, 2, '2024-01-15 10:00:00', 1, 1, 150000.00, 5.00),
('ORD-00002', 2, 2, '2024-01-16 11:00:00', 2, 2, 75000.00, 10.00),
('ORD-00003', 3, 2, '2024-01-17 12:00:00', 3, 1, 200000.00, 0.00),
('ORD-00004', 4, 2, '2024-01-18 13:00:00', 4, 3, 120000.00, 15.00);

INSERT INTO OrderItem (OrderID, ProductID, Quantity, UnitPrice, TotalPrice, QualityStatus) VALUES
(1, 1, 100, 1500.00, 150000.00, 'Passed'),
(2, 2, 50, 1500.00, 75000.00, 'Pending'),
(3, 3, 200, 1000.00, 200000.00, 'Passed'),
(4, 4, 150, 800.00, 120000.00, 'Passed');

INSERT INTO Workshop (Number, Name, Description, MaxCapacity, IsActive) VALUES
(1, 'Цех подготовки материалов', 'Обработка и подготовка сырья', 20, 1),
(2, 'Цех основного производства', 'Изготовление продукции', 30, 1),
(3, 'Цех упаковки', 'Упаковка готовой продукции', 15, 1);

INSERT INTO Equipment (Name, SerialNumber, WorkshopID, InstallDate, Status) VALUES
('Станок токарный ТВ-320', 'SN001234', 1, '2023-01-15', 'Working'),
('Фрезерный станок ФС-250', 'SN001235', 1, '2023-02-20', 'Working'),
('Линия сборки ЛС-100', 'SN002001', 2, '2023-03-10', 'Working'),
('Упаковочная машина УМ-50', 'SN003001', 3, '2023-04-05', 'Working');

INSERT INTO ProductionTask (OrderItemID, WorkshopID, ResponsibleEmployeeID, PlannedStartDate, PlannedEndDate, Status, Priority) VALUES
(1, 1, 3, '2024-01-16 08:00:00', '2024-01-20 17:00:00', 'Completed', 5),
(2, 2, 3, '2024-01-17 08:00:00', '2024-01-22 17:00:00', 'InProgress', 3),
(3, 1, 3, '2024-01-18 08:00:00', '2024-01-25 17:00:00', 'Planned', 7),
(4, 3, 3, '2024-01-19 08:00:00', '2024-01-23 17:00:00', 'Completed', 4);

INSERT INTO Warehouse (Name, Address, ResponsibleEmployeeID, IsActive) VALUES
('Основной склад', 'Складской комплекс корпус А', 5, 1),
('Склад готовой продукции', 'Складской комплекс корпус Б', 5, 1);

INSERT INTO WarehouseZone (WarehouseID, ZoneName, Temperature, Humidity, IsClimateControlled) VALUES
(1, 'Зона А1', 20.0, 45.0, 1),
(1, 'Зона А2', 18.0, 40.0, 1),
(2, 'Зона Б1', 20.0, 45.0, 1);

INSERT INTO MaterialLocation (MaterialID, WarehouseZoneID, Quantity, ReservedQuantity, LastUpdateDate) VALUES
(1, 1, 100.000, 20.000, '2024-01-15 10:00:00'),
(2, 1, 50.000, 10.000, '2024-01-15 10:00:00'),
(3, 2, 200.000, 50.000, '2024-01-15 10:00:00'),
(4, 2, 100.000, 25.000, '2024-01-15 10:00:00');

INSERT INTO MaterialSupplier (MaterialID, SupplierID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 2);

INSERT INTO ProductMaterial (ProductID, MaterialID, Count) VALUES
(1, 4, 2.5),
(2, 1, 1.2),
(3, 3, 3.0),
(4, 2, 1.8);

INSERT INTO Shop (Title, Address, AgentID) VALUES
('Магазин "Текстиль"', 'г. Москва, ул. Ткацкая, 15', 1),
('Арт-салон "Краски"', 'г. Санкт-Петербург, ул. Художественная, 8', 2),
('Строительный маркет', 'г. Ростов-на-Дону, пр. Строителей, 25', 3);

INSERT INTO SystemLog (LogDate, LogLevel, UserID, Action, TableName, RecordID) VALUES
('2024-01-15 10:00:00', 'INFO', 1, 'CREATE', 'Order', 1),
('2024-01-16 11:00:00', 'INFO', 2, 'UPDATE', 'Order', 2),
('2024-01-17 12:00:00', 'WARN', 3, 'DELETE', 'Material', 1);

INSERT INTO NotificationTemplate (Name, Subject, Body, Type, IsActive) VALUES
('Новый заказ', 'Создан новый заказ', 'Уважаемый сотрудник, создан новый заказ №{OrderNumber}', 'Email', 1),
('Изменение статуса', 'Изменен статус заказа', 'Статус заказа №{OrderNumber} изменен на {Status}', 'SMS', 1);

INSERT INTO Notification (TemplateID, RecipientID, Subject, Body, Type, Status, CreateDate) VALUES
(1, 2, 'Создан новый заказ', 'Уважаемый сотрудник, создан новый заказ №ORD-00001', 'Email', 'Sent', '2024-01-15 10:05:00'),
(2, 2, 'Изменен статус заказа', 'Статус заказа №ORD-00002 изменен на Подтвержден', 'SMS', 'Sent', '2024-01-16 11:05:00');

INSERT INTO ReportTemplate (Name, Description, SQLQuery, CreatedBy, CreatedDate, IsActive) VALUES
('Отчет по продажам', 'Анализ продаж по месяцам', 'SELECT * FROM SalesReport', 1, '2024-01-01', 1),
('Отчет по производству', 'Загрузка производственных мощностей', 'SELECT * FROM ProductionReport', 1, '2024-01-01', 1);

INSERT INTO AgentSalesPlan (AgentID, Year, Month, PlannedAmount, ActualAmount, BonusPercent, CreatedDate) VALUES
(1, 2024, 1, 500000.00, 450000.00, 5.00, '2024-01-01'),
(2, 2024, 1, 300000.00, 320000.00, 7.00, '2024-01-01'),
(3, 2024, 1, 400000.00, 380000.00, 4.00, '2024-01-01');

INSERT INTO AgentPriorityHistory (AgentID, ChangeDate, PriorityValue) VALUES
(1, '2024-01-01', 1),
(2, '2024-01-01', 2),
(3, '2024-01-01', 1),
(4, '2024-01-01', 3);

INSERT INTO MaterialCountHistory (MaterialID, ChangeDate, CountValue) VALUES
(1, '2024-01-01', 120),
(1, '2024-01-15', 100),
(2, '2024-01-01', 60),
(2, '2024-01-15', 50);

INSERT INTO ProductCostHistory (ProductID, ChangeDate, CostValue) VALUES
(1, '2024-01-01', 1400.00),
(1, '2024-01-10', 1500.00),
(2, '2024-01-01', 1400.00),
(2, '2024-01-10', 1500.00);

INSERT INTO ProductSale (AgentID, ProductID, SaleDate, ProductCount) VALUES
(1, 1, '2024-01-10', 50),
(2, 2, '2024-01-11', 30),
(3, 3, '2024-01-12', 40),
(4, 4, '2024-01-13', 25);

-- Вывод ВСЕХ таблиц с данными
SELECT 'Region' as TableName, * FROM Region;
SELECT 'City' as TableName, * FROM City;
SELECT 'UserRole' as TableName, * FROM UserRole;
SELECT 'Department' as TableName, * FROM Department;
SELECT 'Position' as TableName, * FROM Position;
SELECT 'User' as TableName, * FROM [User];
SELECT 'Employee' as TableName, * FROM Employee;
SELECT 'AccessPoint' as TableName, * FROM AccessPoint;
SELECT 'NFCCard' as TableName, * FROM NFCCard;
SELECT 'AccessLog' as TableName, * FROM AccessLog;
SELECT 'Shift' as TableName, * FROM Shift;
SELECT 'WorkSchedule' as TableName, * FROM WorkSchedule;
SELECT 'AgentType' as TableName, * FROM AgentType;
SELECT 'Agent' as TableName, * FROM Agent;
SELECT 'MaterialType' as TableName, * FROM MaterialType;
SELECT 'Material' as TableName, * FROM Material;
SELECT 'Supplier' as TableName, * FROM Supplier;
SELECT 'ProductType' as TableName, * FROM ProductType;
SELECT 'Product' as TableName, * FROM Product;
SELECT 'OrderStatus' as TableName, * FROM OrderStatus;
SELECT 'PaymentType' as TableName, * FROM PaymentType;
SELECT 'Order' as TableName, * FROM [Order];
SELECT 'OrderItem' as TableName, * FROM OrderItem;
SELECT 'Workshop' as TableName, * FROM Workshop;
SELECT 'Equipment' as TableName, * FROM Equipment;
SELECT 'ProductionTask' as TableName, * FROM ProductionTask;
SELECT 'Warehouse' as TableName, * FROM Warehouse;
SELECT 'WarehouseZone' as TableName, * FROM WarehouseZone;
SELECT 'MaterialLocation' as TableName, * FROM MaterialLocation;
SELECT 'MaterialSupplier' as TableName, * FROM MaterialSupplier;
SELECT 'ProductMaterial' as TableName, * FROM ProductMaterial;
SELECT 'Shop' as TableName, * FROM Shop;
SELECT 'SystemLog' as TableName, * FROM SystemLog;
SELECT 'NotificationTemplate' as TableName, * FROM NotificationTemplate;
SELECT 'Notification' as TableName, * FROM Notification;
SELECT 'ReportTemplate' as TableName, * FROM ReportTemplate;
SELECT 'AgentSalesPlan' as TableName, * FROM AgentSalesPlan;
SELECT 'AgentPriorityHistory' as TableName, * FROM AgentPriorityHistory;
SELECT 'MaterialCountHistory' as TableName, * FROM MaterialCountHistory;
SELECT 'ProductCostHistory' as TableName, * FROM ProductCostHistory;
SELECT 'ProductSale' as TableName, * FROM ProductSale;
