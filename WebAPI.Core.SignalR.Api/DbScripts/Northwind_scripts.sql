USE [Northwind]
GO
/****** Object:  Table [dbo].[MessageTypes]    Script Date: 9/28/2021 1:14:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MessageTypes](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedById] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_MessageTypes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 9/28/2021 1:14:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notification](
	[Id] [uniqueidentifier] NOT NULL,
	[MessageTypeId] [uniqueidentifier] NOT NULL,
	[SenderId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Subject] [nvarchar](1000) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsTrash] [bit] NOT NULL,
	[DateReceivedOn] [datetime] NULL,
	[DateReadOn] [datetime] NULL,
	[DateTimeSentOn] [datetime] NULL,
	[IsMarkedImportant] [bit] NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedById] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/28/2021 1:14:15 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](256) NULL,
	[PhoneNumber] [nvarchar](100) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[PasswordExpiration] [datetime] NOT NULL,
	[InvitationExpiration] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[ModifiedById] [uniqueidentifier] NOT NULL,
	[ModifiedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[MessageTypes] ([Id], [Name], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'd884d679-b295-4684-be44-ba92b8181e02', N'Purchase', N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:46:14.390' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:46:14.390' AS DateTime))
GO
INSERT [dbo].[MessageTypes] ([Id], [Name], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'14b47f02-8e34-4b60-8430-c1c902566a83', N'Registration', N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:45:58.907' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:45:58.907' AS DateTime))
GO
INSERT [dbo].[Notification] ([Id], [MessageTypeId], [SenderId], [UserId], [Subject], [Body], [IsRead], [IsTrash], [DateReceivedOn], [DateReadOn], [DateTimeSentOn], [IsMarkedImportant], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'9764fb4b-e551-4259-b513-1e009abd2d74', N'14b47f02-8e34-4b60-8430-c1c902566a83', N'2be97fe4-ce53-4457-8536-0dd12ed49371', N'2be97fe4-ce53-4457-8536-0dd12ed49371', N'User Register Successfully', N'Congratulations', 0, 0, CAST(N'2021-09-27T00:50:15.630' AS DateTime), NULL, CAST(N'2021-09-27T00:50:15.630' AS DateTime), 0, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:50:15.630' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:50:15.630' AS DateTime))
GO
INSERT [dbo].[Notification] ([Id], [MessageTypeId], [SenderId], [UserId], [Subject], [Body], [IsRead], [IsTrash], [DateReceivedOn], [DateReadOn], [DateTimeSentOn], [IsMarkedImportant], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'e90a6407-9253-48f7-83a9-588ae788e8af', N'14b47f02-8e34-4b60-8430-c1c902566a83', N'2be97fe4-ce53-4457-8536-0dd12ed49371', N'9ad2e20d-b793-4db3-9c04-e3d7741bc34f', N'User Register Successfully', N'Congratulations', 0, 0, CAST(N'2021-09-27T00:51:59.370' AS DateTime), NULL, CAST(N'2021-09-27T00:51:59.370' AS DateTime), 0, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:51:59.370' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:51:59.370' AS DateTime))
GO
INSERT [dbo].[Notification] ([Id], [MessageTypeId], [SenderId], [UserId], [Subject], [Body], [IsRead], [IsTrash], [DateReceivedOn], [DateReadOn], [DateTimeSentOn], [IsMarkedImportant], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'0d0a1ac4-6349-4fcd-a49a-da649e95fe48', N'14b47f02-8e34-4b60-8430-c1c902566a83', N'2be97fe4-ce53-4457-8536-0dd12ed49371', N'0f6815e1-aab9-47cb-911b-ecd304b39b27', N'User Register Successfully', N'Congratulations', 0, 0, CAST(N'2021-09-27T00:50:54.617' AS DateTime), NULL, CAST(N'2021-09-27T00:50:54.617' AS DateTime), 0, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:50:54.617' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:50:54.617' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'2be97fe4-ce53-4457-8536-0dd12ed49371', N'Sumit', N'Das', N'sumit.das@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'sumit.das', CAST(N'2022-09-27T00:37:14.333' AS DateTime), CAST(N'2021-09-28T00:37:14.333' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:37:14.333' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:37:14.333' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'62e02906-4ad3-4674-a0dd-19f5b05e49b8', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser3', CAST(N'2022-09-27T00:42:51.467' AS DateTime), CAST(N'2021-09-28T00:42:51.467' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:51.467' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:51.467' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'8179e86b-3c4c-4c00-b2b5-2df324973216', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser10', CAST(N'2022-09-27T00:43:13.927' AS DateTime), CAST(N'2021-09-28T00:43:13.927' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:13.927' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:13.927' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'a3b0e482-19d2-46a5-a9a9-424bdb6b3cf0', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser2', CAST(N'2022-09-27T00:42:44.207' AS DateTime), CAST(N'2021-09-28T00:42:44.207' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:44.207' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:44.207' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'ea8d9613-e6f7-4211-b66e-4bab60fcfa01', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser8', CAST(N'2022-09-27T00:43:07.727' AS DateTime), CAST(N'2021-09-28T00:43:07.727' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:07.727' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:07.727' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'522273c8-7d94-44ed-8d75-7a1111e0b963', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser4', CAST(N'2022-09-27T00:42:55.723' AS DateTime), CAST(N'2021-09-28T00:42:55.723' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:55.723' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:55.723' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'f9ddfe69-5735-4b96-b854-887f765ab226', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser7', CAST(N'2022-09-27T00:43:05.330' AS DateTime), CAST(N'2021-09-28T00:43:05.330' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:05.330' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:05.330' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'303b66eb-dcde-4a87-879c-ca8fb16ec7fb', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser5', CAST(N'2022-09-27T00:42:58.833' AS DateTime), CAST(N'2021-09-28T00:42:58.833' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:58.833' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:58.833' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'9ad2e20d-b793-4db3-9c04-e3d7741bc34f', N'Rohit', N'Sahani', N'rohit.sahani@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'rohit.sahani', CAST(N'2022-09-27T00:41:32.177' AS DateTime), CAST(N'2021-09-28T00:41:32.177' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:41:32.177' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:41:32.177' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'0f6815e1-aab9-47cb-911b-ecd304b39b27', N'Testing', N'User1', N'test.user1@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser1', CAST(N'2022-09-27T00:42:36.353' AS DateTime), CAST(N'2021-09-28T00:42:36.353' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:36.353' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:42:36.353' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'970d514f-aa74-4a1f-ba72-eea9a874119c', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser6', CAST(N'2022-09-27T00:43:02.530' AS DateTime), CAST(N'2021-09-28T00:43:02.530' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:02.530' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:02.530' AS DateTime))
GO
INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [Email], [EmailConfirmed], [PasswordHash], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [PasswordExpiration], [InvitationExpiration], [IsActive], [CreatedById], [CreatedOn], [ModifiedById], [ModifiedOn]) VALUES (N'2925aecb-1f2c-4b02-bd9e-fd40a038c9e9', N'Testing', N'User2', N'test.user2@hach.com', 1, N'ADKaHZRgqFsIOsL3O2/rFLI9VOo6LB25W+gPpFUBpBuY3ANrfxLEahqw78mqaEzuBA==', NULL, 0, 0, NULL, 1, 0, N'testuser9', CAST(N'2022-09-27T00:43:10.713' AS DateTime), CAST(N'2021-09-28T00:43:10.713' AS DateTime), 1, N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:10.713' AS DateTime), N'2be97fe4-ce53-4457-8536-0dd12ed49371', CAST(N'2021-09-27T00:43:10.713' AS DateTime))
GO
ALTER TABLE [dbo].[Notification] ADD  DEFAULT ((0)) FOR [IsMarkedImportant]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('1900-01-01T00:00:00.000') FOR [PasswordExpiration]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypes_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MessageTypes] CHECK CONSTRAINT [FK_MessageTypes_Users_CreatedById]
GO
ALTER TABLE [dbo].[MessageTypes]  WITH CHECK ADD  CONSTRAINT [FK_MessageTypes_Users_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[MessageTypes] CHECK CONSTRAINT [FK_MessageTypes_Users_ModifiedById]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notifications_CreatedById]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_MessageTypes] FOREIGN KEY([MessageTypeId])
REFERENCES [dbo].[MessageTypes] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notifications_MessageTypes]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_ModifiedById] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notifications_ModifiedById]
GO
ALTER TABLE [dbo].[Notification]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Notification] CHECK CONSTRAINT [FK_Notifications_Users]
GO
