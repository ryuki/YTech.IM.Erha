USE [DB_IM_ERHA]
GO
/****** Object:  Table [dbo].[M_ACTION]    Script Date: 10/19/2013 02:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_ACTION](
	[ACTION_ID] [nvarchar](50) NOT NULL,
	[ACTION_CAT_ID] [nvarchar](50) NULL,
	[ACTION_NAME] [nvarchar](100) NULL,
	[ACTION_PRICE] [numeric](18, 5) NULL,
	[ACTION_COMPONENT_TOOL] [numeric](18, 5) NULL,
	[ACTION_COMPONENT_MEDICIAN] [numeric](18, 5) NULL,
	[ACTION_COMPONENT_DOCTOR] [numeric](18, 5) NULL,
	[ACTION_COMPONENT_THERAPIST] [numeric](18, 5) NULL,
	[ACTION_STATUS] [nvarchar](50) NULL,
	[ACTION_DESC] [nvarchar](max) NULL,
	[DATA_STATUS] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_BY] [nvarchar](50) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[ROW_VERSION] [timestamp] NULL,
	[ACTION_COMPONENT_MEDICIAN_TYPE] [nvarchar](50) NULL,
	[ACTION_COMPONENT_DOCTOR_TYPE] [nvarchar](50) NULL,
	[ACTION_COMPONENT_THERAPIST_TYPE] [nvarchar](50) NULL,
 CONSTRAINT [PK_M_ACTION] PRIMARY KEY CLUSTERED 
(
	[ACTION_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_ACTION]  WITH CHECK ADD  CONSTRAINT [FK_M_ACTION_M_ACTION_CAT] FOREIGN KEY([ACTION_CAT_ID])
REFERENCES [dbo].[M_ACTION_CAT] ([ACTION_CAT_ID])
GO
ALTER TABLE [dbo].[M_ACTION] CHECK CONSTRAINT [FK_M_ACTION_M_ACTION_CAT]
GO
