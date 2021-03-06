USE [project]
GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Attendance_id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[Employee] [int] NOT NULL,
	[Date] [date] NULL,
	[timing] [datetime] NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[attendance_status] [nvarchar](50) NULL,
	[in_time] [time](7) NULL,
	[out_time] [time](7) NULL,
	[reports] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Attendance_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[Company_id] [int] IDENTITY(1,1) NOT NULL,
	[in_time] [time](7) NULL,
	[out_time] [time](7) NULL,
	[address] [nvarchar](max) NULL,
	[policies] [text] NULL,
	[web_address] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[phone_number] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
	[logo_design] [text] NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[Company_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[Department_id] [int] IDENTITY(1,1) NOT NULL,
	[Company] [int] NOT NULL,
	[in_time] [time](7) NULL,
	[out_time] [time](7) NULL,
	[phone_number] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[Department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[Employee_id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[qualification] [nvarchar](max) NULL,
	[email] [nvarchar](max) NULL,
	[username] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[phone_number] [nvarchar](50) NULL,
	[address] [nvarchar](max) NULL,
	[work_experience] [nvarchar](max) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[designation] [nvarchar](max) NULL,
	[hire_date] [date] NULL,
	[in_time] [time](7) NULL,
	[out_time] [time](7) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[images] [text] NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Holiday]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Holiday](
	[Holiday_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[start_date] [date] NULL,
	[end_date] [date] NULL,
 CONSTRAINT [PK_Holiday] PRIMARY KEY CLUSTERED 
(
	[Holiday_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Overtime]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Overtime](
	[Overtime_id] [int] IDENTITY(1,1) NOT NULL,
	[Department] [int] NOT NULL,
	[Employee] [int] NOT NULL,
	[extra_hours] [datetime] NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
 CONSTRAINT [PK_Overtime] PRIMARY KEY CLUSTERED 
(
	[Overtime_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Role_id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 9/14/2019 8:08:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[User_id] [int] IDENTITY(1,1) NOT NULL,
	[email] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone_number] [nvarchar](50) NULL,
	[password] [nvarchar](50) NULL,
	[first_name] [nvarchar](50) NULL,
	[last_name] [nvarchar](50) NULL,
	[created_date] [datetime] NULL,
	[created_by] [nvarchar](max) NULL,
	[modify_date] [datetime] NULL,
	[modify_by] [nvarchar](max) NULL,
	[status] [nvarchar](50) NULL,
	[user_name] [nvarchar](50) NULL,
	[role] [nvarchar](50) NULL,
	[confirm_password] [nvarchar](50) NULL,
	[old_password] [nvarchar](50) NULL,
	[new_password] [nvarchar](50) NULL,
	[images] [text] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[User_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Attendance] ON 

INSERT [dbo].[Attendance] ([Attendance_id], [Department], [Employee], [Date], [timing], [created_date], [created_by], [modify_date], [modify_by], [status], [attendance_status], [in_time], [out_time], [reports]) VALUES (1002, 1010, 1009, CAST(N'2019-09-13' AS Date), CAST(N'2019-09-27T00:12:00.000' AS DateTime), NULL, NULL, NULL, NULL, N'Active', N'Present', CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), N'qw')
INSERT [dbo].[Attendance] ([Attendance_id], [Department], [Employee], [Date], [timing], [created_date], [created_by], [modify_date], [modify_by], [status], [attendance_status], [in_time], [out_time], [reports]) VALUES (1016, 1009, 5, CAST(N'2019-09-11' AS Date), NULL, NULL, NULL, NULL, NULL, NULL, N'Active', CAST(N'12:00:00' AS Time), CAST(N'02:00:00' AS Time), N'yes')
SET IDENTITY_INSERT [dbo].[Attendance] OFF
SET IDENTITY_INSERT [dbo].[Company] ON 

INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (2, CAST(N'12:13:00' AS Time), CAST(N'06:13:00' AS Time), N'defense', N'copyright', N'http://www.example.com', N'abc@gmail.com', N'123', NULL, NULL, CAST(N'2019-09-14T14:04:50.267' AS DateTime), N'hero', N'Active', N'a', NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (4, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Inactive', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (7, CAST(N'12:13:00' AS Time), CAST(N'06:13:00' AS Time), N'defense', N'copyright', N'www.admintheme.com', N'abc@gmail.com', N'123', NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (8, CAST(N'12:13:00' AS Time), CAST(N'06:13:00' AS Time), N'defense', N'copyright', N'www.admintheme.com', N'abc@gmail.com', N'123', NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (9, CAST(N'13:09:00' AS Time), CAST(N'06:13:00' AS Time), N'colony', N'copyright', N'www.admintheme.com', N'abc@gmail.com', N'123', NULL, NULL, NULL, NULL, N'Inactive', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (10, CAST(N'12:13:00' AS Time), CAST(N'06:13:00' AS Time), N'defense', N'copyright', N'www.admintheme.com', N'abc@gmail.com', N'123', NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (11, CAST(N'13:09:00' AS Time), CAST(N'06:13:00' AS Time), N'defense', N'copyright', N'www.admintheme.com', N'abc@gmail.com', N'123', NULL, NULL, NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (12, CAST(N'00:34:00' AS Time), CAST(N'00:34:00' AS Time), N'colony', N'copyright', N' http://example.com', N'aw@gmail.com', N'167', CAST(N'2019-08-22T15:44:44.803' AS DateTime), N'un', NULL, NULL, N'Active', NULL, NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (13, CAST(N'00:23:00' AS Time), CAST(N'00:35:00' AS Time), N'dr', N'copyright', N'http://example.com', N'abc@gmail.com', N'123', CAST(N'2019-08-28T10:42:57.877' AS DateTime), N'un', NULL, NULL, N'Active', N'theta', NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (14, CAST(N'12:31:00' AS Time), CAST(N'02:31:00' AS Time), N'shahab road', N'copyright', N'http://example.com', N'h@gmail.com', N'12', CAST(N'2019-08-29T19:46:01.470' AS DateTime), N'un', NULL, NULL, N'Active', N'asad', NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (15, CAST(N'01:21:00' AS Time), CAST(N'00:12:00' AS Time), N'g', N'copyright', N'http://example.com', N'aw@gmail.com', N'167', CAST(N'2019-08-29T21:36:57.217' AS DateTime), N'un', NULL, NULL, N'Active', N'ahmed', NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (16, CAST(N'02:12:00' AS Time), CAST(N'14:21:00' AS Time), N'defense', N'copyright', N'http://example.com', N'h@gmail.com', N'12', CAST(N'2019-08-29T21:54:04.080' AS DateTime), N'un', NULL, NULL, N'Active', N'ilyas', NULL)
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1014, CAST(N'11:11:00' AS Time), CAST(N'11:11:00' AS Time), N'defense', N'copyright', N'http://example.com', N'aw@gmail.com', N'12', CAST(N'2019-08-30T19:41:48.253' AS DateTime), N'i', NULL, NULL, N'Active', N'ilyas', N'/Images/b0ef6751-5866-4a44-94d9-8a7f498e62f4.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1015, CAST(N'12:32:00' AS Time), CAST(N'05:06:00' AS Time), N'defense', N'copyright', N'http://example.com', N'h@gmail.com', N'167', CAST(N'2019-08-30T19:46:24.450' AS DateTime), N'i', NULL, NULL, N'Active', N'ytyugty', N'/Images/b2d03bf4-0c75-4605-9727-c1905521780c.PNG')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1016, CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), N'defense', N'copyright', N'http://example.com', N'h@gmail.com', N'12', CAST(N'2019-08-31T14:45:06.823' AS DateTime), N'un', NULL, NULL, N'Active', N'theta', N'/Images/3eb68b84-f3d2-4eba-b6b7-75ed137327a1.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1017, CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), N'defense', N'copyright', N'http://example.com', N'h@gmail.com', N'12', CAST(N'2019-08-31T14:45:30.053' AS DateTime), N'un', NULL, NULL, N'Active', N'theta', N'/Images/bd0c5914-ae6e-40be-87cf-7f512c1e6fc2.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1018, CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), N'sila', N'copyright', N'http://example.com', N'abc@gmail.com', N'167', CAST(N'2019-08-31T15:05:47.857' AS DateTime), N'we', NULL, NULL, N'Active', N'ilyas', N'/Images/e7c67db1-77dd-4988-a4dc-221b3d698be9.PNG')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1019, CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), N'sila', N'copyright', N'http://example.com', N'erd@gmail.com', N'123', CAST(N'2019-08-31T15:07:00.823' AS DateTime), N'we', NULL, NULL, N'Active', N'db', N'/Images/167f7098-7319-45f9-9b74-bb319f4b96e2.PNG')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1021, CAST(N'08:13:00' AS Time), CAST(N'06:13:00' AS Time), N'ass', N'assd', N'https://www.webs.com › themes', N's@a', N'123', CAST(N'2019-09-06T16:26:04.253' AS DateTime), NULL, NULL, NULL, N'Active', N'hitech', N'/Images/109af94e-dc36-4af6-aa3a-ee6536d15421.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1022, CAST(N'12:00:00' AS Time), CAST(N'11:00:00' AS Time), N'asa', N'asa', N' http://example.com', N'gs@gmail.com', N'123', CAST(N'2019-09-08T19:23:14.177' AS DateTime), N'ad', NULL, NULL, N'Active', N'techno', N'/Images/e783a05b-321f-49a3-8a08-0b17256a0a7b.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (1023, CAST(N'12:00:00' AS Time), CAST(N'13:00:00' AS Time), N'hjk', N'hkj ', N'http://example.com', N'f@gf', N'12', CAST(N'2019-09-08T20:05:00.067' AS DateTime), N'ad', NULL, NULL, N'Active', N'dera', N'/Images/c109f83b-2140-47f8-85b1-28faa114b2af.jpg')
INSERT [dbo].[Company] ([Company_id], [in_time], [out_time], [address], [policies], [web_address], [email], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name], [logo_design]) VALUES (2014, CAST(N'12:00:00' AS Time), CAST(N'11:00:00' AS Time), N'qw', N'qw', N'http://www.example.com', N'a@e', N'12', CAST(N'2019-09-14T14:03:26.337' AS DateTime), N'hero', NULL, NULL, N'Active', N'a', N'/Images/b60479ee-3ea6-4e7e-b972-43fd02fada9e.png')
SET IDENTITY_INSERT [dbo].[Company] OFF
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1, 2, CAST(N'00:03:00' AS Time), CAST(N'00:23:00' AS Time), N'167', CAST(N'2019-08-22T21:16:34.470' AS DateTime), NULL, NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (2, 3, CAST(N'12:21:00' AS Time), CAST(N'02:13:00' AS Time), N'167', CAST(N'2019-08-29T13:38:49.607' AS DateTime), N'PkUser', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (3, 3, CAST(N'12:21:00' AS Time), CAST(N'02:13:00' AS Time), N'167', CAST(N'2019-08-29T13:40:34.820' AS DateTime), N'PkUser', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (8, 5, CAST(N'02:12:00' AS Time), CAST(N'00:21:00' AS Time), N'167', CAST(N'2019-08-29T13:52:05.267' AS DateTime), N'PkUser', NULL, NULL, N'Inactive', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (9, 5, CAST(N'02:12:00' AS Time), CAST(N'00:21:00' AS Time), N'167', CAST(N'2019-08-29T13:52:31.770' AS DateTime), N'PkUser', NULL, NULL, N'Inactive', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1002, 13, CAST(N'00:12:00' AS Time), CAST(N'02:12:00' AS Time), N'199999999999999999999999', CAST(N'2019-09-04T13:02:08.443' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1003, 1021, CAST(N'00:12:00' AS Time), CAST(N'02:12:00' AS Time), N'123', CAST(N'2019-09-06T17:27:40.050' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1004, 14, CAST(N'11:00:00' AS Time), CAST(N'10:00:00' AS Time), N'12', CAST(N'2019-09-06T17:53:33.083' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1005, 13, CAST(N'11:00:00' AS Time), CAST(N'11:00:00' AS Time), N'156', CAST(N'2019-09-06T18:10:55.510' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1006, 1022, NULL, CAST(N'12:00:00' AS Time), N'123', CAST(N'2019-09-08T19:23:30.507' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1007, 1023, NULL, CAST(N'12:00:00' AS Time), N'234', CAST(N'2019-09-08T20:05:34.587' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1008, 13, NULL, CAST(N'03:00:00' AS Time), N'123', CAST(N'2019-09-08T21:18:33.793' AS DateTime), N'ad', NULL, NULL, N'Active', NULL)
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1009, 13, NULL, CAST(N'13:00:00' AS Time), N'123', CAST(N'2019-09-10T18:23:29.447' AS DateTime), N'ad', NULL, NULL, N'Active', N'designing')
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (1010, 13, NULL, CAST(N'12:13:00' AS Time), N'121', CAST(N'2019-09-10T20:31:47.833' AS DateTime), N'ad', NULL, NULL, N'Active', N'analysis')
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (2009, 13, NULL, NULL, N'123', CAST(N'2019-09-14T12:12:16.460' AS DateTime), N'hero', NULL, NULL, N'Active', N'hec')
INSERT [dbo].[Department] ([Department_id], [Company], [in_time], [out_time], [phone_number], [created_date], [created_by], [modify_date], [modify_by], [status], [name]) VALUES (2010, 2, NULL, NULL, N'12', CAST(N'2019-09-14T14:05:03.990' AS DateTime), N'hero', NULL, NULL, N'Active', N'a')
SET IDENTITY_INSERT [dbo].[Department] OFF
SET IDENTITY_INSERT [dbo].[Employee] ON 

INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (1, 1, N'qw', N'abc@gmail.com', N'artist1', N'123', N'1', N'shahab road', N'qw', N'h', N'i', N'qw', CAST(N'2019-08-22' AS Date), CAST(N'00:12:00' AS Time), CAST(N'12:12:00' AS Time), CAST(N'2019-08-22T21:17:30.863' AS DateTime), NULL, NULL, NULL, N'Active', NULL)
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (2, 9, N'qwqw', N'f@gmail.com', N'qw', N'12', N'1212', N'qw', N'qw', N'qw', N'qwq', N'qwq', CAST(N'2019-09-26' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:21:00' AS Time), CAST(N'2019-09-04T12:27:41.910' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/1b8633ae-5745-47e8-ad9d-77344009bc3e.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (3, 3, N'qwq', N'fren.wer.ujk@gmail.com', N'qwq', N'stanlake15604', N'1212', N'qwq', N'qwq', N'qw', N'qwq', N'qwqw', CAST(N'2019-09-20' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), CAST(N'2019-09-04T12:31:18.110' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/492804e9-b000-4cae-8cdf-a2d00f9423b8.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (4, 1002, N'wqw', N'fren.wer.ujk@gmail.com', N'qw', N'stanlake15604', N'12', N'qawa', N'sas', N'sa', N'sasdas', N'sas', CAST(N'2019-09-14' AS Date), CAST(N'11:11:00' AS Time), CAST(N'11:11:00' AS Time), CAST(N'2019-09-04T13:05:17.330' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/2acec629-5194-456d-9fda-b5f6c81c55ee.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (5, 3, N'qe', N's@g', N'qw', N'123', N'123', N'ty', N'ty', N'person', N'as', N'hj', CAST(N'2019-09-13' AS Date), CAST(N'00:43:00' AS Time), CAST(N'03:43:00' AS Time), CAST(N'2019-09-06T18:12:41.037' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/52992b77-5238-4957-b22d-b72c8835b34f.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (6, 1002, N'qw', N'fren.wer.ujk@gmail.com', N'qwe', N'stanlake15604', N'123', N'as', N'qw', N'as', N'asa', N'asa', CAST(N'2019-09-25' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), CAST(N'2019-09-07T23:05:00.473' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/0872fe94-4eea-47b6-bf09-626ce33b489f.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (7, 1006, N'qw', N'as@gmail.com', N'qwe', N'123', N'123', N'as', N'as', N'asa', N'sa', N'sa', CAST(N'1211-12-12' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), CAST(N'2019-09-08T19:26:47.347' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/3aedbcc3-2b14-4a80-a947-0e0b30494fcd.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (8, 1007, N'rt', N'f@fd', N'hj', N'46', N'687', N'tyghj', N'u', N'hyuj', N'jj', N'hguj', CAST(N'2323-12-13' AS Date), CAST(N'14:34:00' AS Time), CAST(N'12:13:00' AS Time), CAST(N'2019-09-08T20:06:40.080' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/71a40536-56ba-49ae-8c97-5eeca4545d9d.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (9, 1009, N'asa', N'fren.wer.ujk@gmail.com', N'qw', N'123', N'123', N'qwq', N'qwq', N'as', N'sa', N'sa', CAST(N'2019-09-13' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), CAST(N'2019-09-10T18:32:57.013' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/f364bc9e-8165-4b7a-b73d-fb7c56bec5c4.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (10, 1010, N'121', N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'wq', N'qw', N'qw', N'wq', CAST(N'2019-09-23' AS Date), CAST(N'08:00:00' AS Time), CAST(N'06:00:00' AS Time), CAST(N'2019-09-10T20:33:58.467' AS DateTime), N'ad', NULL, NULL, N'Active', N'/Images/6c0c5325-0e11-4fa0-98a6-2bcf69eda2a2.jpg')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (1009, 1010, N'qw', N'qw@q', N'qwe', N'qwe', N'123', N'as', N'sa', N'q', N'wq', N'wq', CAST(N'2019-09-26' AS Date), CAST(N'08:00:00' AS Time), CAST(N'18:00:00' AS Time), CAST(N'2019-09-12T21:35:07.117' AS DateTime), N'hero', NULL, NULL, N'Active', N'/Images/22798fe7-6f4d-4fcd-962b-2c81c169635a.png')
INSERT [dbo].[Employee] ([Employee_id], [Department], [qualification], [email], [username], [password], [phone_number], [address], [work_experience], [first_name], [last_name], [designation], [hire_date], [in_time], [out_time], [created_date], [created_by], [modify_date], [modify_by], [status], [images]) VALUES (1010, 1010, N'asa', N'a@fd', N'q', N'1212', N'12', N'jk', N'as', N'a', N's', N'a', CAST(N'2019-09-03' AS Date), CAST(N'00:12:00' AS Time), CAST(N'00:12:00' AS Time), CAST(N'2019-09-14T14:06:14.897' AS DateTime), N'hero', NULL, NULL, N'Active', N'/Images/a1be7742-16c5-4409-b09f-4d35f19d0738.png')
SET IDENTITY_INSERT [dbo].[Employee] OFF
SET IDENTITY_INSERT [dbo].[Holiday] ON 

INSERT [dbo].[Holiday] ([Holiday_id], [name], [created_date], [created_by], [modify_date], [modify_by], [status], [start_date], [end_date]) VALUES (1, N'public', CAST(N'2019-09-04T12:18:55.040' AS DateTime), N'ad', NULL, NULL, N'Active', CAST(N'2019-12-12' AS Date), CAST(N'2019-12-12' AS Date))
INSERT [dbo].[Holiday] ([Holiday_id], [name], [created_date], [created_by], [modify_date], [modify_by], [status], [start_date], [end_date]) VALUES (2, N'a', CAST(N'2019-09-14T14:07:34.553' AS DateTime), N'hero', NULL, NULL, N'Active', CAST(N'2019-09-20' AS Date), CAST(N'2019-09-10' AS Date))
SET IDENTITY_INSERT [dbo].[Holiday] OFF
SET IDENTITY_INSERT [dbo].[Overtime] ON 

INSERT [dbo].[Overtime] ([Overtime_id], [Department], [Employee], [extra_hours], [created_date], [created_by], [modify_date], [modify_by], [status]) VALUES (6, 1, 1, CAST(N'2019-09-04T00:12:00.000' AS DateTime), CAST(N'2019-09-25T00:12:00.000' AS DateTime), N'he', CAST(N'2019-09-05T00:12:00.000' AS DateTime), N'by', N'as')
INSERT [dbo].[Overtime] ([Overtime_id], [Department], [Employee], [extra_hours], [created_date], [created_by], [modify_date], [modify_by], [status]) VALUES (10, 2009, 1, CAST(N'2019-09-12T00:12:00.000' AS DateTime), CAST(N'2019-09-05T00:12:00.000' AS DateTime), N'vc', CAST(N'2019-09-11T02:12:00.000' AS DateTime), N'f', N'Active')
INSERT [dbo].[Overtime] ([Overtime_id], [Department], [Employee], [extra_hours], [created_date], [created_by], [modify_date], [modify_by], [status]) VALUES (11, 2009, 1, CAST(N'2019-09-12T00:12:00.000' AS DateTime), CAST(N'2019-09-05T00:12:00.000' AS DateTime), N'vc', CAST(N'2019-09-11T02:12:00.000' AS DateTime), N'f', N'Active')
SET IDENTITY_INSERT [dbo].[Overtime] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (33, N'ac@gmail.com', N'defense', N'123', N'123', N't', N'edsasad', NULL, NULL, CAST(N'2019-08-22T21:06:23.060' AS DateTime), NULL, N'Active', N'un', N'admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (34, N'abc@gmail.com', N'defense', N'156', N'156', N'qw', N'j', CAST(N'2019-08-24T00:36:29.063' AS DateTime), NULL, NULL, NULL, N'Active', N'ab', N'staff', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (35, N'aw@gmail.com', N'defense', N'123', N'55', N'dffsdz', N'rt', CAST(N'2019-08-24T01:10:09.087' AS DateTime), N'ab', NULL, NULL, N'Active', N'y', N'admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (36, N'z@gmail.com', N'colony', N'156', N'321', N'k', N'u', CAST(N'2019-08-24T01:23:20.420' AS DateTime), NULL, NULL, NULL, N'Active', N'u', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (37, N'f@gmail.com', N'shahab road', N'1', N'123', N'h', N'i', CAST(N'2019-08-24T01:32:33.673' AS DateTime), NULL, NULL, NULL, N'Active', N'y', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (38, N'f@gmail.com', N'colony', N'123', N'10', N'ty', N'rt', CAST(N'2019-08-27T11:49:05.183' AS DateTime), NULL, NULL, NULL, N'Active', N'new', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (39, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'12', N'10', N'12', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (40, N'abc@gmail.com', N'defense', N'123', N'123', N'h', N'i', CAST(N'2019-08-27T17:31:26.587' AS DateTime), NULL, NULL, NULL, N'Active', N'un', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (41, N'abc@gmail.com', N'defense', N'123', NULL, N'k', N'edsasad', CAST(N'2019-08-28T00:40:07.857' AS DateTime), NULL, NULL, NULL, N'Active', N'y', N'Admin', NULL, NULL, NULL, N'/Images/09b48045-bb22-4228-b112-3ea96ea32648.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (42, N'abc@gmail.com', N'defense', N'123', N'123', N'dffsdz', N'u', CAST(N'2019-08-28T09:45:23.657' AS DateTime), NULL, NULL, NULL, N'Active', N'un', N'Admin', NULL, NULL, NULL, N'/Images/a699fb56-7f18-46ee-be22-e34f2b33eefb.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (43, N'now@gmail.com', N'defense', N'123', NULL, N'h', N'w', CAST(N'2019-08-28T19:39:02.440' AS DateTime), NULL, NULL, NULL, N'Active', N'po', N'Admin', NULL, NULL, NULL, N'/Images/dadf9fa7-7bea-44ef-8e2e-e5b975e1bf50.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (44, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'17', N'15', N'17', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (45, NULL, NULL, NULL, N'100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', N'15', NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (46, NULL, NULL, NULL, N'100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', N'15', NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (47, N'abc@gmail.com', N'defense', N'123', NULL, N'h', N'i', CAST(N'2019-08-28T21:30:42.103' AS DateTime), NULL, NULL, NULL, N'Active', N'u', N'Admin', NULL, NULL, NULL, N'/Images/536b7911-3d9f-4537-bdb2-5990e199a7a7.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (48, NULL, NULL, NULL, N'16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', NULL, N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (49, N'ab@gmail.com', N'defense', N'123', N'16', N'qw', N'rt', CAST(N'2019-08-28T21:33:33.253' AS DateTime), NULL, NULL, NULL, N'Active', N'emp', N'Admin', NULL, NULL, NULL, N'/Images/8f96642d-fe4a-49f5-a97d-147a1aa5e1cb.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (50, NULL, NULL, NULL, N'16', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', NULL, N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (51, NULL, NULL, NULL, N'100', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', NULL, N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (52, N'friend@gmail.com', N'defense', N'123', N'11', N'h', N'rt', CAST(N'2019-08-29T00:56:44.890' AS DateTime), NULL, NULL, NULL, N'Active', N'friend', N'Admin', NULL, NULL, NULL, N'/Images/2eef9a1b-1c3c-47d8-b831-08b6ce5507aa.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (53, N'abc@gmail.com', N'defense', N'123', N'199', N't', N'j', CAST(N'2019-08-29T11:45:37.757' AS DateTime), NULL, NULL, NULL, N'Active', N't', N'Admin', NULL, NULL, NULL, N'/Images/9ac6f42b-9b6c-4b2b-806a-4b6c61cea70f.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (54, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', N'13', N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (55, N'hi@gmail.com', N'shahab road', N'1231231231', N'1122', N'developer', N'student', CAST(N'2019-08-29T12:07:51.287' AS DateTime), NULL, NULL, NULL, N'Active', N'PkUser', N'Admin', NULL, NULL, NULL, N'/Images/4700c2ce-ccde-4d6c-b548-dd7e825f8ecd.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (56, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1122', N'15604', N'1122', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (1041, N'abc@gmail.com', N'defense', N'123', N'123', N'h', N'i', CAST(N'2019-08-29T23:46:04.510' AS DateTime), NULL, NULL, NULL, N'Active', N'un', N'Admin', NULL, NULL, NULL, N'/Images/8e040688-ac19-4fbb-adcc-86348ea5bfc8.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2041, N'abc@gmail.com', N'defense', N'123', N'as', N'k', N'rt', CAST(N'2019-08-30T16:28:41.163' AS DateTime), N'un', NULL, NULL, N'Active', N'qw', N'Admin', NULL, NULL, NULL, N'/Images/db6a3fec-9780-4936-8ec4-fa3d15d8786c.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2042, N'abc@gmail.com', N'defense', N'123', N'20', N'h', N'i', CAST(N'2019-08-30T17:24:01.807' AS DateTime), NULL, NULL, NULL, N'Active', N'rt', N'Admin', NULL, NULL, NULL, N'/Images/6038c86b-76a5-47e0-8024-b949033ee1dd.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2043, N'now@gmail.com', N'defense', N'123', N'57', N'qw', N'edsasad', CAST(N'2019-08-30T19:40:09.083' AS DateTime), NULL, NULL, NULL, N'Active', N'i', N'Admin', NULL, NULL, NULL, N'/Images/7a75a9cb-05ae-4b42-a2e8-1f594eb611f4.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2044, N'now@gmail.com', N'defense', N'123', N'100', N't', N'w', CAST(N'2019-08-30T19:48:16.530' AS DateTime), NULL, NULL, NULL, N'Active', N'h', N'Admin', NULL, NULL, NULL, N'/Images/d0e0f4e4-9cb9-4167-a681-eed3f4836856.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2045, N'abc@gmail.com', N'defense', N'123', N'15', N'k', N'rt', CAST(N'2019-08-30T22:47:24.643' AS DateTime), NULL, NULL, NULL, N'Active', N'er', N'Admin', NULL, NULL, NULL, N'/Images/c7510d4e-0c5c-4fe4-8e3a-0eb0a8aad227.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2046, N'fren.wer.ujk@gmail.com', N'defense', N'156', N'15604', N'ty', N'edsasad', CAST(N'2019-08-30T22:53:03.853' AS DateTime), NULL, NULL, NULL, N'Active', N'fren', N'Admin', NULL, NULL, NULL, N'/Images/b8e3ffcf-7975-4a27-a7f1-5de7a7a86d8b.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2047, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'15604', N'stanlake15604', N'15604', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2048, N'abc@gmail.com', N'defense', N'129', N'567', N'ty', N'kio', NULL, NULL, CAST(N'2019-08-30T23:18:59.210' AS DateTime), N'b', N'Active', N'b', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2049, N'developervideo3@gmail.com', N'defense', N'123', N'18', N'h', N'i', CAST(N'2019-08-31T12:34:08.147' AS DateTime), NULL, NULL, NULL, N'Active', N'video', N'Admin', NULL, NULL, NULL, N'/Images/37f4f625-2661-4872-a7c9-516b369c50dd.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2050, N'abc@gmail.com', N'dr', N'123', N'123', N'h', N'u', CAST(N'2019-08-31T14:36:58.777' AS DateTime), NULL, NULL, NULL, N'Active', N'gy', N'Admin', NULL, NULL, NULL, N'/Images/fa8dbbc1-5b80-4313-ae0a-9cb2d3dfe354.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2051, N'abc@gmail.com', N'dr', N'123', N'123', N'h', N'u', CAST(N'2019-08-31T14:37:55.380' AS DateTime), NULL, NULL, NULL, N'Active', N'gy', N'Admin', NULL, NULL, NULL, N'/Images/18fa9ca1-0ebe-4332-b538-2f8154ef326e.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2052, N'abc@gmail.com', N'defense', N'156', N'18', N'dffsdz', N'i', CAST(N'2019-08-31T14:42:08.600' AS DateTime), NULL, NULL, NULL, N'Active', N'new', N'Admin', NULL, NULL, NULL, N'/Images/ad557a4e-f36e-4841-a503-df58d433a2ac.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2053, N'abc@gmail.com', N'defense', N'123', N'20', N'k', N'j', NULL, NULL, CAST(N'2019-08-31T15:36:17.177' AS DateTime), N'we', N'Active', N'we', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2054, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'21', N'20', N'21', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2055, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'20', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2056, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'20', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2057, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'199', N'20', N'199', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2058, N'samy@gmail.com', N'sas', N'12121', N'1000', N'ewewewqe', N'sadwewewqweq', NULL, NULL, CAST(N'2019-08-31T15:57:47.013' AS DateTime), N'boy', N'Active', N'boy', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2059, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'300', N'200', N'300', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2060, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'600', N'500', N'600', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2061, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'1000', N'700', N'1000', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2062, N'saa@gmail.com', N'sas', N'123', N'sasa', N'gh', N'dsa', CAST(N'2019-09-03T00:26:20.700' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/6edece8c-682f-4a5e-bcc3-d71119d41429.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2063, N'saa@gmail.com', N'sas', N'123', N'sasa', N'gh', N'dsa', CAST(N'2019-09-03T00:35:48.823' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/120565a3-f847-4fd7-b04b-04d95a8da162.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2064, N'saa@gmail.com', N'sas', N'123', N'sasa', N'gh', N'dsa', CAST(N'2019-09-03T00:36:09.883' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/6558943f-5ef8-4a6b-8b70-900f72bf1f95.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2065, N'saa@gmail.com', N'sas', N'123', N'sasa', N'gh', N'dsa', CAST(N'2019-09-03T00:43:31.900' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/0a16e36f-0d9f-4de7-9085-eed8402036d6.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2066, N'saa@gmail.com', N'sas', N'123', N'123', N'gh', N'dsa', CAST(N'2019-09-03T00:43:49.530' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/db7534a9-3da6-4891-b66d-46dad23f787d.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2067, N'saa@gmail.com', N'sas', N'123', N'123', N'gh', N'dsa', CAST(N'2019-09-03T00:44:08.433' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/c539f0cb-99be-475e-b929-cad356a5270d.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2068, N'saa@gmail.com', N'sas', N'123', N'123', N'gh', N'dsa', CAST(N'2019-09-03T01:02:49.043' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/f6188e11-9b77-4780-901d-57c935e10c64.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2069, N'saa@gmail.com', N'sas', N'123', N'123', N'gh', N'dsa', CAST(N'2019-09-03T01:04:46.903' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/4b597b5a-6434-47af-9923-2f1e9f9bba0d.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2070, N'saa@gmail.com', N'sas', N'123', N'100', N'gh', N'dsa', CAST(N'2019-09-03T01:05:01.450' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/4d9c90c8-2e39-4ae9-a9c3-808425aa1725.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2071, N'saa@gmail.com', N'sas', N'123', N'100', N'gh', N'dsa', CAST(N'2019-09-03T01:08:00.150' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/5537b76f-567f-4456-abb6-d9845aa8e08b.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2072, N'saa@gmail.com', N'sas', N'123', N'100', N'gh', N'dsa', CAST(N'2019-09-03T01:09:52.240' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/4c474569-990e-48ef-8246-07fa0df83c8e.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2073, N'saa@gmail.com', N'sas', N'123', N'18', N'gh', N'dsa', CAST(N'2019-09-03T01:11:56.900' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/75783ff2-2efd-4e64-8685-5e0a20befd65.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2074, N'saa@gmail.com', N'sas', N'123', N'21', N'gh', N'dsa', CAST(N'2019-09-03T01:14:51.413' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'admin', NULL, NULL, NULL, N'/Images/c6f809dd-0c39-40ec-9aaf-1358d291e574.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2075, N'as@gmail.com', N'asa', N'1', N'as', N'as', N'as', CAST(N'2019-09-03T01:42:44.793' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'as', NULL, NULL, NULL, N'/Images/33dc1841-5069-4302-92f5-8aadbf987cbe.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2076, N'as@gmail.com', N'asa', N'1', N'as', N'as', N'as', CAST(N'2019-09-03T01:44:23.297' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'as', NULL, NULL, NULL, N'/Images/94649908-ced8-4c86-a78f-a5ad0b2bd2c8.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2077, N'as@gmail.com', N'asa', N'1', N'as', N'as', N'as', CAST(N'2019-09-03T01:45:34.607' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'as', NULL, NULL, NULL, N'/Images/3e730d9d-5b74-412e-b1c6-583685741ace.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2078, N'as@gmail.com', N'asa', N'1', N'as', N'as', N'as', CAST(N'2019-09-03T01:46:17.667' AS DateTime), NULL, NULL, NULL, N'Active', N'as', N'as', NULL, NULL, NULL, N'/Images/3d144047-cff5-4f13-9e70-2853553b2eb5.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2079, N'sa@gmail.com', N'sa', N'12', N'sa', N'sa', N'sa', CAST(N'2019-09-03T02:03:18.797' AS DateTime), NULL, NULL, NULL, N'Active', N'12', N'admin', NULL, NULL, NULL, N'/Images/d885f350-8c5d-45f3-b75b-1df38f3358a5.txt')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2081, N'f@we', N'wqe', N'12', N'13', N'wq', N'qw', CAST(N'2019-09-03T08:14:57.130' AS DateTime), NULL, NULL, NULL, N'Active', N'ad', N'Admin', NULL, NULL, NULL, N'/Images/73635cc8-9d8d-42da-b775-79f5cd53ad8f.PNG')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2082, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'12', N'12', N'12', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2083, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'13', N'12', N'13', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2084, N'abdev@gmail.com', N'defense r', N'12', N'15', N'buddy', N'asd', NULL, NULL, CAST(N'2019-09-03T15:31:40.270' AS DateTime), N'qi', N'Active', N'qi', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2085, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'15', N'12', N'15', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2086, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'15', N'12', N'15', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2087, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'21', N'15', N'21', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2088, N'azc@gmail.com', N'as', N'123', N'20', N'as', N'ad', CAST(N'2019-09-03T15:38:40.350' AS DateTime), NULL, NULL, NULL, N'Active', N'wr', N'Admin', NULL, NULL, NULL, N'/Images/2cc3f2ee-ddaf-4839-a381-60df035c3c02.png')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2089, N'agi@gmail.com', N'qw', N'12', N'18', N'qw', N'wq', NULL, NULL, CAST(N'2019-09-03T16:02:04.937' AS DateTime), N'jik', N'Active', N'jik', N'Admin', NULL, NULL, NULL, NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2090, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'13', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2091, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'13', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2092, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'13', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2093, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', N'13', N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2094, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'21', N'13', N'21', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2095, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'21', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2096, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'21', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2097, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'21', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2098, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'21', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2099, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'100', N'21', N'100', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2100, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'21', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2101, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'19', N'2', N'19', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2102, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'55', N'19', N'55', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2103, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'19', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2104, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'as', N'18', N'as', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2105, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'13', N'12', N'13', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2106, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'13', N'12', N'13', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2107, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'18', N'13', N'18', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2108, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'20', N'18', N'20', NULL)
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2109, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T19:51:56.877' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/64d1c299-a12a-4dbd-a008-c40a5f5a47b1.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2110, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T20:02:07.287' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/95a6407f-beeb-4bdf-8929-19a6116042c7.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2111, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T20:08:11.100' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/9dfb016b-ddae-478b-ad3a-5f26f4f42044.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2112, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T20:09:07.463' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/d6f61a6f-7f0f-4bcd-9d2c-b11ad6180cbe.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2113, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T20:09:11.263' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/1c9f975f-b864-48cf-bdb0-d4ce707afcd0.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2114, N'fren.wer.ujk@gmail.com', N'as', N'123', N'123', N'qw', N'qw', CAST(N'2019-09-05T20:09:50.133' AS DateTime), NULL, NULL, NULL, N'Active', N'us', N'Admin', NULL, NULL, NULL, N'/Images/4a1339f5-b028-48dc-98f1-fce2b6e7a061.jpg')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (2115, N'd@gmail.com', N'qw', N'123', N'123', N'qw', N'wqw', CAST(N'2019-09-05T20:15:25.720' AS DateTime), NULL, NULL, NULL, N'Active', N'united', N'Admin', NULL, NULL, NULL, N'/Images/bbf557f7-0cd9-4344-8fcc-c10212bfdbf0.jpg')
GO
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (3041, N'qw@a', N'as', N'1213', N'123', N'qw', N'qw', CAST(N'2019-09-12T20:56:50.077' AS DateTime), NULL, NULL, NULL, N'Active', N'qw', N'Admin', NULL, NULL, NULL, N'/Images/df4b0a8b-58df-46b2-b494-5b914cfd2259.png')
INSERT [dbo].[User] ([User_id], [email], [address], [phone_number], [password], [first_name], [last_name], [created_date], [created_by], [modify_date], [modify_by], [status], [user_name], [role], [confirm_password], [old_password], [new_password], [images]) VALUES (3042, N'h@g', N'qw', N'123', N'123', N'hero', N'ji', CAST(N'2019-09-12T20:58:56.557' AS DateTime), NULL, NULL, NULL, N'Active', N'hero', N'Admin', NULL, NULL, NULL, N'/Images/b4a77885-0d02-4898-aed5-6d1914456ca4.png')
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Department]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Employee_id])
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_Employee]
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_Company] FOREIGN KEY([Company])
REFERENCES [dbo].[Company] ([Company_id])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_Company]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_Department]
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD  CONSTRAINT [FK_Overtime_Department] FOREIGN KEY([Department])
REFERENCES [dbo].[Department] ([Department_id])
GO
ALTER TABLE [dbo].[Overtime] CHECK CONSTRAINT [FK_Overtime_Department]
GO
ALTER TABLE [dbo].[Overtime]  WITH CHECK ADD  CONSTRAINT [FK_Overtime_Employee] FOREIGN KEY([Employee])
REFERENCES [dbo].[Employee] ([Employee_id])
GO
ALTER TABLE [dbo].[Overtime] CHECK CONSTRAINT [FK_Overtime_Employee]
GO
