USE [Assign3DB]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 22/12/2020 7:29:01 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](500) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 22/12/2020 7:29:01 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Status] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](500) NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
	[Contact] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[OrderedItem]    Script Date: 22/12/2020 7:29:01 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderedItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[Qauntity] [int] NOT NULL,
	[ProductId] [int] NULL,
 CONSTRAINT [PK_OrderedItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 22/12/2020 7:29:01 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[CategoryId] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[OrderedItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderedItem_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderedItem] CHECK CONSTRAINT [FK_OrderedItem_Order]
GO
ALTER TABLE [dbo].[OrderedItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderedItem_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderedItem] CHECK CONSTRAINT [FK_OrderedItem_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
