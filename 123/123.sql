CREATE DATABASE ProductionCompany;
GO

USE ProductionCompany;
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AgentType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Image] [nvarchar](100) NULL,
 CONSTRAINT [PK_AgentType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Agent](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[AgentTypeID] [int] NOT NULL,
	[Address] [nvarchar](300) NULL,
	[INN] [varchar](12) NOT NULL,
	[KPP] [varchar](9) NULL,
	[DirectorName] [nvarchar](100) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Logo] [nvarchar](100) NULL,
	[Priority] [int] NOT NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[AgentPriorityHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ChangeDate] [date] NOT NULL,
	[PriorityValue] [int] NOT NULL,
 CONSTRAINT [PK_AgentPriorityHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_MaterialType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Material](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[CountInPack] [int] NOT NULL,
	[Unit] [nvarchar](10) NOT NULL,
	[CountInStock] [float] NULL,
	[MinCount] [float] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Cost] [decimal](10, 2) NOT NULL,
	[Image] [nvarchar](100) NULL,
	[MaterialTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialCountHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MaterialID] [int] NOT NULL,
	[ChangeDate] [date] NOT NULL,
	[CountValue] [float] NOT NULL,
 CONSTRAINT [PK_MaterialCountHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Supplier](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[INN] [varchar](12) NOT NULL,
	[StartDate] [date] NOT NULL,
	[QualityRating] [int] NULL,
	[SupplierType] [nvarchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[MaterialSupplier](
	[MaterialID] [int] NOT NULL,
	[SupplierID] [int] NOT NULL,
 CONSTRAINT [PK_MaterialSupplier] PRIMARY KEY CLUSTERED 
(
	[MaterialID] ASC,
	[SupplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[DefectedPercent] [float] NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[ProductTypeID] [int] NULL,
	[ArticleNumber] [nvarchar](10) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Image] [nvarchar](100) NULL,
	[ProductionPersonCount] [int] NULL,
	[ProductionWorkshopNumber] [int] NULL,
	[MinCostForAgent] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductCostHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ChangeDate] [date] NOT NULL,
	[CostValue] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_ProductCostHistory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductMaterial](
	[ProductID] [int] NOT NULL,
	[MaterialID] [int] NOT NULL,
	[Count] [float] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC,
	[MaterialID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AgentID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[SaleDate] [date] NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

CREATE TABLE [dbo].[Shop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](150) NOT NULL,
	[Address] [nvarchar](300) NULL,
	[AgentID] [int] NOT NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_AgentType] FOREIGN KEY([AgentTypeID])
REFERENCES [dbo].[AgentType] ([ID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_AgentType]
GO

ALTER TABLE [dbo].[AgentPriorityHistory]  WITH CHECK ADD  CONSTRAINT [FK_AgentPriorityHistory_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[AgentPriorityHistory] CHECK CONSTRAINT [FK_AgentPriorityHistory_Agent]
GO

ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_MaterialType] FOREIGN KEY([MaterialTypeID])
REFERENCES [dbo].[MaterialType] ([ID])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_MaterialType]
GO

ALTER TABLE [dbo].[MaterialCountHistory]  WITH CHECK ADD  CONSTRAINT [FK_MaterialCountHistory_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialCountHistory] CHECK CONSTRAINT [FK_MaterialCountHistory_Material]
GO

ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Material]
GO

ALTER TABLE [dbo].[MaterialSupplier]  WITH CHECK ADD  CONSTRAINT [FK_MaterialSupplier_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
GO
ALTER TABLE [dbo].[MaterialSupplier] CHECK CONSTRAINT [FK_MaterialSupplier_Supplier]
GO

ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO

ALTER TABLE [dbo].[ProductCostHistory]  WITH CHECK ADD  CONSTRAINT [FK_ProductCostHistory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductCostHistory] CHECK CONSTRAINT [FK_ProductCostHistory_Product]
GO

ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Material] FOREIGN KEY([MaterialID])
REFERENCES [dbo].[Material] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Material]
GO

ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Product]
GO

ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Agent]
GO

ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO

ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([ID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Agent]
GO

INSERT INTO [dbo].[AgentType] ([Title], [Image]) VALUES
(N'ООО', 'company.png'),
(N'АО', 'company.png'),
(N'ИП', 'entrepreneur.png'),
(N'Самозанятый', 'self_employed.png'),
(N'ПАО', 'company.png'),
(N'ЗАО', 'company.png'),
(N'МКК', 'company.png'),
(N'МФО', 'company.png')
GO

INSERT INTO [dbo].[Supplier] ([Title], [INN], [StartDate], [QualityRating], [SupplierType]) VALUES
(N'ГаражТелекомГор', '1718185951', '2011-12-20', 36, N'МКК'),
(N'Компания Омск', '1878504395', '2012-09-13', 2, N'ОАО'),
(N'ГорМонтаж', '1564667734', '2016-12-23', 79, N'ООО'),
(N'Микро', '2293562756', '2019-05-27', 64, N'МКК'),
(N'Электро', '1755853973', '2015-06-16', 14, N'ЗАО'),
(N'Компания Мотор', '1429908355', '2010-12-27', 50, N'ООО'),
(N'Асбоцем', '1944834477', '2011-04-10', 20, N'МФО'),
(N'ВостокМети', '1488487851', '2012-03-13', 58, N'ООО'),
(N'МясКрепТеле', '2152486844', '2018-11-11', 59, N'ПАО'),
(N'Софт', '1036521658', '2011-11-23', 67, N'МКК'),
(N'Компания СервисМикроО', '1178826599', '2012-07-07', 5, N'ООО'),
(N'ИнфоГазМотор', '1954050214', '2011-07-23', 42, N'ОАО'),
(N'Монтаж', '1163880101', '2016-05-23', 10, N'ОАО'),
(N'ЭлектроЦвет', '1654184411', '2015-06-25', 3, N'ОАО'),
(N'Компания НефтьITИнф', '1685247455', '2017-03-09', 85, N'ООО'),
(N'ТомскНефть', '1002996016', '2015-05-07', 95, N'ООО'),
(N'ТомскТяжРеч', '1102143492', '2014-12-22', 36, N'МФО'),
(N'УралХме', '2291253256', '2015-05-22', 82, N'ООО'),
(N'ВодРыб', '1113468466', '2011-11-25', 21, N'ЗАО'),
(N'УралСервисМон', '1892306757', '2016-12-20', 26, N'МКК'),
(N'Казань', '1965011544', '2015-03-16', 51, N'ОАО'),
(N'Cиб', '1949139718', '2011-11-28', 95, N'ОАО'),
(N'ГаражГазМ', '1740623312', '2011-11-20', 86, N'ОАО'),
(N'МобайлДизайнОмск', '1014490629', '2019-10-28', 73, N'ООО'),
(N'ЖелДорГаз', '1255275062', '2014-09-04', 76, N'МФО'),
(N'ТверьБухГаз', '2167673760', '2013-11-13', 9, N'ОАО'),
(N'ТелекомТранс', '2200735978', '2015-01-11', 8, N'ОАО'),
(N'ГаражГлав', '1404774111', '2013-06-28', 89, N'МКК'),
(N'Компания К', '1468114280', '2018-12-07', 70, N'ПАО'),
(N'ТяжЛифтВостокС', '1032089879', '2012-08-13', 66, N'ОАО'),
(N'Компания Во', '2027005945', '2016-06-22', 11, N'ПАО'),
(N'МоторКаз', '1076279398', '2015-08-23', 37, N'ОАО'),
(N'Сервис', '2031832854', '2011-11-25', 25, N'ОАО'),
(N'ЮпитерТомс', '1551173338', '2011-07-28', 60, N'ПАО'),
(N'Мор', '1906157177', '2011-03-06', 82, N'МКК'),
(N'СеверТехВостокЛизинг', '1846812080', '2011-02-26', 30, N'ООО'),
(N'ЦементОбл', '2021607106', '2015-10-03', 42, N'ООО'),
(N'Компания КазаньАвтоCиб', '1371692583', '2015-10-19', 23, N'МКК'),
(N'ГаражХозФлот', '2164720385', '2018-08-28', 7, N'ОАО'),
(N'Компания МорМетал', '1947163072', '2013-11-18', 33, N'ООО'),
(N'ГлавРыб', '1426268088', '2018-11-09', 46, N'МФО'),
(N'CибCибОрио', '1988313615', '2018-01-13', 95, N'ООО'),
(N'ТелеРыбХм', '2299034130', '2012-02-10', 3, N'ООО'),
(N'ГлавАвтоГазТрест', '2059691335', '2014-08-04', 18, N'МФО'),
(N'ТяжКазаньБашкир', '1794419510', '2015-12-22', 85, N'ПАО'),
(N'Асбоцемент', '1650212184', '2018-12-09', 80, N'МФО'),
(N'Мотор', '1019917089', '2017-04-24', 19, N'ПАО'),
(N'МорФинансФинансМаш', '1549496316', '2013-06-18', 68, N'ООО'),
(N'РыбВектор', '2275526397', '2011-06-20', 92, N'ОАО'),
(N'Теле', '2170198203', '2010-05-01', 11, N'ПАО')
GO

INSERT INTO [dbo].[MaterialType] ([Title], [DefectedPercent]) VALUES
(N'Краски', 2.5),
(N'Нитки', 1.8),
(N'Гранулы', 3.2)
GO

INSERT INTO [dbo].[Material] ([Title], [CountInPack], [Unit], [CountInStock], [MinCount], [Description], [Cost], [Image], [MaterialTypeID]) VALUES
(N'Гранулы белый 2x2', 7, N'л', 76, 8, NULL, 47680.00, 'не указано', 3),
(N'Нить серый 1x0', 1, N'м', 978, 42, NULL, 27456.00, 'не указано', 1),
(N'Нить белый 1x3', 8, N'м', 406, 27, NULL, 2191.00, 'не указано', 2),
(N'Нить цветной 1x1', 3, N'г', 424, 10, NULL, 8619.00, '\materials\image_5.jpeg', 1),
(N'Нить цветной 2x0', 2, N'м', 395, 26, NULL, 16856.00, 'отсутствует', 1),
(N'Краска синий 2x2', 6, N'л', 334, 48, NULL, 403.00, 'не указано', 1),
(N'Нить синий 0x2', 9, N'м', 654, 10, NULL, 7490.00, 'отсутствует', 2),
(N'Гранулы серый 2x2', 7, N'л', 648, 17, NULL, 15478.00, 'не указано', 3),
(N'Краска синий 1x2', 2, N'л', 640, 50, NULL, 44490.00, 'отсутствует', 1),
(N'Нить зеленый 2x0', 5, N'м', 535, 45, NULL, 28301.00, '\materials\image_10.jpeg', 1),
(N'Гранулы синий 1x2', 3, N'кг', 680, 6, NULL, 9242.00, 'не указано', 3),
(N'Нить синий 3x2', 1, N'м', 529, 13, NULL, 10878.00, 'отсутствует', 2),
(N'Краска белый 2x2', 1, N'л', 659, 35, NULL, 29906.00, '\materials\image_3.jpeg', 1),
(N'Краска зеленый 0x3', 2, N'л', 50, 48, NULL, 24073.00, 'не указано', 1),
(N'Нить зеленый 2x3', 7, N'г', 649, 25, NULL, 20057.00, 'отсутствует', 2),
(N'Краска белый 2x1', 2, N'л', 790, 8, NULL, 3353.00, 'не указано', 1),
(N'Нить серый 2x3', 1, N'г', 431, 40, NULL, 22452.00, 'не указано', 2),
(N'Гранулы серый 3x2', 5, N'л', 96, 9, NULL, 29943.00, 'нет', 3),
(N'Краска серый 3x2', 3, N'л', 806, 50, NULL, 55064.00, 'отсутствует', 1),
(N'Гранулы белый 0x3', 3, N'кг', 538, 11, NULL, 7183.00, 'нет', 3)
GO

INSERT INTO [dbo].[MaterialSupplier] ([MaterialID], [SupplierID]) VALUES
(1, 5),
(1, 40),
(2, 9),
(2, 32),
(2, 20),
(2, 17),
(3, 10),
(3, 27),
(4, 13),
(5, 8)
GO

INSERT INTO [dbo].[Agent] ([Title], [AgentTypeID], [Address], [INN], [KPP], [DirectorName], [Phone], [Email], [Logo], [Priority]) VALUES
(N'Агентство Продаж 1', 1, N'г. Москва, ул. Ленина, д. 1', '123456789012', '123456789', N'Иванов И.И.', '+79991234567', 'agent1@mail.com', 'logo1.png', 1),
(N'Торговый Дом 2', 2, N'г. Санкт-Петербург, Невский пр., д. 10', '234567890123', '234567890', N'Петров П.П.', '+79992345678', 'agent2@mail.com', 'logo2.png', 2),
(N'ИП Сидоров', 3, N'г. Казань, ул. Баумана, д. 5', '345678901234', NULL, N'Сидоров С.С.', '+79993456789', 'agent3@mail.com', 'logo3.png', 3)
GO

INSERT INTO [dbo].[ProductType] ([Title], [DefectedPercent]) VALUES
(N'Текстильные изделия', 1.5),
(N'Строительные материалы', 2.8),
(N'Художественные товары', 1.2)
GO

INSERT INTO [dbo].[Product] ([Title], [ProductTypeID], [ArticleNumber], [Description], [Image], [ProductionPersonCount], [ProductionWorkshopNumber], [MinCostForAgent]) VALUES
(N'Ткань хлопковая', 1, 'T001', N'Высококачественная хлопковая ткань', 'fabric1.jpg', 3, 1, 1500.00),
(N'Краска акриловая', 3, 'P001', N'Акриловая краска для художественных работ', 'paint1.jpg', 2, 2, 450.00),
(N'Полимерные гранулы', 2, 'G001', N'Гранулы для производства пластиковых изделий', 'granules1.jpg', 4, 3, 1200.00)
GO

INSERT INTO [dbo].[ProductMaterial] ([ProductID], [MaterialID], [Count]) VALUES
(1, 2, 2.5),
(1, 4, 1.2),
(2, 6, 0.8),
(2, 9, 1.5),
(3, 1, 3.2),
(3, 8, 2.1)
GO

INSERT INTO [dbo].[ProductSale] ([AgentID], [ProductID], [SaleDate], [ProductCount]) VALUES
(1, 1, '2024-01-15', 100),
(1, 2, '2024-01-16', 50),
(2, 1, '2024-01-17', 75),
(2, 3, '2024-01-18', 30),
(3, 2, '2024-01-19', 40),
(3, 3, '2024-01-20', 25)
GO

INSERT INTO [dbo].[Shop] ([Title], [Address], [AgentID]) VALUES
(N'Магазин "Текстиль"', N'г. Москва, ул. Ткацкая, д. 15', 1),
(N'Арт-салон "Краски"', N'г. Санкт-Петербург, ул. Художественная, д. 8', 2),
(N'Строительный маркет', N'г. Казань, пр. Строителей, д. 25', 3)
GO

INSERT INTO [dbo].[AgentPriorityHistory] ([AgentID], [ChangeDate], [PriorityValue]) VALUES
(1, '2024-01-01', 2),
(1, '2024-01-10', 1),
(2, '2024-01-01', 3),
(2, '2024-01-15', 2),
(3, '2024-01-01', 1),
(3, '2024-01-20', 3)
GO

INSERT INTO [dbo].[MaterialCountHistory] ([MaterialID], [ChangeDate], [CountValue]) VALUES
(1, '2024-01-15', 80),
(1, '2024-01-20', 76),
(2, '2024-01-16', 1000),
(2, '2024-01-25', 978),
(3, '2024-01-17', 420),
(3, '2024-01-22', 406)
GO

INSERT INTO [dbo].[ProductCostHistory] ([ProductID], [ChangeDate], [CostValue]) VALUES
(1, '2024-01-01', 1450.00),
(1, '2024-01-10', 1500.00),
(2, '2024-01-01', 420.00),
(2, '2024-01-12', 450.00),
(3, '2024-01-01', 1150.00),
(3, '2024-01-08', 1200.00)
GO

CREATE INDEX IX_Agent_AgentTypeID ON [dbo].[Agent] ([AgentTypeID])
CREATE INDEX IX_Material_MaterialTypeID ON [dbo].[Material] ([MaterialTypeID])
CREATE INDEX IX_Product_ProductTypeID ON [dbo].[Product] ([ProductTypeID])
CREATE INDEX IX_ProductSale_AgentID ON [dbo].[ProductSale] ([AgentID])
CREATE INDEX IX_ProductSale_ProductID ON [dbo].[ProductSale] ([ProductID])
CREATE INDEX IX_MaterialSupplier_MaterialID ON [dbo].[MaterialSupplier] ([MaterialID])
CREATE INDEX IX_MaterialSupplier_SupplierID ON [dbo].[MaterialSupplier] ([SupplierID])
GO




