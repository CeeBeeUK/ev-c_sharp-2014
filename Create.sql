USE [CeeBeeData]
GO

/****** Object:  Table [dbo].[Countries]    Script Date: 04/26/2014 11:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Countries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Countries] ON
INSERT [dbo].[Countries] ([id], [Name]) VALUES (1, N'Albania')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (2, N'Armenia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (3, N'Austria')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (4, N'Azerbaijan')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (5, N'Belarus')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (6, N'Belgium')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (7, N'Denmark')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (8, N'Estonia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (9, N'FYR Macedonia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (10, N'Finland')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (11, N'France')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (12, N'Georgia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (13, N'Germany')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (14, N'Greece')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (15, N'Hungary')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (16, N'Iceland')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (17, N'Ireland')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (18, N'Israel')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (19, N'Italy')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (20, N'Latvia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (21, N'Lithuania')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (22, N'Malta')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (23, N'Moldova')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (24, N'Montenegro')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (25, N'Norway')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (26, N'Poland')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (27, N'Portugal')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (28, N'Romania')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (29, N'Russia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (30, N'San Marino')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (31, N'Slovenia')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (32, N'Spain')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (33, N'Sweden')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (34, N'Switzerland')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (35, N'The Netherlands')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (36, N'Ukraine')
INSERT [dbo].[Countries] ([id], [Name]) VALUES (37, N'United Kingdom')
SET IDENTITY_INSERT [dbo].[Countries] OFF
/****** Object:  Table [dbo].[Events]    Script Date: 04/26/2014 11:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Events](
	[Year] [int] NOT NULL,
	[HostCity] [nvarchar](50) NULL,
	[CountryID] [int] NOT NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Year] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Events] ([Year], [HostCity], [CountryID], [Active]) VALUES (2013, N'Malmo', 33, 1)
INSERT [dbo].[Events] ([Year], [HostCity], [CountryID], [Active]) VALUES (2014, N'Copenhagen', 7, 1)
/****** Object:  Table [dbo].[EventPlayers]    Script Date: 04/26/2014 11:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventPlayers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Year] [int] NOT NULL,
	[PlayerGuid] [uniqueidentifier] NOT NULL,
	[PredictedUKScore] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_EventPlayer] UNIQUE NONCLUSTERED 
(
	[Year] ASC,
	[PlayerGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventCountries]    Script Date: 04/26/2014 11:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventCountries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[EventID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[Sequence] [int] NOT NULL,
	[FinalRealScore] [int] NOT NULL,
	[OwningPlayer] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_Sequence] UNIQUE NONCLUSTERED 
(
	[EventID] ASC,
	[CountryID] ASC,
	[Sequence] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[EventCountries] ON
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (1, 2014, 7, 1, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (2, 2014, 11, 2, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (3, 2014, 13, 3, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (4, 2014, 19, 4, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (5, 2014, 32, 5, 0, N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[EventCountries] ([id], [EventID], [CountryID], [Sequence], [FinalRealScore], [OwningPlayer]) VALUES (6, 2014, 37, 6, 0, N'5ec2c828-3cf3-448c-b635-fe4255682432')
SET IDENTITY_INSERT [dbo].[EventCountries] OFF
/****** Object:  Table [dbo].[PlayerEventCountryScores]    Script Date: 04/26/2014 11:51:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlayerEventCountryScores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[PlayerGuid] [uniqueidentifier] NOT NULL,
	[EventCountryID] [int] NOT NULL,
	[Score] [int] NULL,
	[BestUseOfBongos] [bit] NOT NULL,
	[Fattest] [bit] NOT NULL,
	[Notes] [nvarchar](4000) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_PlayerCountry] UNIQUE NONCLUSTERED 
(
	[EventCountryID] ASC,
	[PlayerGuid] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  ForeignKey [EventCountry_Country]    Script Date: 04/26/2014 11:51:00 ******/
ALTER TABLE [dbo].[EventCountries]  WITH CHECK ADD  CONSTRAINT [EventCountry_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCountries] CHECK CONSTRAINT [EventCountry_Country]
GO
/****** Object:  ForeignKey [EventCountry_Event]    Script Date: 04/26/2014 11:51:00 ******/
ALTER TABLE [dbo].[EventCountries]  WITH CHECK ADD  CONSTRAINT [EventCountry_Event] FOREIGN KEY([EventID])
REFERENCES [dbo].[Events] ([Year])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventCountries] CHECK CONSTRAINT [EventCountry_Event]
GO
/****** Object:  ForeignKey [EventPlayer_Event]    Script Date: 04/26/2014 11:51:00 ******/
ALTER TABLE [dbo].[EventPlayers]  WITH CHECK ADD  CONSTRAINT [EventPlayer_Event] FOREIGN KEY([Year])
REFERENCES [dbo].[Events] ([Year])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EventPlayers] CHECK CONSTRAINT [EventPlayer_Event]
GO
/****** Object:  ForeignKey [Event_Country]    Script Date: 04/26/2014 11:51:00 ******/
ALTER TABLE [dbo].[Events]  WITH CHECK ADD  CONSTRAINT [Event_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Countries] ([id])
GO
ALTER TABLE [dbo].[Events] CHECK CONSTRAINT [Event_Country]
GO
/****** Object:  ForeignKey [PlayerEventCountryScore_EventCountry]    Script Date: 04/26/2014 11:51:00 ******/
ALTER TABLE [dbo].[PlayerEventCountryScores]  WITH CHECK ADD  CONSTRAINT [PlayerEventCountryScore_EventCountry] FOREIGN KEY([EventCountryID])
REFERENCES [dbo].[EventCountries] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlayerEventCountryScores] CHECK CONSTRAINT [PlayerEventCountryScore_EventCountry]
GO
