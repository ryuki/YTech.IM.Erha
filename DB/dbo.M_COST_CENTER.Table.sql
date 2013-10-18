USE [DB_IM_ERHA]
GO
/****** Object:  Table [dbo].[M_COST_CENTER]    Script Date: 10/19/2013 02:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[M_COST_CENTER](
	[COST_CENTER_ID] [nvarchar](50) NOT NULL,
	[EMPLOYEE_ID] [nvarchar](50) NULL,
	[COST_CENTER_NAME] [nvarchar](50) NULL,
	[COST_CENTER_TOTAL_BUDGET] [numeric](18, 5) NULL,
	[COST_CENTER_STATUS] [nvarchar](50) NULL,
	[COST_CENTER_START_DATE] [datetime] NULL,
	[COST_CENTER_END_DATE] [datetime] NULL,
	[COST_CENTER_DESC] [nvarchar](max) NULL,
	[DATA_STATUS] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_BY] [nvarchar](50) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[ROW_VERSION] [timestamp] NULL,
 CONSTRAINT [PK_M_COST_CENTER] PRIMARY KEY CLUSTERED 
(
	[COST_CENTER_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[M_COST_CENTER]  WITH CHECK ADD  CONSTRAINT [FK_M_COST_CENTER_M_EMPLOYEE] FOREIGN KEY([EMPLOYEE_ID])
REFERENCES [dbo].[M_EMPLOYEE] ([EMPLOYEE_ID])
GO
ALTER TABLE [dbo].[M_COST_CENTER] CHECK CONSTRAINT [FK_M_COST_CENTER_M_EMPLOYEE]
GO
