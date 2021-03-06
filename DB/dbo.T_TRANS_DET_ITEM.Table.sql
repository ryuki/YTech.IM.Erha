USE [DB_IM_ERHA]
GO
/****** Object:  Table [dbo].[T_TRANS_DET_ITEM]    Script Date: 10/19/2013 02:38:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[T_TRANS_DET_ITEM](
	[TRANS_DET_ITEM_ID] [nvarchar](50) NOT NULL,
	[TRANS_DET_ID] [nvarchar](50) NULL,
	[ITEM_ID] [nvarchar](50) NULL,
	[ITEM_UOM_ID] [nvarchar](50) NULL,
	[ITEM_QTY] [decimal](18, 5) NULL,
	[ITEM_STATUS] [nvarchar](50) NULL,
	[ITEM_DESC] [nvarchar](max) NULL,
	[DATA_STATUS] [nvarchar](50) NULL,
	[CREATED_BY] [nvarchar](50) NULL,
	[CREATED_DATE] [datetime] NULL,
	[MODIFIED_BY] [nvarchar](50) NULL,
	[MODIFIED_DATE] [datetime] NULL,
	[ROW_VERSION] [timestamp] NULL,
 CONSTRAINT [PK_T_TRANS_DET_ITEM] PRIMARY KEY CLUSTERED 
(
	[TRANS_DET_ITEM_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_T_TRANS_DET_ITEM_M_ITEM] FOREIGN KEY([ITEM_ID])
REFERENCES [dbo].[M_ITEM] ([ITEM_ID])
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM] CHECK CONSTRAINT [FK_T_TRANS_DET_ITEM_M_ITEM]
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_T_TRANS_DET_ITEM_M_ITEM_UOM] FOREIGN KEY([ITEM_UOM_ID])
REFERENCES [dbo].[M_ITEM_UOM] ([ITEM_UOM_ID])
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM] CHECK CONSTRAINT [FK_T_TRANS_DET_ITEM_M_ITEM_UOM]
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM]  WITH CHECK ADD  CONSTRAINT [FK_T_TRANS_DET_ITEM_T_TRANS_DET] FOREIGN KEY([TRANS_DET_ID])
REFERENCES [dbo].[T_TRANS_DET] ([TRANS_DET_ID])
GO
ALTER TABLE [dbo].[T_TRANS_DET_ITEM] CHECK CONSTRAINT [FK_T_TRANS_DET_ITEM_T_TRANS_DET]
GO
